import 'package:flutter/material.dart';
import 'package:online_store/app/app_routes.dart';
import 'package:online_store/constant/text_theme.dart';
import 'package:provider/provider.dart';

import '../../../constant/color_theme.dart';
import '../../../constant/elevated_button_color.dart';
import '../../../constant/text_bold.dart';
import '../view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: providerdata.isloading
          ? Center(
              child: CircularProgressIndicator(
                color: myColor,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'FakeStore',
                                style: titleText,
                              ),
                            ),
                            IconButton(
                              color: myColor,
                              onPressed: () {
                                Navigator.pushNamed(context, AppRoutes.grid);
                              },
                              icon: const Icon(Icons.grid_view),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'Search...',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Categories",
                      style: titleText,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width,
                    child: Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoriesList.length,
                          itemBuilder: (context, index) => Row(children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                              categoriesList[index]),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(categoriesListName[index],
                                            style: textBold)
                                      ],
                                    ),
                                  ),
                                )
                              ])),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Special For You",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          color: myColor,
                          icon: const Icon(
                            Icons.shopping_cart,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.cart,
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: providerdata.productResponseData.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.description,
                                arguments: {
                                  'rating': providerdata
                                      .productResponseData[index].rating,
                                  'description': providerdata
                                      .productResponseData[index].description,
                                  'image': providerdata
                                      .productResponseData[index].image,
                                  'title': providerdata
                                      .productResponseData[index].title,
                                  'price': providerdata
                                      .productResponseData[index].price,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        providerdata.productResponseData[index]
                                                .title ??
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
                                                  .productResponseData[index]
                                                  .image ??
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
                                                providerdata.addToCart(
                                                    providerdata
                                                            .productResponseData[
                                                        index]);
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
                ],
              ),
            ),
    );
  }
}

List<String> categoriesList = [
  'https://www.tcl.com/usca/content/dam/tcl/product/headphones/elit/teaser/720x480_0013_ELIT400BTBL_beauty.png',
  'https://www.hazoorilallegacy.com/wp-content/uploads/2022/10/Hazoorilal-Legacy-collection-lxxxiii-01.png',
  'https://i.pinimg.com/originals/ac/86/59/ac86596c61511123f7f7cb68b320cc6f.png',
  'https://i.pinimg.com/originals/53/6b/00/536b00aa08d2f2e1c4490b3d595f4251.png'
];
List<String> categoriesListName = [
  'Electronc',
  'Jellewery',
  'Men\'s clothing',
  'Women\'s clothing',
];
