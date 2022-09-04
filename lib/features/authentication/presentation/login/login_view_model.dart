import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:robinhood_clone/features/authentication/domain/usecase/login_use_case.dart';
import 'package:robinhood_clone/features/authentication/presentation/login/login_state.dart';

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel({required this.loginUseCase})
      : super(LoginState.idle);

  final LoginUseCase loginUseCase;
  
  Future<void> loginByPhoneNumber(String phoneNumber) async {}
}
