import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.purple,
          ),
        ),
      ),
    );
    // return Dialog(
    //   child: SizedBox(
    //     width: 50,
    //     height: 50,
    //     child: Center(
    //       child: CircularProgressIndicator(
    //         valueColor: AlwaysStoppedAnimation<Color>(
    //           AppColor.tealish,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
