import '../../../../cores/components/custom_button.dart';
import '../../../../cores/components/custom_scaffold_widget.dart';
import '../../../../cores/components/custom_text_widget.dart';
import '../../../../cores/components/custom_textfiled.dart';
import '../../../../cores/utils/emums.dart';
import '../../../../cores/utils/navigator_service.dart';
import '../../../../cores/utils/sizer_utils.dart';
import '../../../../cores/utils/validator.dart';
import '../../../../features/auth/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen();

  static final RegisterController registerController =
      Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return scaffold(
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(height: sizerSp(20)),
          textWidget(
            'Sign Up',
            fontWeight: FontWeight.w700,
            fontSize: sizerSp(30),
          ),
          textWidget(
            'Welcome To Elite!\nFill the form below to create an account',
            fontWeight: FontWeight.w200,
            fontSize: sizerSp(14),
          ),
          SizedBox(height: sizerSp(20)),
          Center(
            child: SvgPicture.asset(
              'assets/images/signup.svg',
              height: sizerSp(100),
              width: sizerSp(150),
            ),
          ),
          SizedBox(height: sizerSp(40)),
          Row(
            children: <Widget>[
              Expanded(
                child: KodTextField(
                  hintText: 'Firstname',
                  textEditingController: registerController.firstnameController,
                  validator: (String? value) =>
                      formFieldValidator(value, 'Firstname', 3),
                ),
              ),
              SizedBox(width: sizerSp(3)),
              Expanded(
                child: KodTextField(
                  hintText: 'Lastname',
                  textEditingController: registerController.lastnameController,
                  validator: (String? value) =>
                      formFieldValidator(value, 'Lastname', 3),
                ),
              ),
            ],
          ),
          SizedBox(height: sizerSp(10)),
          KodTextField(
            hintText: 'Email',
            textEditingController: registerController.emailController,
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: sizerSp(10)),
          KodTextField(
            hintText: 'Phone number',
            textEditingController: registerController.phoneController,
            textInputType: TextInputType.number,
            validator: (String? value) =>
                formFieldValidator(value, 'number', 10),
          ),
          SizedBox(height: sizerSp(10)),
          KodTextField(
            hintText: 'Password',
            textEditingController: registerController.passwordController,
            isPassword: true,
            validator: (String? value) =>
                formFieldValidator(value, 'password', 5),
          ),
          SizedBox(height: sizerSp(40)),
          Obx(() {
            if (registerController.controllerStateEnum ==
                ControllerState.busy) {
              return const CustomButton.loading();
            }

            return CustomButton(
              text: 'Sign Up',
              onTap: () => registerController.registerUser(),
            );
          }),
          SizedBox(height: sizerSp(20)),
          GestureDetector(
            onTap: () => NavigationService.goBack(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                textWidget(
                  'Already have an account? ',
                  fontWeight: FontWeight.w200,
                  fontSize: sizerSp(13),
                ),
                textWidget(
                  'LogIn',
                  fontWeight: FontWeight.w200,
                  fontSize: sizerSp(13),
                  textColor: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
