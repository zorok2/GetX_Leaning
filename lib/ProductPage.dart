import 'package:container_test/ProductItem.dart';
import 'package:flutter/material.dart';

import 'Product.dart';

class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        body: SizedBox(
          width: screenSize.width, height: screenSize.height,
          child: Stack(
            children: [
              GridView.count(
                childAspectRatio: 3 / 2,
                crossAxisCount: 2,
                children:
                // for (int i = 0; i < listProduct.length; i++)
                //   ProductItem(screenSize: screenSize, productInF: listProduct[i])
                listProduct.map((e) => ProductItem(screenSize: screenSize, productInF: e)).toList()
                ,
              )
            ],
          ),
        ));
  }


  final List<Product> listProduct = [
    Product.from(
        "Quần jeannnnnnnnnnnnn",
        "https://cdn3.dhht.vn/wp-content/uploads/2020/09/nem-fashion.jpg",
        5.6,
        false),
    Product.from(
        "Áo kittyyyyyyyyyyyy",
        "https://cdn.shopify.com/s/files/1/0063/2330/6551/products/s20-39-1_2048x@2x.jpg?v=1596010742",
        9.8,
        false),
    Product.from(
        "Quần ống",
        "https://ae01.alicdn.com/kf/Hea036cc6bf16445195bdbd0baabaf6ccx/Gowyimmes-M-a-ng-2021-Size-L-n-S-5XL-R-ng-Cho-S-n-Vi.jpg_Q90.jpg_.webp",
        5.4,
        false),
  ];
}
