import 'package:get/get.dart';
import '../Product.dart';
class YourCartController extends GetxController{
  var listProduct  = <Product>[].obs;

  void addToCart(Product product){
    if(checkExist(product) == true){
      product.incrementAmount();
      return;
    }
    listProduct.add(product);
  }
  void deleteProductChecked(){
          listProduct.removeWhere((element) {
            return element.isDeleted.value == true;
          },);
  }
  bool checkExist(Product product){
    bool exists = false;
    for (Product element in listProduct) {
      if(element.name == product.name){
      exists = true;
      return exists;
    }
    }
    return exists;
  }

   getTotalPrice(){
    double rs = 0;
    for (Product element in listProduct) {
      rs+= (element.price! * element.amount1.value!);
    }
    var s = rs.toStringAsFixed(2);
    return s;
    }
    getTotalItem(Product product){
      double rs = product.price! * product.amount1.value!;
      return rs;
    }
  getAmount(Product product){
    return product.amount1;
  }

}