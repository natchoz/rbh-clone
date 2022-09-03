import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:robinhood_clone/features/authentication/domain/usecase/sign_in_use_case.dart';
import 'package:robinhood_clone/features/authentication/presentation/login/login_state.dart';
import 'package:robinhood_clone/features/authentication/presentation/login/login_view_model.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return SignInUseCase(firebaseAuth: firebaseAuth);
});

final loginProvider = StateNotifierProvider<LoginViewModel, LoginState>((ref) {
  final signInUseCase = ref.watch(signInUseCaseProvider);
  return LoginViewModel(signInUseCase: signInUseCase);
});
