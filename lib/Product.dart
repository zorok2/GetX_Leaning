import 'package:get/get.dart';
class Product extends GetxController {
  String? name;
  String? image;
  double? price;
  bool? favorite;
  int? amount;
  double? totalPrice;
  RxInt amount1 = 1.obs;
  Product();
  Product.from( this.name,  this.image,  this.price, this.favorite, {this.amount = 1, this.totalPrice = 0 });
  void incrementAmount(){
    amount1++;
  }
  void decrementAmount(){
    amount1--;
  }
}