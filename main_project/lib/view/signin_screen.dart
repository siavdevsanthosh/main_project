import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_project/controller/login_controller.dart';

class ScreenSignIn extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  ScreenSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('lib/assets/img/logo.png'),
              Container(
                height: screenHeight - 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              borderSide: BorderSide.none),
                          labelText: 'username',
                          labelStyle: TextStyle(color: Colors.grey.shade600),
                        ),
                        onChanged: (value) {
                          loginController.username.value = value;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              borderSide: BorderSide.none),
                          labelText: 'password',
                          labelStyle: TextStyle(color: Colors.grey.shade600),
                        ),
                        onChanged: (value) {
                          loginController.password.value = value;
                        },
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                                color: Colors.grey.shade600, fontSize: 16),
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            loginController.validateLogin();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text(
                            'sign in',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: RichText(
                          text: TextSpan(
                            text: 'Dont have an Account? ',
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' sign up',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}