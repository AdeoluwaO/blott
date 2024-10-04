import 'package:blott/core/routers/route_generator.dart';
import 'package:blott/core/store/profile_store/profile_store.dart';
import 'package:blott/core/utils/index.dart';
import 'package:blott/features/finance_digest/presentation/finance_digest_screen.dart';
import 'package:blott/features/signup/presentation/create_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        final response = await UserStore.getStoredProfile();
        setState(() {
          user = response;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blott',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(backgroundColor: AppColors.white),
      ),
      debugShowCheckedModeBanner: false,
      home: (user?.isLoggedIn ?? false)
          ? const FinanceDigestScreen()
          : const CreateAccountScreen(),
      scrollBehavior: const ScrollBehavior()
          .copyWith(physics: const BouncingScrollPhysics()),
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
  }
}
