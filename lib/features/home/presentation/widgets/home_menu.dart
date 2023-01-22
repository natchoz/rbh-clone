import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({
    required this.image,
    required this.category,
    required this.menu,
    required this.title,
    required this.description,
    this.isComingSoon = true,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String image;
  final String category;
  final String menu;
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
            // width: 200,
            height: 100,
            child: Text(
              menu,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.all(
                Radius.circular(10.w),
              ),
              image: DecorationImage(
                // image: Image.asset(AppImage.imgHomeFoodMenu, fit: BoxFit.contain, width: 100.w, height: 100.w,) as ImageProvider,
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
          ),
          Flexible(
            child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )),
          Flexible(
            child: Text(
            description,
            overflow: TextOverflow.ellipsis,
          )),
          // Text(title),
          // Text(description),
        ],
      ),
    );
  }
}
