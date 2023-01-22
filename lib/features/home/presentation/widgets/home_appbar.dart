// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class HomeAppBar extends StatelessWidget {
//   const HomeAppBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       expandedHeight: 200,
//       floating: false,
//       pinned: false,
//       // backgroundColor: Colors.white,
//       flexibleSpace: FlexibleSpaceBar(
//         centerTitle: false,
//         title: Text('Hello', ),
//         // title: Column(
//         //   mainAxisSize: MainAxisSize.min,
//         //   children: <Widget> [
//         //     Text('Hello', style: TextStyle(color: Colors.purple),),
//         //     Text('Users', style: TextStyle(color: Colors.purple),),
//         //   ],
//         // ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class HomeAppBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'สวัสดี',
              style: TextStyle(
                color: Colors.purple,
                fontSize: 25,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'โรบิน',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
