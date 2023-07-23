import 'package:flutter/material.dart';
import 'package:online_store/screen/home/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../../constant/color_theme.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<HomeViewModel>(context, listen: false);
    print(state.myCartLists.length);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: myColor,
        ),
        body: Column(
          children: [
            Expanded(
              child: Consumer<HomeViewModel>(
                builder: (context, datalists, child) => ListView.builder(
                    itemCount: datalists.myCartLists.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    datalists.myCartLists[index].title,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ));
  }
}
