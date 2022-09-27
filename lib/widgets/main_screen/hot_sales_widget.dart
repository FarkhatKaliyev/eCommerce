import 'package:ecommerce_app/theme/colors.dart';
import 'package:ecommerce_app/widgets/main_screen/main_screen_model.dart';
import 'package:flutter/material.dart';

class HotSalesTitleWidget extends StatelessWidget {
  const HotSalesTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        children: [
          const SizedBox(height: 25),
          const Expanded(
            child: Text(
              'Hot Sales',
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

class HotSalesWidget extends StatelessWidget {
  const HotSalesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final post = MaincsreenProvider.watch(context)?.model;
    if (post == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: SizedBox(
        height: 182,
        child: ListView.builder(
          itemCount: post.hotSales.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            final item = post.hotSales[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 11),
              child: Container(
                width: 376,
                height: 182,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Stack(
                  children: [
                    Image.network(item.picture, width: 376, height: 182),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 23, vertical: 14),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            item.is_new != false
                                ? Container(
                                    width: 27,
                                    height: 27,
                                    decoration: BoxDecoration(
                                        color: colorOrange,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(50))),
                                    child: const Center(
                                      child: Text(
                                        'New',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ),
                                  )
                                : const SizedBox(width: 27, height: 27),
                            const SizedBox(height: 18),
                            Text(
                              item.title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              item.subtitle,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 11),
                            ),
                            const SizedBox(height: 26),
                            ElevatedButton(
                              onPressed: () =>
                                  post.onProductTap(context, index),
                              style: ButtonStyle(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(0)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                minimumSize: MaterialStateProperty.all(
                                    const Size(98, 23)),
                              ),
                              child: const Text(
                                'Buy now!',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
