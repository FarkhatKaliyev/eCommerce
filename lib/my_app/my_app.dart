import 'package:ecommerce_app/theme/colors.dart';
import 'package:ecommerce_app/widgets/main_screen/main_screen_model.dart';
import 'package:ecommerce_app/widgets/main_screen/main_screen_widget.dart';
import 'package:ecommerce_app/widgets/product_screen_widget/product_screen_widget.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'MarkPro',
        primarySwatch: colorOrange,
      ),
      routes: {
        '/mainscreen': (context) => MaincsreenProvider(
              model: MainScreenModel(),
              child: const MainScreenWidget(),
            ),
        '/mainscreen/product': (context) {
          final id = ModalRoute.of(context)?.settings.arguments as int;
          return ProductScreenWidget(productId: id);
        }
      },
      initialRoute: '/mainscreen',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          return const Text('Error');
        });
      },
    );
  }
}
