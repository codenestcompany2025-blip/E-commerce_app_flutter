import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isObscure = true;
  bool isTermsAccepted = false;

  void toggleVisibility() {
    isObscure = !isObscure;
    emit(SignupObscureChanged());
  }

  void toggleTerms(bool? value) {
    isTermsAccepted = value ?? false;
    emit(SignupTermsChanged());
  }

  Future<void> signup() async {
    if (formKey.currentState!.validate()) {
      if (!isTermsAccepted) {
        emit(SignupError("You must agree to the terms"));
        return;
      }

      emit(SignupLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(SignupSuccess());
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
