import 'package:flutter/material.dart';
import 'package:online_store/screen/card/view/card_view.dart';
import 'package:online_store/screen/desceiption/view/description.dart';
import 'package:online_store/screen/home/view/home_screen.dart';

import '../Screen/welcome_screen.dart';
import '../grid/view/grid_view.dart';

class AppRoutes {
  static const String home = '/home';
  static const String welcomeScreen = '/welcon-screen';
  static const String description = '/description';
  static const String cart = '/cartView';
  static const String grid = '/gridview';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        // Access the arguments passed while navigating

        return MaterialPageRoute(builder: (context) => HomeScreen());

      case AppRoutes.welcomeScreen:
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case AppRoutes.description:
        final arg = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => Description(
                  title: arg['title'],
                  price: arg['price'],
                  image: arg['image'],
                  description: arg['description'],
                ));
      case AppRoutes.cart:
        return MaterialPageRoute(
          builder: (_) => const CartView(),
        );
      case AppRoutes.grid:
        return MaterialPageRoute(
          builder: (_) => const GridViewScreen(),
        );
      default:
        return MaterialPageRoute(builder: (_) => const MyHomePage());
    }
  }
}
