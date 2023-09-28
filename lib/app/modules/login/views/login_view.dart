import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:my_cash_book/app/utils/app_color.dart';
import 'package:my_cash_book/app/widgets/custom_input.dart';

import '../controllers/login_controller.dart';

// ignore: must_be_immutable
class LoginView extends GetView<LoginController> {
  late double mWidth;
  late double mHeight;
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    mWidth = MediaQuery.of(context).size.width;
    mHeight = MediaQuery.of(context).size.height;
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: mHeight,
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  'assets/images/logonbg.png',
                  width: mWidth / 1.5,
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Pasti Bisa Nabung',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      '',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInput(
                  controller: controller.usernameC,
                  label: "Username",
                  hint: "Masukkan username anda",
                ),
                Obx(
                  () => CustomInput(
                    controller: controller.passC,
                    label: "Password",
                    hint: "Masukkan password anda",
                    obsecureText: controller.obsecureText.value,
                    suffixIcon: IconButton(
                      icon: (controller.obsecureText != false)
                          ? SvgPicture.asset('assets/icons/show.svg')
                          : SvgPicture.asset('assets/icons/hide.svg'),
                      onPressed: () {
                        controller.obsecureText.value =
                            !(controller.obsecureText.value);
                      },
                    ),
                  ),
                )
              ],
            ),
            Obx(
              () => Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    if (controller.isLoading.isFalse) {
                      await controller.login();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    elevation: 0,
                    primary: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    (controller.isLoading.isFalse) ? 'Masuk' : 'Loading...',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  // Widget build(BuildContext context) {
  //   mWidth = MediaQuery.of(context).size.width;
  //   mHeight = MediaQuery.of(context).size.height;
  //   myColor = Theme.of(context).primaryColor;
  //   mediaSize = MediaQuery.of(context).size;
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: myColor,
  //       image: DecorationImage(
  //         image: const AssetImage("assets/images/bg.png"),
  //         fit: BoxFit.cover,
  //         colorFilter:
  //             ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop),
  //       ),
  //     ),
  //     child: Scaffold(
  //       backgroundColor: Colors.transparent,
  //       body: Stack(children: [
  //         Positioned(top: 80, child: _buildTop()),
  //         Positioned(bottom: 0, child: _buildBottom()),
  //       ]),
  //     ),
  //   );
  // }

  // Widget _buildTop() {
  //   return SizedBox(
  //     width: mediaSize.width,
  //     child: const Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Icon(
  //           Icons.location_on_sharp,
  //           size: 100,
  //           color: Colors.white,
  //         ),
  //         Text(
  //           "GO MAP",
  //           style: TextStyle(
  //               color: Colors.white,
  //               fontWeight: FontWeight.bold,
  //               fontSize: 40,
  //               letterSpacing: 2),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildBottom() {
  //   return SizedBox(
  //     width: mediaSize.width,
  //     child: Card(
  //       shape: const RoundedRectangleBorder(
  //           borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(30),
  //         topRight: Radius.circular(30),
  //       )),
  //       child: Padding(
  //         padding: const EdgeInsets.all(32.0),
  //         child: _buildForm(),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildForm() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         "Welcome",
  //         style: TextStyle(
  //             color: myColor, fontSize: 32, fontWeight: FontWeight.w500),
  //       ),
  //       _buildGreyText("Please login with your information"),
  //       const SizedBox(height: 60),
  //       _buildGreyText("Email address"),
  //       _buildInputField(emailController),
  //       const SizedBox(height: 40),
  //       _buildGreyText("Password"),
  //       _buildInputField(passwordController, isPassword: true),
  //       const SizedBox(height: 20),
  //       _buildRememberForgot(),
  //       const SizedBox(height: 20),
  //       _buildLoginButton(),
  //       const SizedBox(height: 20),
  //       _buildOtherLogin(),
  //     ],
  //   );
  // }

  // Widget _buildGreyText(String text) {
  //   return Text(
  //     text,
  //     style: const TextStyle(color: Colors.grey),
  //   );
  // }

  // Widget _buildInputField(TextEditingController controller,
  //     {isPassword = false}) {
  //   return TextField(
  //     controller: controller,
  //     decoration: InputDecoration(
  //       suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
  //     ),
  //     obscureText: isPassword,
  //   );
  // }

  // Widget _buildRememberForgot() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       // Row(
  //       //   children: [
  //       //     Checkbox(
  //       //         value: rememberUser,
  //       //         onChanged: (value) {
  //       //           setState(() {
  //       //             rememberUser = value!;
  //       //           });
  //       //         }),
  //       //     _buildGreyText("Remember me"),
  //       //   ],
  //       // ),
  //       TextButton(
  //           onPressed: () {}, child: _buildGreyText("I forgot my password"))
  //     ],
  //   );
  // }

  // Widget _buildLoginButton() {
  //   return ElevatedButton(
  //     onPressed: () {
  //       debugPrint("Email : ${emailController.text}");
  //       debugPrint("Password : ${passwordController.text}");
  //     },
  //     style: ElevatedButton.styleFrom(
  //       shape: const StadiumBorder(),
  //       elevation: 20,
  //       shadowColor: myColor,
  //       minimumSize: const Size.fromHeight(60),
  //     ),
  //     child: const Text("LOGIN"),
  //   );
  // }

  // Widget _buildOtherLogin() {
  // return Center(
  //     child: Column(
  //       children: [
  //         _buildGreyText("Or Login with"),
  //         const SizedBox(height: 10),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //           children: [
  //             Tab(icon: Image.asset("assets/images/facebook.png")),
  //             Tab(icon: Image.asset("assets/images/twitter.png")),
  //             Tab(icon: Image.asset("assets/images/github.png")),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }
}
