import 'package:ecommerce_app/theme/colors.dart';
import 'package:ecommerce_app/theme/navigation_icons.dart';
import 'package:ecommerce_app/widgets/product_screen_widget/product_details_widget.dart';
import 'package:ecommerce_app/widgets/product_screen_widget/product_image_widget.dart';
import 'package:flutter/material.dart';

class ProductScreenWidget extends StatefulWidget {
  final int productId;
  const ProductScreenWidget({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  State<ProductScreenWidget> createState() => _ProductState();
}

class _ProductState extends State<ProductScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(children: const [
        ProductTitleWidget(),
        ProductImageWidget(),
        ProductDetailsWidget(),
      ]),
    );
  }
}

class ProductTitleWidget extends StatelessWidget {
  const ProductTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(42, 37, 35, 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              minimumSize: MaterialStateProperty.all(const Size(37, 37)),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
              backgroundColor: MaterialStateProperty.all(colorDarkBlue),
            ),
            onPressed: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back_ios_new,
              size: 14,
            ),
          ),
          const Text(
            'Product Details',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              minimumSize: MaterialStateProperty.all(const Size(37, 37)),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
              backgroundColor: MaterialStateProperty.all(colorOrange),
            ),
            onPressed: () {},
            child: const Icon(NavigationIcons.basket, size: 15),
          ),
        ],
      ),
    );
  }
}
