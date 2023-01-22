import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:robinhood_clone/features/food/presentation/widgets/product_card.dart';
import 'package:robinhood_clone/features/food/presentation/widgets/special_offer_title.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  static const String routeName = "/food";

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildSpecialOfferProduct(),
              SizedBox(
                height: 48,
              ),
              _buildNearByProduct(),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildSpecialOfferProduct() {
    return Column(
      children: [
        FoodOfferTitle("ร้านแนะนำสำหรับคุณ"),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductCard(
                imageUrl:
                    "https://images.pexels.com/photos/1108104/pexels-photo-1108104.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                width: 150,
                height: 150,
                title: "เคนจิ ซูชิ",
                description: "ซื้อ 10 ชิ้น ฟรี 1 ชิ้น",
              ),
              ProductCard(
                imageUrl:
                    "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
                width: 150,
                height: 150,
              ),
              ProductCard(
                imageUrl:
                    "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
                width: 150,
                height: 150,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNearByProduct() {
    return Column(
      children: [
        FoodOfferTitle("ดีลดีใกล้คุณ"),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductCard(
                imageUrl:
                    "https://images.pexels.com/photos/1108104/pexels-photo-1108104.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                width: 150,
                height: 150,
                title: "เคนจิ ซูชิ",
                description: "ซื้อ 10 ชิ้น ฟรี 1 ชิ้น",
              ),
              ProductCard(
                imageUrl:
                    "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
                width: 150,
                height: 150,
              ),
              ProductCard(
                imageUrl:
                    "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
                width: 150,
                height: 150,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
