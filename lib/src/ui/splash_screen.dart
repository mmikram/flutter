import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ocr_ovd_mobile/src/router/app_route.dart';
import 'package:ocr_ovd_mobile/src/router/app_route.gr.dart';
import 'package:ocr_ovd_mobile/src/router/injection.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2),
        ()=>getIt<AppRouter>().push(const LoginRoute())

    );

  }

  @override
  Widget build(BuildContext context) {
    return   Container(
      color: Colors.blueGrey,
      child: TextButton(onPressed: (){
       getIt<AppRouter>().push(const LoginRoute());
      }, child: const Text("Splash Screen")),
    );

  }
}
