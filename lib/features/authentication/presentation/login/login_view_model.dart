import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:robinhood_clone/features/authentication/domain/usecase/sign_in_use_case.dart';
import 'package:robinhood_clone/features/authentication/presentation/login/login_state.dart';

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel({required this.signInUseCase})
      : super(LoginState.idle);

  final SignInUseCase signInUseCase;
  
  Future<void> signInByPhoneNumber(String phoneNumber) async {}
}
