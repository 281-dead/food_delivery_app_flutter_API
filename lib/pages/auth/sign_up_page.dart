import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hc_e_commerce_food_delivery/utils/colors.dart';
import 'package:hc_e_commerce_food_delivery/utils/dimensions.dart';
import 'package:hc_e_commerce_food_delivery/widgets/app_text_field.dart';
import 'package:hc_e_commerce_food_delivery/widgets/big_text.dart';
import "package:get/get.dart";

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordControlller = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var singUpImages = ["t.png", "f.png", "g.png"];
    return Scaffold(
      body: SingleChildScrollView(
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
            Container(
              width: Dimension.screenWidth / 2,
              height: Dimension.screenHeight / 13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius30),
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
            SizedBox(height: Dimension.height10),
            //tag
            RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
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
                        padding: EdgeInsets.only(right: Dimension.width15),
                        child: CircleAvatar(
                          radius: Dimension.radius30,
                          backgroundImage:
                              AssetImage("assets/image/${singUpImages[index]}"),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}
