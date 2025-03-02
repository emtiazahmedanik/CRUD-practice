

import '../../data/service/services.dart';

class ProductList{
  static List products = [];

  static Future<List> getProduct() async{
    final response = await getProductList();
    products = response;
    // print(products);
    return response;
  }
}
