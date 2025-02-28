import 'package:crud_practice/service/services.dart';

class ProductList{

  static Future<List> getProduct() async{
    final response = await getProductList();
    return response;
  }
}
