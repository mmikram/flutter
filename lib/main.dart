import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ocr_ovd_mobile/src/feature/news/presentation/bloc/news_bloc.dart';
import 'package:ocr_ovd_mobile/src/feature/news/presentation/bloc/news_event.dart';
import 'package:ocr_ovd_mobile/src/router/app_route.dart';
import 'package:auto_route/auto_route.dart';

import 'package:ocr_ovd_mobile/src/router/injection.dart';

//import 'package:go_router/go_router.dart';
import 'package:ocr_ovd_mobile/src/ui/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appRouter = getIt<AppRouter>();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (context) => getIt()..add(const GetNews()),
      child: MaterialApp.router(
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
