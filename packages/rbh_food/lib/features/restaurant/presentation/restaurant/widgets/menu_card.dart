import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
  }) : super(key: key);

  final String image, title;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                image: NetworkImage(image),
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
          "$price",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            // color: Color(0xFF22A45D),
          ),
        ),
      ],
    );
  }
}
