import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hc_e_commerce_food_delivery/base/custom_loader.dart';
import 'package:hc_e_commerce_food_delivery/base/show_snackbar.dart';
import 'package:hc_e_commerce_food_delivery/controller/auth_controller.dart';
import 'package:hc_e_commerce_food_delivery/pages/auth/sign_up_page.dart';
import 'package:hc_e_commerce_food_delivery/routes/routes_helper.dart';
import 'package:hc_e_commerce_food_delivery/utils/colors.dart';
import 'package:hc_e_commerce_food_delivery/utils/dimensions.dart';
import 'package:hc_e_commerce_food_delivery/widgets/app_text_field.dart';
import 'package:hc_e_commerce_food_delivery/widgets/big_text.dart';
import "package:get/get.dart";

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();

    void login(AuthController authController) {
      String password = passwordController.text.trim();
      String phone = phoneController.text.trim();

      if (phone.isEmpty) {
        showCustomSnackBar("Type in your phone number", title: "Phone number");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your passwordr", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar("Password must be at least 6 characters long",
            title: "Password lenght");
      } else {
        authController.login(phone, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RoutesHelper.getInitial());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(body: GetBuilder<AuthController>(builder: (authController) {
      return !authController.isLoading
          ? SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: Dimension.screenHeight * 0.05),
                  //logo
                  Container(
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: Dimension.radius20 * 4,
                        backgroundImage:
                            const AssetImage("assets/image/logo part 1.png"),
                      ),
                    ),
                  ),
                  //welcome
                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(left: Dimension.width20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello",
                          style: TextStyle(
                            fontSize: Dimension.font20 * 4,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Sign into your account",
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: Dimension.font20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Dimension.height30),
                  AppTextField(
                    textController: phoneController,
                    hintText: "Phone",
                    icon: Icons.phone,
                  ),
                  SizedBox(
                    height: Dimension.height20,
                  ),
                  AppTextField(
                    isObscure: true,
                    textController: passwordController,
                    hintText: "Password",
                    icon: Icons.password,
                  ),
                  SizedBox(height: Dimension.height30),
                  Row(
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Sign into your account",
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: Dimension.font20,
                          ),
                        ),
                      ),
                      SizedBox(width: Dimension.width20),
                    ],
                  ),
                  SizedBox(height: Dimension.screenHeight * 0.05),

                  GestureDetector(
                    onTap: () {
                      login(authController);
                    },
                    child: Container(
                      width: Dimension.screenWidth / 2,
                      height: Dimension.screenHeight / 13,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.radius15),
                        color: AppColors.mainColor,
                      ),
                      child: Center(
                        child: BigText(
                          text: "Sign in",
                          size: Dimension.font30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: Dimension.screenHeight * 0.03),
                  //sign up option
                  RichText(
                    text: TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimension.font20,
                        ),
                        children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(const SignUpPage(),
                                    transition: Transition.fade),
                              text: " Create",
                              style: TextStyle(
                                color: AppColors.mainBlackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: Dimension.font20,
                              ))
                        ]),
                  ),
                ],
              ),
            )
          : const CustomLoader();
    }));
  }
}
