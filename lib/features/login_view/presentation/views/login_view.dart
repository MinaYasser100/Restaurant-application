import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_application/core/functions/email_vaildator.dart';
import 'package:restaurant_application/core/functions/navigator_to_page.dart';
import 'package:restaurant_application/core/functions/show_dialog_to_error.dart';
import 'package:restaurant_application/core/utils/constant.dart';
import 'package:restaurant_application/core/utils/shared_preference.dart';
import 'package:restaurant_application/core/widgets/cusrom_divider.dart';
import 'package:restaurant_application/core/widgets/custom_button_app.dart';
import 'package:restaurant_application/core/widgets/custom_text_from_field.dart';
import 'package:restaurant_application/core/widgets/google_button.dart';
import 'package:restaurant_application/features/forget_password/presentation/views/forget_password_view.dart';
import 'package:restaurant_application/features/home/presentation/views/howe_view.dart';
import 'package:restaurant_application/features/login_view/presentation/manager/login_cubit/login_cubit_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    emailController;
    passwordController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state is LoginCubitLoginUserSuccess) {
            try {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeView(),
                ),
                (route) => false,
              );
              await SharePreference.saveData(value: state.userId, key: kUserId);
              kToken = state.userId;
            } catch (e) {
              // ignore: use_build_context_synchronously
              showDialogToError(context, text: e.toString());
            }
          }
          print(kToken);
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            autovalidateMode:
                BlocProvider.of<LoginCubit>(context).autovalidateMode,
            child: Column(
              children: [
                const SizedBox(height: 25),
                CustomTextFromField(
                  controller: emailController,
                  textFromName: 'Email address',
                  validator: emailValidator,
                ),
                const SizedBox(height: 8),
                CustomTextFromField(
                  controller: passwordController,
                  textFromName: 'Password',
                  icon: BlocProvider.of<LoginCubit>(context).suffixIcon,
                  onPressedSuffixIcon: () {
                    BlocProvider.of<LoginCubit>(context).changeShowPassword();
                  },
                  obscureText:
                      BlocProvider.of<LoginCubit>(context).obscurePassword,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'Please, enter your password !';
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      navigatorToPage(
                          context: context, widget: const ForgetPasswordView());
                    },
                    child: const Text(
                      'Forget Password?',
                      style: TextStyle(
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                CustomButtonApp(
                  width: MediaQuery.of(context).size.width * 0.65,
                  text: 'Login',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<LoginCubit>(context).loginUserInApp(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    } else {
                      BlocProvider.of<LoginCubit>(context)
                          .changeAutovalidateMode();
                    }
                  },
                ),
                const SizedBox(height: 12),
                const CustomDivider(),
                const SizedBox(height: 12),
                const GoogleButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}
