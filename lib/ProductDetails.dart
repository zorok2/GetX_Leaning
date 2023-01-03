import 'package:container_test/Product.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(tag: product.name!,
                child: Image.network(product.image!)),
                IconButton(icon: const Icon(Icons.arrow_back_ios_new), color: Colors.white,
                  onPressed: () {
                  Navigator.pop(context);
                  },),
                 const Positioned(
                 bottom: 10, left: 40,
                     child: Text('Demo', style: TextStyle(fontSize: 32,color: Colors.white),))
              ],
            ),
            Text(product.price.toString(), style: const TextStyle(fontSize: 28,color: Colors.grey),),
            const Text('this is demo product', style: TextStyle(fontSize: 15,color: Colors.grey),)
          ],
        ),
      ),
    );
  }
}
