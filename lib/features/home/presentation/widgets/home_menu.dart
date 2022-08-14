import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:robinhood_clone/common/app_image.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({
    required this.category,
    required this.title,
    required this.description,
    this.isComingSoon = true,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String category;
  final String title;
  final String description;
  final bool isComingSoon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            // width: 200.w,
            // height: 200.w,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1.w),
              borderRadius: BorderRadius.all(
                Radius.circular(10.w),
              ),
              image: const DecorationImage(
                // image: Image.asset(AppImage.imgHomeFoodMenu, fit: BoxFit.contain, width: 100.w, height: 100.w,) as ImageProvider,
                fit: BoxFit.cover,
                image: AssetImage(AppImage.imgHomeFoodMenu),
              ),
            ),
          ),
          Text(title),
          Text(description),
        ],
      ),
    );
  }
}
