import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:robinhood_clone/features/authentication/presentation/login/login_state.dart';
import 'package:robinhood_clone/features/authentication/presentation/login/login_view_model.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final loginProvider = StateNotifierProvider<LoginViewModel, LoginState>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return LoginViewModel(firebaseAuth: firebaseAuth);
});
