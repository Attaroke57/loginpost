import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/LoginController.dart';
import 'package:loginpost/widget/my_texfield.dart';
import 'package:loginpost/widget/my_text.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            // Ganti Image.asset dengan Image.network
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTssT9QzcoXggdXdaZzAe5b7JOaKKkiCID8Hw&s", // Ganti URL ini dengan URL gambar Anda
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),
            Center(
              child: MyText(
                hintText: 'Jadikan Musik Bagian dari Hidup Anda.',
                fontSize: 18,
                colors: Colors.grey[700]!,
                fontFamily: 'NunitoSans',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            MyTextField(
              hintText: 'Username',
              controller: usernameController,
              icon: Icons.person_outline,
            ),
            MyTextField(
              hintText: 'Password',
              isPassword: true,
              controller: passwordController,
              icon: Icons.lock_outline,
            ),
            SizedBox(height: 16),
            Obx(() => ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.blueAccent),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                  onPressed: controller.isLoading.value
                      ? null
                      : () async {
                          if (usernameController.text.isEmpty ||
                              passwordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: MyText(
                                  hintText: "Nama dan password harus diisi!",
                                  fontSize: 16,
                                  colors: Colors.white,
                                ),
                                backgroundColor: Colors.redAccent,
                              ),
                            );
                          } else {
                            await controller.login(
                                usernameController.text,
                                passwordController.text);
                            if (controller.loginStatus.value ==
                                "Login success") {
                              Get.toNamed('/home');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: MyText(
                                    hintText: controller.loginStatus.value,
                                    fontSize: 16,
                                    colors: Colors.white,
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          }
                        },
                  child: controller.isLoading.value
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : MyText(
                          hintText: "Login",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          colors: Colors.white,
                        ),
                )),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 270),
              child: MyText(
                hintText: "Forgot Password?",
                fontSize: 16,
                fontWeight: FontWeight.w500,
                colors: Colors.black,
              ),
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  hintText: "Don't have an account? ",
                  fontSize: 16,
                  colors: Colors.black,
                ),
                GestureDetector(
                  onTap: () {},
                  child: MyText(
                    hintText: 'Sign Up',
                    fontSize: 16,
                    colors: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.tiktok, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.facebook, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
