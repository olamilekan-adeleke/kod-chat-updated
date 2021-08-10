import '../../../../cores/components/custom_button.dart';
import '../../../../cores/components/custom_scaffold_widget.dart';
import '../../../../cores/components/custom_text_widget.dart';
import '../../../../cores/components/custom_textfiled.dart';
import '../../../../cores/utils/emums.dart';
import '../../../../cores/utils/navigator_service.dart';
import '../../../../cores/utils/route_name.dart';
import '../../../../cores/utils/sizer_utils.dart';
import '../../../../cores/utils/validator.dart';
import '../../../../features/auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen();

  static final LoginControllers loginControllers = Get.find<LoginControllers>();

  @override
  Widget build(BuildContext context) {
    return scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: sizerSp(20)),
            textWidget(
              'Login',
              fontWeight: FontWeight.w700,
              fontSize: sizerSp(30),
            ),
            textWidget(
              'Welcome Back!\nLogin to your account',
              fontWeight: FontWeight.w200,
              fontSize: sizerSp(14),
            ),
            SizedBox(height: sizerSp(20)),
            Center(
              child: SvgPicture.asset(
                'assets/images/login.svg',
                height: sizerSp(100),
                width: sizerSp(150),
              ),
            ),
            SizedBox(height: sizerSp(40)),
            KodTextField(
              hintText: 'Email',
              textEditingController: loginControllers.emailController,
              textInputType: TextInputType.emailAddress,
              validator: (String? value) =>
                  formFieldValidator(value, 'email', 3),
            ),
            SizedBox(height: sizerSp(10)),
            KodTextField(
              hintText: 'Password',
              isPassword: true,
              textEditingController: loginControllers.passwordController,
              validator: (String? value) =>
                  formFieldValidator(value, 'password', 5),
            ),
            SizedBox(height: sizerSp(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () =>
                      NavigationService.navigateTo(RouteName.forgotPassword),
                  child: textWidget(
                    'Forgot Password?',
                    fontWeight: FontWeight.w200,
                    fontSize: sizerSp(12),
                    textColor: Colors.blue,
                  ),
                ),
              ],
            ),
            SizedBox(height: sizerSp(40)),
            Obx(() {
              if (loginControllers.controllerStateEnum ==
                  ControllerState.busy) {
                return const CustomButton.loading();
              }
              return CustomButton(
                text: 'Login',
                onTap: () => loginControllers.loginUser(),
              );
            }),
            SizedBox(height: sizerSp(20)),
            GestureDetector(
              onTap: () => NavigationService.navigateTo(RouteName.signup),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  textWidget(
                    // ignore: avoid_escaping_inner_quotes
                    'Don\'t have an account? ',
                    fontWeight: FontWeight.w200,
                    fontSize: sizerSp(13),
                  ),
                  textWidget(
                    'Sign Up Here',
                    fontWeight: FontWeight.w200,
                    fontSize: sizerSp(13),
                    textColor: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
