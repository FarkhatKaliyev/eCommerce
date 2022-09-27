import 'package:ecommerce_app/theme/colors.dart';
import 'package:ecommerce_app/widgets/main_screen/main_screen_model.dart';
import 'package:flutter/material.dart';

class BestSellesrsTitleWidget extends StatelessWidget {
  const BestSellesrsTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        children: [
          const SizedBox(height: 25),
          const Expanded(
            child: Text(
              'Best Sellers',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('see more'),
          )
        ],
      ),
    );
  }
}

class BestSellersWidget extends StatelessWidget {
  const BestSellersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final post = MaincsreenProvider.watch(context)?.model;
    if (post == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.fromLTRB(17, 16, 18, 22),
      child: SizedBox(
        height: 469,
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 181,
                crossAxisSpacing: 14,
                mainAxisSpacing: 12,
                childAspectRatio: 0.8),
            itemCount: post.bestSellers.length,
            itemBuilder: (BuildContext ctx, index) {
              final item = post.bestSellers[index];
              return Stack(
                children: [
                  Container(
                    width: 181,
                    height: 225,
                    clipBehavior: Clip.hardEdge,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(children: [
                      Image.network(item.picture, width: 181, height: 177),
                      Padding(
                        padding: const EdgeInsets.only(left: 21),
                        child: Row(children: [
                          Text(
                            '\$${item.price_without_discount}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 7),
                          Text(
                            '\$${item.discount_price.toString()}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              decoration: TextDecoration.lineThrough,
                            ),
                          )
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 21, top: 5),
                        child: Row(
                          children: [
                            Text(
                              item.title,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      onTap: () => post.onProductTap(context, index),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 6,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(25, 25)),
                            shape:
                                MaterialStateProperty.all(const CircleBorder()),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        onPressed: () {},
                        child: Icon(
                          item.is_favorites == true
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: colorOrange,
                          size: 15,
                        )),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
