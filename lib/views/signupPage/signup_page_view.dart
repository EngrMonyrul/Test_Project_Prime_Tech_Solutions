// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretestpts/controllers/appToast/app_toast.dart';
import 'package:pretestpts/views/signinPage/providers/signin_page_provider.dart';
import 'package:pretestpts/views/signinPage/signin_page_view.dart';
import 'package:pretestpts/views/signupPage/providers/signup_page_provider.dart';
import 'package:provider/provider.dart';

class SignupPageView extends StatefulWidget {
  const SignupPageView({super.key});

  @override
  State<SignupPageView> createState() => _SignupPageViewState();
}

class _SignupPageViewState extends State<SignupPageView> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final signupPageProvider = Provider.of<SignupPageProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenSize.height * .13),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Image.asset(
                    'assets/images/img_mblLogo.png',
                  ),
                ),
                SizedBox(height: screenSize.height * .1),
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: screenSize.height * .01),
                const Text(
                  'SignUp your account',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: screenSize.height * .05),
                TextField(
                  controller: _name,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Image.asset(
                        'assets/icons/ic_mail.png',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * .02),
                TextField(
                  controller: _email,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    hintText: 'Type your email',
                    hintStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Image.asset(
                        'assets/icons/ic_mail.png',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * .02),
                TextField(
                  controller: _password,
                  textAlignVertical: TextAlignVertical.center,
                  obscureText: signupPageProvider.hidePassword,
                  decoration: InputDecoration(
                    hintText: 'Type your password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: signupPageProvider.hidePassword
                          ? const Icon(
                              CupertinoIcons.eye,
                              color: Colors.grey,
                            )
                          : const Icon(
                              CupertinoIcons.eye_slash,
                              color: Colors.grey,
                            ),
                      onPressed: () {
                        signupPageProvider.setShowPass();
                      },
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Image.asset(
                        'assets/icons/ic_lock.png',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * .07),
                GestureDetector(
                  onTap: () {
                    toggleOnSignIn(signupPageProvider: signupPageProvider);
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const BoxDecoration(
                      color: CupertinoColors.activeBlue,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * .01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SigninPageView()));
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: CupertinoColors.activeBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void toggleOnSignIn({required SignupPageProvider signupPageProvider}) async {
    if (_name.text.isEmpty || _email.text.isEmpty || _password.text.isEmpty) {
      appToast(
          context: context, color: Colors.red, text: "Fields can't be empty");
    } else {
      final success = await signupPageProvider.setSignUp(
          email: _email.text, password: _password.text, name: _name.text);
      if (success) {
        appToast(
            context: context,
            color: Colors.green,
            text: signupPageProvider.loginResponse.message.toString());
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SigninPageView()));
      } else {
        appToast(
            context: context,
            color: Colors.red,
            text: signupPageProvider.loginResponse.message.toString());
      }
    }
  }
}
