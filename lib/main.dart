import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pretestpts/views/homePage/home_page_view.dart';
import 'package:pretestpts/views/homePage/providers/home_page_provider.dart';
import 'package:pretestpts/views/signinPage/providers/signin_page_provider.dart';
import 'package:pretestpts/views/signinPage/signin_page_view.dart';
import 'package:pretestpts/views/signupPage/providers/signup_page_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('local_storage');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomePageProvider()),
        ChangeNotifierProvider(create: (context) => SigninPageProvider()),
        ChangeNotifierProvider(create: (context) => SignupPageProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SigninPageView(),
        theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
