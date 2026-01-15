import 'package:e_commerce_app/features/auth/cubit/verify_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyCubit extends Cubit<VerifyState> {
  VerifyCubit() : super(VerifyInitial());

  final List<String> otp = List.filled(6, '');

  void onOtpChanged(int index, String value) {
    otp[index] = value;

    if (otp.every((e) => e.isNotEmpty)) {
      verifyOtp();
    }
  }

  Future<void> verifyOtp() async {
    emit(VerifyLoading());

    await Future.delayed(const Duration(seconds: 2));

    emit(VerifySuccess());

    // emit(VerifyError("Invalid code"));
  }
}
