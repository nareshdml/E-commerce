import 'package:flutter/material.dart';
import 'package:online_store/app/app_routes.dart';
import 'package:online_store/constant/text_theme.dart';

import '../constant/assets_images.dart';
import '../constant/color_theme.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: kToolbarHeight + 60,
            ),
            Text("Welcome", style: titleText),
            //sizedbox
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Buy any items using OnlineStore APP',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            //sizedbox
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Image.asset(
                AssetsImages.instance.welcomeImage,
              ),
            ),
            const SizedBox(
              height: 50,
            ),

            SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    backgroundColor: myColor,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.home);
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Bascasime'),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
