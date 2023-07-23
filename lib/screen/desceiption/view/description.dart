import 'package:flutter/material.dart';
import 'package:online_store/constant/color_theme.dart';

import '../../../constant/elevated_button_color.dart';
import '../../../constant/text_theme.dart';

class Description extends StatefulWidget {
  var title; // String argument
  var price;
  var image;
  var description; // Integer argument

  Description({
    super.key,
    this.title,
    this.price,
    this.image,
    this.description,
  });

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: myColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text("Description", style: titleText),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: Hero(
                      tag: 'imageHero${widget.title}',
                      child: Image.network(widget.image),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '\$${widget.price}',
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.description,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            style: buttonColor,
                            onPressed: () {},
                            child: const Text(
                              'Add to Cart',
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
