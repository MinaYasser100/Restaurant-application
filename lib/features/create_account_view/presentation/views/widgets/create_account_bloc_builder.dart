import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_application/core/functions/email_vaildator.dart';
import 'package:restaurant_application/core/functions/password_vaildator.dart';
import 'package:restaurant_application/core/functions/show_dialog_to_success.dart';
import 'package:restaurant_application/core/widgets/cusrom_divider.dart';
import 'package:restaurant_application/core/widgets/custom_button_app.dart';
import 'package:restaurant_application/core/widgets/google_button.dart';
import '../../../../../core/widgets/custom_text_from_field.dart';
import '../../manager/create_account_cubit/create_account_cubit.dart';

class CreateAccountBlocBulider extends StatelessWidget {
  const CreateAccountBlocBulider({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateAccountCubit, CreateAccountState>(
      listener: (context, state) {
        if (state is CreateAccounCubitRegisterUserSuccess) {
          showDialogToSuccess(context);
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode:
              BlocProvider.of<CreateAccountCubit>(context).autovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 18),
                CustomTextFromField(
                  controller: nameController,
                  textFromName: 'Full Name',
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'You must enter your name !';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                CustomTextFromField(
                  controller: emailController,
                  textFromName: 'Email address',
                  validator: emailValidator,
                ),
                const SizedBox(height: 8),
                CustomTextFromField(
                  controller: passwordController,
                  textFromName: 'Password',
                  validator: passwordVaildator,
                  icon: BlocProvider.of<CreateAccountCubit>(context).suffixIcon,
                  obscureText: BlocProvider.of<CreateAccountCubit>(context)
                      .obscurePassword,
                  onPressedSuffixIcon: () {
                    BlocProvider.of<CreateAccountCubit>(context)
                        .changeShowPassword();
                  },
                ),
                const SizedBox(height: 8),
                CustomTextFromField(
                  controller: phoneController,
                  textFromName: 'Your Phone',
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'You must enter your phone !';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 36),
                CustomButtonApp(
                  width: MediaQuery.of(context).size.width * 0.65,
                  text: 'Registration',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<CreateAccountCubit>(context)
                          .createAccountForUser(
                        email: emailController.text,
                        password: passwordController.text,
                        name: nameController.text,
                        phone: phoneController.text,
                      );
                    } else {
                      BlocProvider.of<CreateAccountCubit>(context)
                          .changeAutovalidateMode();
                    }
                  },
                ),
                const SizedBox(height: 12),
                const CustomDivider(),
                const SizedBox(height: 12),
                const GoogleButton(),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
