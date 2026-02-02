import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/core/assets_gen/assets.gen.dart';
import 'package:social_mate_app/features/widgets/custom_button.dart';
import 'package:social_mate_app/features/widgets/custom_textfield.dart';
import 'package:my_flutter_toolkit/ui/widgets/custom_divider.dart';
import 'package:social_mate_app/features/widgets/social_button.dart';
import 'package:social_mate_app/core/l10n/generated/l10n.dart';

class SignInTab extends StatefulWidget {
  const SignInTab({super.key});

  @override
  State<SignInTab> createState() => _SignInTabState();
}

class _SignInTabState extends State<SignInTab>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final strings = AppStrings.of(context);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            hintText: strings.emailOrPhoneHint,
            labelText: strings.emailOrPhoneLabel,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            focusNode: _emailFocusNode,
            textInputAction: TextInputAction.next,
            onSubmitted: (_) {
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
          ),
          24.verticalSpace,
          CustomTextField(
            hintText: strings.enterPassword,
            labelText: strings.passwordLabel,
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            focusNode: _passwordFocusNode,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) {
              FocusScope.of(context).unfocus();
            },
          ),
          8.verticalSpace,
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () {},
              child: Text(
                strings.forgotPassword,
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
          ),
          24.verticalSpace,
          CustomButton(title: strings.login, onPressed: () {}),
          24.verticalSpace,
          CustomDivider(
            title: strings.orSignInWith,
            textStyle: textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w400,
              color: colorScheme.onSurface,
            ),
          ),
          16.verticalSpace,
          Row(
            children: [
              Expanded(
                child: SocialButton(
                  title: strings.google,
                  icon: Assets.icons.google.path,
                  size: 24,
                  onTap: () {},
                ),
              ),
              8.horizontalSpace,
              Expanded(
                child: SocialButton(
                  title: strings.microsoft,
                  icon: Assets.icons.microsoft.path,
                  size: 20,
                  onTap: () {},
                ),
              ),
            ],
          ),
          30.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                strings.dontHaveAccount,
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () {},
                child: Text(
                  strings.signUp,
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: colorScheme.primary.withValues(alpha: 0.6),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
