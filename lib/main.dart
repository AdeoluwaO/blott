import 'package:blott/core/routers/route_generator.dart';
import 'package:blott/core/utils/index.dart';
import 'package:blott/features/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blott',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(backgroundColor: AppColors.white),
      ),
      debugShowCheckedModeBanner: false,
      home: const Splashscreen(),
      scrollBehavior: const ScrollBehavior()
          .copyWith(physics: const BouncingScrollPhysics()),
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
  }
}