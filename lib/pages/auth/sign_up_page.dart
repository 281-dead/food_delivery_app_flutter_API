import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hc_e_commerce_food_delivery/base/custom_loader.dart';
import 'package:hc_e_commerce_food_delivery/base/show_snackbar.dart';
import 'package:hc_e_commerce_food_delivery/controller/auth_controller.dart';
import 'package:hc_e_commerce_food_delivery/model/signup_body_model.dart';
import 'package:hc_e_commerce_food_delivery/routes/routes_helper.dart';
import 'package:hc_e_commerce_food_delivery/utils/colors.dart';
import 'package:hc_e_commerce_food_delivery/utils/dimensions.dart';
import 'package:hc_e_commerce_food_delivery/widgets/app_text_field.dart';
import 'package:hc_e_commerce_food_delivery/widgets/big_text.dart';
import "package:get/get.dart";

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordControlller = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  var singUpImages = ["t.png", "f.png", "g.png"];

  void registration(AuthController authController) {
    String name = nameController.text.trim();
    String password = passwordControlller.text.trim();
    String phone = phoneController.text.trim();
    String email = emailController.text.trim();
    if (name.isEmpty) {
      showCustomSnackBar("Type in your name", title: "Name");
    } else if (phone.isEmpty) {
      showCustomSnackBar("Type in your phone number", title: "Phone number");
    } else if (email.isEmpty) {
      showCustomSnackBar("Type in your email addredd", title: "Email address");
    } else if (!GetUtils.isEmail(email)) {
      showCustomSnackBar("Type in a valid  email address",
          title: "Valid email address");
    } else if (password.isEmpty) {
      showCustomSnackBar("Type in your passwordr", title: "Password");
    } else if (password.length < 6) {
      showCustomSnackBar("Password must be at least 6 characters long",
          title: "Password lenght");
    } else {
      SignUpBody signUpBody = SignUpBody(
          name: name, phone: phone, email: email, password: password);
      authController.registration(signUpBody).then((status) {
        if (status.isSuccess) {
          print("suscess register");
          Get.offNamed(RoutesHelper.getInitial());
        } else {
          showCustomSnackBar(status.message);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(builder: (authController) {
        return !authController.isLoading
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: Dimension.screenHeight * 0.05),
                    //image
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
                    SizedBox(
                      height: Dimension.height20,
                    ),
                    AppTextField(
                      textController: emailController,
                      hintText: "Email",
                      icon: Icons.email,
                    ),
                    SizedBox(
                      height: Dimension.height20,
                    ),
                    AppTextField(
                      isObscure: true,
                      textController: passwordControlller,
                      hintText: "Password",
                      icon: Icons.password,
                    ),
                    SizedBox(
                      height: Dimension.height20,
                    ),
                    AppTextField(
                      textController: nameController,
                      hintText: "Name",
                      icon: Icons.person,
                    ),
                    SizedBox(
                      height: Dimension.height20,
                    ), //email
                    AppTextField(
                      textController: phoneController,
                      hintText: "Phone",
                      icon: Icons.phone,
                    ),
                    SizedBox(
                      height: Dimension.height30,
                    ),
                    //sign up button
                    GestureDetector(
                      onTap: () {
                        registration(authController);
                      },
                      child: Container(
                        width: Dimension.screenWidth / 2,
                        height: Dimension.screenHeight / 13,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimension.radius15),
                          color: AppColors.mainColor,
                        ),
                        child: Center(
                          child: BigText(
                            text: "Sign up",
                            size: Dimension.font30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimension.height10),
                    //tag
                    RichText(
                      text: TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back(),
                        text: "Have an account already?",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimension.font20,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimension.screenHeight * 0.03),
                    //sign up option
                    RichText(
                      text: TextSpan(
                        text: "Sign up using one of the following methods",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimension.font20,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimension.screenHeight * 0.02),
                    Wrap(
                      children: List.generate(
                          3,
                          (index) => Padding(
                                padding:
                                    EdgeInsets.only(right: Dimension.width15),
                                child: CircleAvatar(
                                  radius: Dimension.radius15 + 5,
                                  backgroundImage: AssetImage(
                                      "assets/image/${singUpImages[index]}"),
                                ),
                              )),
                    ),
                  ],
                ),
              )
            : const CustomLoader();
      }),
    );
  }
}
