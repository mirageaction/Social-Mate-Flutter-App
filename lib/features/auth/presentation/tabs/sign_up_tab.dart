import 'package:extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/core/assets_gen/assets.gen.dart';
import 'package:social_mate_app/core/di/di.dart';
import 'package:social_mate_app/core/services/toast_service.dart';
import 'package:social_mate_app/features/auth/bloc/auth_bloc.dart';
import 'package:social_mate_app/features/auth/domain/entities/sign_up_entity.dart';
import 'package:social_mate_app/features/widgets/custom_button.dart';
import 'package:social_mate_app/features/widgets/custom_textfield.dart';
import 'package:my_flutter_toolkit/ui/widgets/custom_divider.dart';
import 'package:social_mate_app/features/widgets/social_button.dart';
import 'package:social_mate_app/core/l10n/generated/l10n.dart';
import 'package:my_flutter_toolkit/core/utils/text_field_utils/validators.dart';

class SignUpTab extends StatefulWidget {
  const SignUpTab({super.key});

  @override
  State<SignUpTab> createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final strings = AppStrings.of(context);

    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) {
        return current is AuthFailure;
      },
      listener: (context, state) {
        if (state is AuthFailure) {
          getIt<ToastService>().showErrorToast(
            context: context,
            message: state.message,
          );
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            30.verticalSpace,
            CustomTextField(
              hintText: strings.nameHint,
              labelText: strings.nameLabel,
              controller: _nameController,
              keyboardType: TextInputType.name,
              focusNode: _nameFocusNode,
              validator: (value) =>
                  Validators.name(value: value, emptyMsg: strings.nameRequired),
              textInputAction: TextInputAction.next,
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(_emailFocusNode);
              },
            ),
            24.verticalSpace,
            CustomTextField(
              hintText: strings.emailOrPhoneHint,
              labelText: strings.emailOrPhoneLabel,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: _emailFocusNode,
              validator: (value) {
                final text = value ?? '';

                if (text.isEmail || !text.startsWith(RegExp(r'^\d+$'))) {
                  return Validators.email(
                    value: text,
                    errorMsg: strings.invalidEmail,
                    emptyMsg: strings.emailOrPhoneRequired,
                  );
                } else {
                  return Validators.phone(
                    value: text,
                    errorMsg: strings.egyptianPhoneError,
                    emptyMsg: strings.emailOrPhoneRequired,
                  );
                }
              },

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
              validator: (value) => Validators.password(
                value: value,
                warningPassLengthMsg: strings.passwordTooShort,
                emptyMsg: strings.passwordRequired,
                passwordLength: 6,
              ),
              textInputAction: TextInputAction.next,
              onSubmitted: (_) {
                FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
              },
            ),
            24.verticalSpace,
            CustomTextField(
              hintText: strings.confirmPasswordHint,
              labelText: strings.confirmPasswordLabel,
              controller: _confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              focusNode: _confirmPasswordFocusNode,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return strings.passwordRequired;
                }
                if (value != _passwordController.text) {
                  return strings.passwordsDoNotMatch;
                }
                return null;
              },
              textInputAction: TextInputAction.done,
              onSubmitted: (_) {
                FocusScope.of(context).unfocus();
              },
            ),

            30.verticalSpace,
            BlocSelector<AuthBloc, AuthState, bool>(
              selector: (state) {
                return state is AuthLoading;
              },
              builder: (context, isLoading) {
                return CustomButton(
                  isLoading: isLoading,
                  title: strings.joinNow,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                        SignUpEvent(
                          SignUpEntity(
                            emailOrPhone: _emailController.text,
                            password: _passwordController.text,
                            confirmPassword: _confirmPasswordController.text,
                            name: _nameController.text,
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
            30.verticalSpace,
            CustomDivider(
              title: strings.orSignUpWith,
              textStyle: textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w400,
                color: colorScheme.onSurface,
              ),
            ),
            24.verticalSpace,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  strings.termsAgreement,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  onPressed: () {},
                  child: Text(
                    strings.termsOfService,
                    style: textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: colorScheme.primary.withValues(alpha: 0.6),
                    ),
                  ),
                ),
              ],
            ),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
