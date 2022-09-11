import 'package:firebase_auth/firebase_auth.dart';
import 'package:robinhood_clone/features/authentication/domain/usecase/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(
    this.firebaseAuth,
  );

  final FirebaseAuth firebaseAuth;

  @override
  Future<void> loginByPhoneNumber(String phoneNumber) async {
    firebaseAuth.verifyPhoneNumber(
      phoneNumber: _formatPhoneNumber(phoneNumber),
      codeAutoRetrievalTimeout: _autoRetrieve,
      codeSent: _smsCodeSent,
      verificationCompleted: (PhoneAuthCredential authCredential) {
        _signIn(authCredential);
      },
      verificationFailed: _verifyFailed,
    );
  }

  String _formatPhoneNumber(String phoneNumber) {
    return phoneNumber.startsWith('0')
        ? phoneNumber.replaceRange(0, 1, '+66')
        : phoneNumber;
  }

  void _autoRetrieve(String verificationId) {
    // _verificationId = verificationId;
  }

  void _smsCodeSent(String verificationId, int? forceResendingToken) {
    // _verificationId = verificationId;
  }

  void _verifyFailed(FirebaseAuthException exception) {}

  Future<void> _signIn(AuthCredential authCredential) async {
    try {
     await firebaseAuth.signInWithCredential(authCredential);
    } on Exception catch (e) {}
  }
}
