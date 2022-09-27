import 'package:ecommerce_app/theme/navigation_icons.dart';
import 'package:ecommerce_app/theme/colors.dart';
import 'package:flutter/material.dart';

class SelectCategoryWidget extends StatelessWidget {
  const SelectCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        children: [
          const SizedBox(height: 25),
          const Expanded(
            child: Text(
              'Select Category',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'view all',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Buttons {
  final String title;
  final IconData iconData;

  Buttons(this.title, this.iconData);
}

List<Buttons> buttonlist = [
  Buttons('Phones', NavigationIcons.phone),
  Buttons('Computer', NavigationIcons.computer),
  Buttons('Books', NavigationIcons.books),
  Buttons('Health', NavigationIcons.health),
  Buttons('Tools', Icons.brightness_high_outlined),
];

class IconWidget extends StatelessWidget {
  final Buttons button;
  final bool isSelected;
  final VoidCallback onPressed;
  const IconWidget({
    Key? key,
    required this.button,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(71, 71)),
                  shape: MaterialStateProperty.all(const CircleBorder()),
                  backgroundColor: MaterialStateProperty.all(
                    isSelected ? colorOrange : Colors.white,
                  )),
              onPressed: onPressed,
              child: Icon(
                button.iconData,
                color: isSelected ? Colors.white : Colors.grey,
                size: 30,
              )),
          const SizedBox(height: 7),
          Text(
            button.title,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: isSelected ? colorOrange : Colors.black),
          ),
        ],
      );
}

class SelectIconsWidget extends StatefulWidget {
  const SelectIconsWidget({Key? key}) : super(key: key);

  @override
  State<SelectIconsWidget> createState() => _SelectIconsWidgetState();
}

class _SelectIconsWidgetState extends State<SelectIconsWidget> {
  final selectedIndexNotifier = ValueNotifier<int?>(0);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.5),
        child: ValueListenableBuilder<int?>(
          valueListenable: selectedIndexNotifier,
          builder: (_, selectedIndex, __) => Row(
            children: [
              for (int i = 0; i < buttonlist.length; i++)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 11.5),
                  child: IconWidget(
                      button: buttonlist[i],
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
