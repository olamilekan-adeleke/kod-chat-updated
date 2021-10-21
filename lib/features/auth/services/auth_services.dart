import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/instance_manager.dart';
import '../../../cores/utils/local_database_controller.dart';
import '../../../cores/utils/firebase_messaging_utils.dart';
import '../../../cores/utils/logger.dart';
import '../../../features/auth/model/login_user_model.dart';
import '../../../features/auth/model/user_details_model.dart';

class AuthenticationRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final LocalDatabaseController localDatabaseController =
      Get.find<LocalDatabaseController>();
  final CollectionReference<dynamic> userCollectionRef =
      FirebaseFirestore.instance.collection('users');

  LoginUserModel? userFromFirestore(User? user) {
    return user != null ? LoginUserModel(user.uid) : null;
  }

  String? getUserUid() {
    return _firebaseAuth.currentUser?.uid;
  }

  Stream<LoginUserModel?> get userAuthState {
    return _firebaseAuth
        .authStateChanges()
        .map((User? user) => userFromFirestore(user));
  }

  Future<void> loginUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final User? user = userCredential.user;
    infoLog('userCredential: ${user?.uid}', title: 'user log in');

    final Map<String, dynamic> userData = await getLoggedInUser();
    userData.remove('date_joined');
    await localDatabaseController.saveUserDataToLocalDB(userData);
    await NotificationMethods.subscribeToTopice(user!.uid);
  }

  Future<bool> authenticateUser(String password) async {
    bool authenticated = false;
    final String email =
        (await localDatabaseController.getUserDataFromLocalDB())!.email;

    final UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

    if (userCredential.user != null) {
      authenticated = true;
    }

    return authenticated;
  }

  Future<void> registerUserWithEmailAndPassword(
    UserDetailsModel userDetails,
    String password,
  ) async {
    final UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: userDetails.email,
      password: password,
    );

    final User? user = userCredential.user;

    if (user == null) throw Exception('Opps, an error occured!');

    userDetails = userDetails.copyWith(uid: user.uid);

    // TODO: add phone number check

    infoLog('userCredential: ${user.uid}', title: 'user sign up');

    await addUserDataToFirestore(userDetails);

    await NotificationMethods.subscribeToTopice(user.uid);

    await localDatabaseController
        .saveUserDataToLocalDB(userDetails.toMapForLocalDb());
  }

  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
    infoLog('user email: $email', title: 'reset password');
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await localDatabaseController.clear();
      infoLog('user loging out', title: 'log out');
    } catch (e, s) {
      errorLog(
        e.toString(),
        'Error log out',
        title: 'log out',
        trace: s.toString(),
      );
      throw Exception('Error: $e');
    }
  }

  Future<void> addUserDataToFirestore(UserDetailsModel userDetails) async {
    await userCollectionRef.doc(userDetails.uid).set(userDetails.toMap());
    infoLog('Added User database', title: 'Add user data To Db');
  }

  Future<void> updateUserData(UserDetailsModel userDetails) async {
    try {
      await userCollectionRef.doc(userDetails.uid).update(userDetails.toMap());
      await localDatabaseController.saveUserDataToLocalDB(userDetails.toMap());
      infoLog('Upadted User database', title: 'Upadted user data To Db');
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> getLoggedInUser() async {
    final DocumentSnapshot<dynamic> documentSnapshot =
        await userCollectionRef.doc(getUserUid()).get();

    if (!documentSnapshot.exists) throw 'User Data Not Found!';

    return documentSnapshot.data() as Map<String, dynamic>;
  }
}
