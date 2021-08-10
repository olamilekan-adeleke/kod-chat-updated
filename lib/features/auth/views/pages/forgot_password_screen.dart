import 'package:kod_chat/cores/components/custom_scaffold_widget.dart';

import '../../../../cores/components/custom_button.dart';
import '../../../../cores/components/custom_text_widget.dart';
import '../../../../cores/components/custom_textfiled.dart';
import '../../../../cores/utils/emums.dart';
import '../../../../cores/utils/sizer_utils.dart';
import '../../../../features/auth/controllers/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen();

  static final ForgotPasswordController forgotPasswordController =
      Get.find<ForgotPasswordController>();

  @override
  Widget build(BuildContext context) {
    return scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: textWidget('', fontWeight: FontWeight.w700),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            textWidget(
              'Reset Password',
              fontWeight: FontWeight.w700,
              fontSize: sizerSp(30),
            ),
            textWidget(
              'Did You Forgot Your Password?\nEnter Your Email Below,'
              ' A Link Will Be Sent To That Email',
              fontWeight: FontWeight.w200,
              fontSize: sizerSp(12),
            ),
            SizedBox(height: sizerSp(20)),
            Center(
              child: SvgPicture.asset(
                'assets/images/forgot_password.svg',
                height: sizerSp(100),
                width: sizerSp(150),
              ),
            ),
            SizedBox(height: sizerSp(20)),
            KodTextField(
              hintText: 'Email',
              textEditingController: forgotPasswordController.emailController,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: sizerSp(80)),
            Obx(() {
              if (forgotPasswordController.controllerStateEnum ==
                  ControllerStateEnum.busy) {
                return const CustomButton.loading();
              }

              return CustomButton(
                text: 'Send',
                onTap: () => forgotPasswordController.sendEmail(),
              );
            }),
            SizedBox(height: sizerSp(20)),
          ],
        ),
      ),
    );
  }
}
