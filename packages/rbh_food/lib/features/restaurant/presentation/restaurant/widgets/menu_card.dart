import 'package:core/utils/rbh_utils.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MenuCard extends StatelessWidget {
  const MenuCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.price,
      this.onTab})
      : super(key: key);

  final String image, title;
  final double price;
  final VoidCallback? onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                image: DecorationImage(
                  // image: NetworkImage(image),
                  image: CachedNetworkImageProvider(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Image.network(
          //   image,
          //   fit: BoxFit.cover,
          // )
          // // Image.asset(image),
          // ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                // fontSize: 16,
                // color: Colors.black,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            RbhUtils.convertDisplayPrice(price),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              // color: Color(0xFF22A45D),
            ),
          ),
        ],
      ),
    );
  }
}
