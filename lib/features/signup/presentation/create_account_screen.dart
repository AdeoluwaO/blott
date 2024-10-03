import 'package:blott/core/helpers/extensions.dart';
import 'package:blott/core/routers/route_generator.dart';
import 'package:blott/core/utils/index.dart';
import 'package:blott/general_widgets.dart/index.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  // bool button

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
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(27),
          ),
          child: Icon(
            Icons.chevron_right_rounded,
            size: 40,
            color: AppColors.white,
          ),
        ).addTapGesture(onTap: () {
          Navigator.pushNamed(context, RouteGenerator.permissions);
        },),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Column(
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
          ),
          const Spacing.height(33),
          AppTextField(
            hintText: 'Last name',
            controller: _lastNameTextEditingController,
            validateFunction: AppValidators.notEmpty(),
          ),
        ],
      ),
    );
  }
}
