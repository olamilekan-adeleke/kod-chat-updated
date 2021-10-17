import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kod_chat/features/auth/model/user_details_model.dart';

class SearchService {
  final int limit = 15;
  static final CollectionReference userCollectionRef =
      FirebaseFirestore.instance.collection('users');

  Future<List<UserDetailsModel>?> searchUser(
    String query, {
    UserDetailsModel? lastResult,
  }) async {
    List<UserDetailsModel>? result;

    Query searchQuery = userCollectionRef
        .where('search_key', arrayContains: query)
        .limit(limit);

    if (lastResult != null) {
      searchQuery = searchQuery.startAfter(
        [lastResult.uid, lastResult.fullName],
      );
    }

    final QuerySnapshot querySnapshot =
        await searchQuery.get(GetOptions(source: Source.server));

    result = querySnapshot.docs
        .map((QueryDocumentSnapshot e) =>
            UserDetailsModel.fromMap(e.data() as Map<String, dynamic>))
        .toList();

    return result;
  }
}
