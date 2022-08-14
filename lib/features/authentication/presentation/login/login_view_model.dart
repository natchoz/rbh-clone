import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:robinhood_clone/features/authentication/presentation/login/login_state.dart';

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel({
    required this.firebaseAuth,
  }) : super(LoginState.idle);

  final FirebaseAuth firebaseAuth;

  Future<void> _login() async {
    firebaseAuth.signInWithAuthProvider(provider)
  }
}
