import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:robinhood_clone/common/app_image.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginPage> {
  late TextEditingController _phoneController;

  void _onConfirmPhoneNumber(BuildContext context) async {}

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          _buildLogo(),
          _buildTitle(),
          _buildDescription(),
          _buildPhoneNumberInput(),
          const Spacer(
            flex: 2,
          ),
          _buildNextButton(),
        ],
      ),
    ));
  }

  Widget _buildLogo() => SizedBox(
        width: 200.w,
        height: 100.w,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            AppImage.robinhoodLogo,
            fit: BoxFit.contain,
          ),
        ),
      );

  Widget _buildTitle() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Robinhood ยินดีต้อนรับ",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );

  Widget _buildDescription() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "กรุณาใส่เบอร์มือถือของคุณเพื่อดำเนินการต่อ",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            "*ระบบรองรับเบอร์มือถือที่ลงทะเบียนในประเทศไทยเท่านั้น",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      );

  Widget _buildPhoneNumberInput() => Container(
        padding: EdgeInsets.only(top: 48.w),
        color: Colors.white,
        width: double.infinity,
        child: TextFormField(
          controller: _phoneController,
          onChanged: (val) {
            setState(() {});
          },
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: 'ใส่เบอร์มือถือ',
            labelStyle: TextStyle(
              fontSize: 16.sp,
              color: Colors.blueGrey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      );

  Widget _buildNextButton() => Container(
        margin: EdgeInsets.only(bottom: 50.w),
        height: 60.w,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: (_phoneController.text.isNotEmpty)
              ? () => _onConfirmPhoneNumber(context)
              : null,
          style: ElevatedButton.styleFrom(
            primary: Colors.purple,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: const Text(
            'ถัดไป',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      );
}
