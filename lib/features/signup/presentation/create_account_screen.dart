import 'package:blott/core/routers/route_generator.dart';
import 'package:blott/core/store/profile_store/profile_store.dart';
import 'package:blott/core/utils/index.dart';
import 'package:blott/general_widgets.dart/index.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool buttonEnabled = false;

  final _firstNameTextEditingController = TextEditingController();
  final _lastNameTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const AppText(
          text: 'Your legal name',
          style: AppTextStyle.headlineMedium,
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
      ),
      floatingActionButton: AppIconButton(
        icon: Icons.chevron_right_rounded,
        height: 56,
        width: 56,
        borderRadius: BorderRadius.circular(27),
        paddingSelf: const EdgeInsets.only(bottom: 24),
        buttonEnabled: buttonEnabled,
        onTap: () async {
          final navigator =
              Navigator.of(context); // STORE THE CONTEXT BEFORE THE ASYNC GAP
          final user = User(
            firstName: _firstNameTextEditingController.text,
            lastName: _lastNameTextEditingController.text,
            isLoggedIn: true,
          );
          await UserStore.storeProfile(user);
          navigator.pushReplacementNamed(RouteGenerator.permissions);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              text:
                  'We need to know a bit about you so that we\ncan create your account.',
              style: AppTextStyle.bodyMedium,
            ),
            const Spacing.height(24),
            AppTextField(
              hintText: 'First name',
              controller: _firstNameTextEditingController,
              validateFunction: AppValidators.notEmpty(),
              onChange: (text) {
                setState(() {
                  buttonEnabled =
                      _firstNameTextEditingController.text.isNotEmpty &&
                          _lastNameTextEditingController.text.isNotEmpty;
                });
              },
            ),
            const Spacing.height(33),
            AppTextField(
              hintText: 'Last name',
              controller: _lastNameTextEditingController,
              validateFunction: AppValidators.notEmpty(),
              onChange: (text) {
                setState(() {
                  buttonEnabled =
                      _firstNameTextEditingController.text.isNotEmpty &&
                          _lastNameTextEditingController.text.isNotEmpty;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
