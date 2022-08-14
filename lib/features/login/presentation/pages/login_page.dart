import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildLogo(),
            _buildTitle(),
            // _buildPhoneNumberInput(),
            // _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() => Container(
        margin: EdgeInsets.only(left: 50.w),
        child: Image.asset(
          'images/robinhood-logo.png',
        ),
      );

  Widget _buildTitle() => Container(
        child: Column(
          children: [
            Text(
              "Robinhood ยินดีต้อนรับ",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "กรุณาใส่เบอร์มือถือของคุณเพื่อดำเนินการต่อ",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      );
}
