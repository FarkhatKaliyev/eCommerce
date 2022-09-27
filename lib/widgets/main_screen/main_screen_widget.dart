import 'package:ecommerce_app/api_client/api_client.dart';
import 'package:ecommerce_app/theme/colors.dart';
import 'package:ecommerce_app/theme/navigation_icons.dart';
import 'package:ecommerce_app/widgets/main_screen/best_sellers%20widget.dart';
import 'package:ecommerce_app/widgets/main_screen/hot_sales_widget.dart';
import 'package:ecommerce_app/widgets/main_screen/main_screen_model.dart';
import 'package:ecommerce_app/widgets/main_screen/search_and_filter_widget.dart';
import 'package:ecommerce_app/widgets/main_screen/select_category_widget.dart';
import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  final model = MainScreenModel();

  @override
  void initState() {
    super.initState();
    model.loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    ApiClient().getProductPosts;
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: colorDarkBlue,
          selectedItemColor: colorOrange,
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                NavigationIcons.explorer,
                size: 18,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                NavigationIcons.basket,
                size: 18,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 21,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                NavigationIcons.person,
                size: 18,
              ),
              label: '',
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          const SelectCategoryWidget(),
          const SelectIconsWidget(),
          const SearchFilterWidget(),
          const HotSalesTitleWidget(),
          MaincsreenProvider(
            model: model,
            child: const HotSalesWidget(),
          ),
          const BestSellesrsTitleWidget(),
          MaincsreenProvider(
            model: model,
            child: const BestSellersWidget(),
          ),
        ],
      ),
    );
  }
}
