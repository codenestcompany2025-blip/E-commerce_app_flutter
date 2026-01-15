import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isObscure = true;
  bool isRememberMe = false;

  void toggleVisibility() {
    isObscure = !isObscure;
    emit(LoginObscureChanged());
  }

  void toggleRememberMe(bool? value) {
    isRememberMe = value ?? false;
    emit(LoginRememberMeChanged());
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());

      //  api call
      await Future.delayed(const Duration(seconds: 2));

      emit(LoginSuccess());

      // emit(LoginError("Invalid credentials"));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
