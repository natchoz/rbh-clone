import 'package:firebase_auth/firebase_auth.dart';

class SignInUseCase {
  SignInUseCase({
    required this.firebaseAuth,
  });

  final FirebaseAuth firebaseAuth;
  late String _verificationId;

  Future<void> signInByPhoneNumber(String phoneNumber) async {
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
