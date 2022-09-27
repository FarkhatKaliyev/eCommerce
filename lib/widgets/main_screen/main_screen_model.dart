import 'package:ecommerce_app/api_client/api_client.dart';
import 'package:ecommerce_app/api_client/entity/best_sellers.dart';
import 'package:ecommerce_app/api_client/entity/home_store.dart';
import 'package:flutter/material.dart';

class MainScreenModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _hotSales = <HomeStore>[];
  final _bestSellers = <BestSellers>[];

  List<HomeStore> get hotSales => List.unmodifiable(_hotSales);
  List<BestSellers> get bestSellers => List.unmodifiable(_bestSellers);

  Future<void> loadPosts() async {
    final posts = await _apiClient.getPosts();
    _hotSales.addAll(posts.home_store);
    _bestSellers.addAll(posts.best_seller);
    notifyListeners();
  }

  void onProductTap(BuildContext context, int index) {
    final id = bestSellers[index].id;
    Navigator.of(context).pushNamed('/mainscreen/product', arguments: id);
  }
}

class MaincsreenProvider extends InheritedNotifier {
  final MainScreenModel model;

  const MaincsreenProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static MaincsreenProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MaincsreenProvider>();
  }

  static MaincsreenProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<MaincsreenProvider>()
        ?.widget;
    return widget is MaincsreenProvider ? widget : null;
  }
}
