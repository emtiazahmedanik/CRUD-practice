
import 'package:flutter/material.dart';

import '../../../application/viewmodel/get_products.dart';
import '../../../data/service/services.dart';
import '../style/style.dart';
import 'edit_product_page.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List products = [];
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProduct();

  }
  fetchProduct()async{
    setState(() {
      loading = true;
    });
    products = await ProductList.getProduct();
    setState(() {
      loading = false;
    });
  }
  Future<void> _refresh() async{
    final newProducts = await ProductList.getProduct();
    setState(() {
      products = newProducts;
    });
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: RefreshIndicator(
          onRefresh: _refresh,
          child:loading?Center(child: CircularProgressIndicator()): Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      gridDelegate: sliverGridDelegate(),
                      itemCount: products.length,
                      itemBuilder: (context,index){
                        final product = products[index];
                        final ProductName = product["ProductName"];
                        final Img = product["Img"];
                        final UnitPrice = product["UnitPrice"];
                        final id = product["_id"];
                        return loading==true
                            ?CircularProgressIndicator()
                            :Container(
                          decoration: boxDecoration(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                      Img,
                                    height: 160,
                                    fit: BoxFit.fill,
                                  ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: SizedBox(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Text(ProductName,maxLines: 2,overflow: TextOverflow.ellipsis,),
                                      Text("$UnitPrice"),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            onPressed: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProductPage(index: index,)));
                                            },
                                            icon: Icon(Icons.edit,size: 14,),
                                          ),
                                          IconButton(
                                              onPressed: (){
                                                deleteProduct(id);
                                                _refresh();
                                              },
                                              icon: Icon(Icons.delete_outline,size: 14,)
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                        );
                      }
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
