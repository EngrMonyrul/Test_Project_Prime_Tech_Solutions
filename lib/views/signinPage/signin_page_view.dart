// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretestpts/controllers/appToast/app_toast.dart';
import 'package:pretestpts/controllers/localStorage/local_storage.dart';
import 'package:pretestpts/views/homePage/home_page_view.dart';
import 'package:pretestpts/views/homePage/providers/home_page_provider.dart';
import 'package:pretestpts/views/signinPage/providers/signin_page_provider.dart';
import 'package:pretestpts/views/signupPage/signup_page_view.dart';
import 'package:provider/provider.dart';

class SigninPageView extends StatefulWidget {
  const SigninPageView({super.key});

  @override
  State<SigninPageView> createState() => _SigninPageViewState();
}

class _SigninPageViewState extends State<SigninPageView> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  LocalStorage localStorage = LocalStorage();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final signinPageProvider = Provider.of<SigninPageProvider>(context);
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
                  'Sign in to your account',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: screenSize.height * .05),
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
                  obscureText: signinPageProvider.hidePassword,
                  decoration: InputDecoration(
                    hintText: 'Type your password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: signinPageProvider.hidePassword
                          ? const Icon(
                              CupertinoIcons.eye,
                              color: Colors.grey,
                            )
                          : const Icon(
                              CupertinoIcons.eye_slash,
                              color: Colors.grey,
                            ),
                      onPressed: () {
                        signinPageProvider.setShowPass();
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
                SizedBox(height: screenSize.height * .02),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    child: const Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: CupertinoColors.activeBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * .07),
                GestureDetector(
                  onTap: () {
                    toggleOnSignIn(signinPageProvider: signinPageProvider);
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
                      'Sign In',
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
                    const Text("Don't have any account?"),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupPageView()));
                      },
                      child: const Text(
                        'Sign Up',
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

  void toggleOnSignIn({required SigninPageProvider signinPageProvider}) async {
    final homePageProvider =
        Provider.of<HomePageProvider>(context, listen: false);
    if (_email.text.isEmpty || _password.text.isEmpty) {
      appToast(
          context: context, color: Colors.red, text: "Fields can't be empty");
    } else {
      final success = await signinPageProvider.setSignIn(
          email: _email.text, password: _password.text);
      if (success) {
        appToast(
            context: context,
            color: Colors.green,
            text: signinPageProvider.loginResponse.message.toString());
        await homePageProvider.setUserDetails();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomePageView()));
      } else {
        appToast(
            context: context,
            color: Colors.red,
            text: signinPageProvider.loginResponse.message.toString());
      }
    }
  }
}
