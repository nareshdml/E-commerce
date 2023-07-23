import 'package:flutter/material.dart';
import 'package:online_store/constant/text_bold.dart';
import 'package:provider/provider.dart';

import '../../app/app_routes.dart';
import '../../constant/color_theme.dart';
import '../../constant/elevated_button_color.dart';
import '../../constant/text_theme.dart';
import '../../screen/home/view_model/home_view_model.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({
    super.key,
  });

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Provider.of<HomeViewModel>(context, listen: false).getProduct();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerdata = Provider.of<HomeViewModel>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Products',
              style: titleText,
            ),
            GridView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: providerdata.productResponseData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.description,
                          arguments: {
                            'rating':
                                providerdata.productResponseData[index].rating,
                            'description': providerdata
                                .productResponseData[index].description,
                            'image':
                                providerdata.productResponseData[index].image,
                            'title':
                                providerdata.productResponseData[index].title,
                            'price':
                                providerdata.productResponseData[index].price,
                          });
                    },
                    child: SizedBox(
                      height: 180,
                      child: Card(
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  providerdata
                                          .productResponseData[index].title ??
                                      'N/a',
                                  style: textBold,
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Hero(
                                    tag:
                                        'imageHero${providerdata.productResponseData[index].title}',
                                    child: Image.network(providerdata
                                            .productResponseData[index].image ??
                                        ''),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '\$${providerdata.productResponseData[index].price}',
                                        style: textBold,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    ElevatedButton(
                                        style: buttonColor,
                                        onPressed: () {
                                          providerdata.addToCart(providerdata
                                              .productResponseData[index]);
                                        },
                                        child: const Text('Add to Cart'))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                })
            // GridView.builder(
            //   itemCount: 2,
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //   ),
            //   itemBuilder: (contest, index) {
            //     return const Text(
            //       'N/a',
            //     );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
