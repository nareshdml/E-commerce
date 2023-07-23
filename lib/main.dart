import 'package:flutter/material.dart';
import 'package:online_store/app/app_routes.dart';
import 'package:online_store/screen/home/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(const OnlineStore());

class OnlineStore extends StatelessWidget {
  const OnlineStore({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => HomeViewModel(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter.generateRoute,
          initialRoute: AppRoutes.welcomeScreen,
        ));
  }
}
