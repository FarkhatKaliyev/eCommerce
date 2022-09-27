import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 386,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 268,
            height: 335,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(5, 0),
                )
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
              'https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig',
              width: 268,
              height: 335,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
