import 'dart:io';

import 'package:excel_hrm/features/authentication/provider/auth_provider.dart';
import 'package:excel_hrm/features/authentication/screens/sign_in_screen.dart';
import 'package:excel_hrm/features/authentication/widgets/landing_screen.dart';
import 'package:excel_hrm/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'di_container.dart' as di;
import 'package:provider/provider.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => di.sl<AuthProvider>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xff0B4461), // set status bar color
        statusBarBrightness: Brightness.light, // set status bar brightness
      ),
    );

    bool checktoken(dynamic token) {
      if (token == null || token == "") {
        return false;
      } else {
        return true;
      }
    }


    return Consumer<AuthProvider>(builder: (context,authProvider,child) {return  MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Excel HRM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: HomeScreen(),
      initialRoute: checktoken(authProvider.getUserToken()) == false ?SignInScreen.routeName : HomeScreen.routeName,
      routes: {
        SignInScreen.routeName: (context) => SignInScreen(),
        HomeScreen.routeName:(context) => HomeScreen(),

      },
    );});
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

