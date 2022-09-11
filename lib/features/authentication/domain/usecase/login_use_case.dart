import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginUseCaseProvider = Provider((ref) {
  return LoginUseCase(
    FirebaseAuth.instance,
  );
});

class LoginUseCase {
  LoginUseCase(
    this._firebaseAuth,
  );

  final FirebaseAuth _firebaseAuth;
  late String _verificationId;

  Future<void> loginByPhoneNumber(String phoneNumber) async {
    firebaseAuth.verifyPhoneNumber(
        phoneNumber: _formatPhoneNumber(phoneNumber),
        codeAutoRetrievalTimeout: _autoRetrieve,
        codeSent: _smsCodeSent,
        verificationCompleted: _verifySuccess,
        verificationFailed: _verifyFailed);
  }

  String _formatPhoneNumber(String phoneNumber) {
    return phoneNumber.startsWith('0')
        ? phoneNumber.replaceRange(0, 1, '+66')
        : phoneNumber;
  }

  void _autoRetrieve(String verificationId) {
    _verificationId = verificationId;
  }

  void _smsCodeSent(String verificationId, int? forceResendingToken) {
    _verificationId = verificationId;
  }

  void _verifySuccess(PhoneAuthCredential authCredential) {}

  void _verifyFailed(FirebaseAuthException exception) {}
}
