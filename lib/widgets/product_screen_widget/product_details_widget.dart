import 'package:ecommerce_app/theme/colors.dart';
import 'package:ecommerce_app/theme/navigation_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 11),
      child: Container(
        width: 414,
        height: 449,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TitleWidget(),
            StarsIndicator(),
            SelectProductButtonWidget(),
            ProductDescriptionWidget(),
            ProductColorCapacity(),
            AddButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(38, 28, 37, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Galaxy Note 20 Ultra',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              minimumSize: MaterialStateProperty.all(const Size(37, 37)),
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
              backgroundColor: MaterialStateProperty.all(colorDarkBlue),
            ),
            onPressed: () {},
            child: const Icon(
              Icons.favorite_border,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class StarsIndicator extends StatefulWidget {
  const StarsIndicator({Key? key}) : super(key: key);

  @override
  State<StarsIndicator> createState() => _StarsIndicatorState();
}

class _StarsIndicatorState extends State<StarsIndicator> {
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 38),
      child: RatingBar.builder(
        initialRating: 4.5,
        allowHalfRating: true,
        minRating: 1,
        itemSize: 20,
        itemPadding: const EdgeInsets.only(right: 9.0),
        itemBuilder: (context, index) =>
            const Icon(Icons.star, color: Colors.amber),
        onRatingUpdate: (rating) => setState(() {
          this.rating = rating;
        }),
      ),
    );
  }
}

class ProductButtonWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onPressed;

  const ProductButtonWidget({
    Key? key,
    required this.isSelected,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? colorOrange : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
                color: isSelected ? Colors.black : Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      );
}

class SelectProductButtonWidget extends StatefulWidget {
  const SelectProductButtonWidget({Key? key}) : super(key: key);

  @override
  State<SelectProductButtonWidget> createState() =>
      _SelectProductButtonWidgetState();
}

class _SelectProductButtonWidgetState extends State<SelectProductButtonWidget> {
  final selectedIndexNotifier = ValueNotifier<int?>(0);
  List<String> buttonlist = ['Shop', 'Details', 'Features'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.5, vertical: 24),
        child: ValueListenableBuilder<int?>(
          valueListenable: selectedIndexNotifier,
          builder: (_, selectedIndex, __) => Row(
            children: [
              for (int i = 0; i < buttonlist.length; i++)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: ProductButtonWidget(
                      title: buttonlist[i],
                      isSelected: selectedIndex == i,
                      onPressed: () => selectedIndex == i
                          ? selectedIndexNotifier.value = null
                          : selectedIndexNotifier.value = i),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDescriptionWidget extends StatelessWidget {
  const ProductDescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 31, right: 39),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: const [
              Icon(
                NavigationIcons.cpu,
                color: Colors.grey,
                size: 30,
              ),
              SizedBox(height: 5),
              Text(
                'Exynos 990',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Column(
            children: const [
              Icon(
                NavigationIcons.photo,
                color: Colors.grey,
                size: 28,
              ),
              SizedBox(height: 5),
              Text(
                '108 + 12 mp',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Column(
            children: const [
              Icon(
                NavigationIcons.memory,
                color: Colors.grey,
                size: 25,
              ),
              SizedBox(height: 8),
              Text(
                '8 GB',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Column(
            children: const [
              Icon(
                NavigationIcons.ssd,
                color: Colors.grey,
                size: 28,
              ),
              SizedBox(height: 5),
              Text(
                '256 GB',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProductColorCapacity extends StatelessWidget {
  const ProductColorCapacity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 28, 0, 0),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                'Select color and copacity',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 14.71),
          Row(
            children: [
              Container(
                width: 39,
                height: 39,
                decoration: BoxDecoration(
                    color: colorOrange,
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
              ),
              const SizedBox(width: 18.75),
              Container(
                width: 39,
                height: 39,
                decoration: BoxDecoration(
                    color: colorOrange,
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(29, 27, 30, 0),
      child: ElevatedButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(355, 54)),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
            backgroundColor: MaterialStateProperty.all(colorOrange)),
        onPressed: () {},
        child: Row(
          children: const [
            SizedBox(width: 45),
            Text(
              'Add to Card',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 61),
            Text(
              '\$1500',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
