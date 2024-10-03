import 'package:blott/core/routers/route_generator.dart';
import 'package:blott/core/utils/index.dart';
import 'package:blott/features/signup/presentation/create_account_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(backgroundColor: AppColors.white),
      ),
      debugShowCheckedModeBanner: false,
      home: const CreateAccountScreen(),
      scrollBehavior: const ScrollBehavior()
              .copyWith(physics: const BouncingScrollPhysics()),
          onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
  }
}
