import 'package:container_test/Product.dart';
import 'package:container_test/ProductDetails.dart';
import 'package:container_test/controllers/youCart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProductItem extends StatefulWidget {
  final Size screenSize;
  final Product productInF;
  const ProductItem({
    Key? key,
    required this.screenSize,
    required this.productInF
  }) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  late Product productInF;
  late Size screenSize;
  final YourCartController ProductManager = Get.put(YourCartController());
  @override
  void initState() {
    screenSize = widget.screenSize;
    productInF = widget.productInF;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(product: productInF),));
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(8),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: Image.network(
                productInF.image!,
                width: screenSize.width / 2 - 16,
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: (productInF.favorite == false) ? const Icon(
                      (Icons.favorite_outline),
                      color: Colors.purple,
                      size: 30,
                    ) : const Icon(
                      (Icons.favorite),
                      color: Colors.purple,
                      size: 30,
                    ) ,
                    onPressed: () {
                      setState(() {
                        productInF.favorite = !productInF.favorite!;
                      });

                    },
                  ),
                  Expanded(
                    child: Text(
                        productInF.name!,
                        style: const TextStyle(fontSize: 20, color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis
                    ),
                  ),
                  IconButton(
                    icon: const Icon((Icons.shopping_cart),
                        color: Colors.purple, size: 30),
                    onPressed: () {
                      ProductManager.addToCart(productInF);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
