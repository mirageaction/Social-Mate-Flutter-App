import 'package:extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_mate_app/core/assets_gen/assets.gen.dart';
import 'package:social_mate_app/core/di/di.dart';
import 'package:social_mate_app/core/services/toast_service.dart';
import 'package:social_mate_app/features/auth/bloc/auth_bloc.dart';
import 'package:social_mate_app/features/auth/domain/entities/sign_in_entity.dart';
import 'package:social_mate_app/global/widgets/custom_button.dart';
import 'package:social_mate_app/global/widgets/custom_textfield.dart';
import 'package:my_flutter_toolkit/ui/widgets/custom_divider.dart';
import 'package:social_mate_app/global/widgets/social_button.dart';
import 'package:social_mate_app/core/l10n/generated/l10n.dart';
import 'package:my_flutter_toolkit/core/utils/text_field_utils/validators.dart';

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
            30.verticalSpace,
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
            BlocSelector<AuthBloc, AuthState, bool>(
              selector: (state) {
                return state is AuthLoading;
              },
              builder: (context, isLoading) {
                return CustomButton(
                  title: strings.login,
                  isLoading: isLoading,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                        SignInEvent(
                          SignInEntity(
                            emailOrPhone: _emailController.text,
                            password: _passwordController.text,
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
            24.verticalSpace,
            CustomDivider(
              title: strings.orSignInWith,
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
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
