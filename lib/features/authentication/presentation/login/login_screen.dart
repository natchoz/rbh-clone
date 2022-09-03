import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:robinhood_clone/common/app_image.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late TextEditingController _phoneController;

  void _onConfirmPhoneNumberTab(BuildContext context) async {}

@override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildLogo(),
            _buildTitle(),
            _buildDescription(),
            _buildPhoneNumberInput(),
            _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() => Container(
        margin: EdgeInsets.only(left: 50),
        child: Image.asset(
          AppImage.robinhoodLogo,
        ),
      );

  Widget _buildTitle() => Container(
        child: Column(
          children: const [
            Text(
              "Robinhood ยินดีต้อนรับ",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );

  Widget _buildDescription() => Container(
        child: Column(
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
        ),
      );

  Widget _buildPhoneNumberInput() => Container(
        color: Colors.white,
        width: double.infinity,
        child: TextFormField(
          controller: _phoneController,
          onChanged: (val) {
            setState(() {});
          },
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            // icon: Image.asset(
            //   AppImage.iconPhone,
            //   width: 24.w,
            //   height: 24.w,
            //   fit: BoxFit.contain,
            // ),
            labelText: 'เบอร์โทรศัพท์',
            labelStyle: TextStyle(
              fontSize: 16,
              color: Colors.blueGrey,
            ),
          ),
        ),
      );

  Widget _buildNextButton() => Container(
        margin: EdgeInsets.only(bottom: 50),
        height: 60.w,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: (_phoneController.text.isNotEmpty)
              ? () => _onConfirmPhoneNumberTab(context)
              : null,
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: const Text(
            'ยืนยันเบอร์โทรศัพท์',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      );
}
