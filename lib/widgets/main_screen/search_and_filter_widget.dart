import 'package:ecommerce_app/theme/colors.dart';
import 'package:ecommerce_app/theme/navigation_icons.dart';
import 'package:flutter/material.dart';

class SearchFilterWidget extends StatefulWidget {
  const SearchFilterWidget({Key? key}) : super(key: key);

  @override
  State<SearchFilterWidget> createState() => _SearchFilterWidgetState();
}

class _SearchFilterWidgetState extends State<SearchFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 35, 30, 24),
      child: Row(
        children: const [
          SearchWidget(),
          FilterWidget(),
          FilterWidget(),
          FilterWidget(),
        ],
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(
          Icons.search,
          color: colorOrange,
        ),
        hintText: 'Search',
        hintStyle: const TextStyle(fontSize: 12),
        constraints: const BoxConstraints(maxWidth: 300, maxHeight: 34),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
    );
  }
}

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String? valueBrand = 'Samsung';
  String? valuePrice = '\$100-\$300';
  String? valueSize = '3.5 to 4.5 inches';

  final brands = ['Samsung', 'Iphone', 'Xiaomi', 'Motorola'];
  final price = ['\$100-\$300', '\$300-\$500', '\$500-\$700', '\$700-\$1000'];
  final size = [
    '3.5 to 4.5 inches',
    '4.5 to 5.5 inches',
    '5.5 to 6.5 inches',
    '5.5 and more'
  ];
  DropdownMenuItem<String> buildMenu(String item) => DropdownMenuItem(
        value: item,
        child: Text(item,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            )),
      );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(34, 34)),
            shape: MaterialStateProperty.all(const CircleBorder()),
            backgroundColor: MaterialStateProperty.all(colorOrange)),
        child: const Icon(
          NavigationIcons.filter,
          size: 15,
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              builder: (context) {
                return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(51, 24, 13, 24),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                                minimumSize: MaterialStateProperty.all(
                                    const Size(37, 37)),
                                shape: MaterialStateProperty.all(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(colorDarkBlue),
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: const Icon(
                                Icons.close,
                                size: 14,
                              ),
                            ),
                            const Text(
                              'Filter options',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                                minimumSize: MaterialStateProperty.all(
                                    const Size(87, 37)),
                                shape: MaterialStateProperty.all(
                                    const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)))),
                                backgroundColor:
                                    MaterialStateProperty.all(colorOrange),
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'Done',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: const [
                            Text('Brand',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              height: 37,
                              width: 337,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.5)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: valueBrand,
                                  isExpanded: true,
                                  iconSize: 36,
                                  icon: const Icon(Icons.arrow_drop_down,
                                      color: Colors.grey),
                                  items: brands.map(buildMenu).toList(),
                                  onChanged: (value) =>
                                      setState(() => valueBrand = value),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: const [
                            Text('Price',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              height: 37,
                              width: 337,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.5)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: valuePrice,
                                  isExpanded: true,
                                  iconSize: 36,
                                  icon: const Icon(Icons.arrow_drop_down,
                                      color: Colors.grey),
                                  items: price.map(buildMenu).toList(),
                                  onChanged: (value) =>
                                      setState(() => valuePrice = value),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: const [
                            Text('Size',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              height: 37,
                              width: 337,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.grey, width: 0.5)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: valueSize,
                                  isExpanded: true,
                                  iconSize: 36,
                                  icon: const Icon(Icons.arrow_drop_down,
                                      color: Colors.grey),
                                  items: size.map(buildMenu).toList(),
                                  onChanged: (value) =>
                                      setState(() => valueSize = value),
                                ),
                              ),
                            ),
                          ],
                        )
                      ]),
                    );
                  },
                );
              });
        });
  }
}
