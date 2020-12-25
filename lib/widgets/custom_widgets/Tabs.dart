import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../api.dart';
import '../../widgets/widgets.dart';


// typedef UpdateCart<T> = void Function({@required String name,@required int quantity,@required double price});

class ProductsDB {
  final int id, stock;
  final String name, imageUrl, description,type;
  final double price;

  ProductsDB({
    this.id,
    this.stock,
    this.name,
    this.imageUrl,
    this.description,
    this.type,
    this.price,
  });

  factory ProductsDB.fromJson(Map<String,dynamic> jsonData) {
    return ProductsDB(
      id: jsonData['id'],
      stock: jsonData['stock'],
      name: jsonData['name'],
      imageUrl: Api.address + Api.imageRoute + jsonData['imageUrl'],
      description: jsonData['description'],
      type: jsonData['type'],
      price: jsonData['price'].toDouble(),
    );
  }
}
class Tabs extends StatefulWidget {
  final String section;
  final UpdateHandle updateHandle;

  Tabs({@required this.section, @required this.updateHandle});
 
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List<Widget> foods = [];
  List<Widget> beverages = [];
  int count = 0;

  Future<List<Widget>> getProductsData(String productType) async {
    final String api = Api.tab;
    final response = await http.get(api);
    List<Widget> retVal = [];

    if (response.statusCode == 200) {
      List productData = json.decode(response.body);
      print(productData);
      List <ProductsDB> products = productData.map((product) => new ProductsDB.fromJson(product)).toList();
      for (int i=0 ; i<products.length ; i++){
        if (productType == products[i].type){
          retVal.add(
            Product(
              id: products[i].id,
              name: products[i].name,
              imageLocation: products[i].imageUrl,
              price: products[i].price,
              description: products[i].description,
              stock: products[i].stock,
              updateHandle: this.widget.updateHandle,
            )
          );
        }
      }
    }
    return retVal;
  }
  @override
  Widget build(BuildContext outContext) {
    return displayProducts();
  }
  Widget displayProducts() {
    Widget retVal;

    if (this.widget.section == 'Foods') {
      retVal = FutureBuilder(
        future: getProductsData('food'),
        builder: (context, foods) {
          List<Widget> children;
          if (foods.hasData) {
            children = foods.data;
          } else if (foods.hasError) {
            children = <Widget>[
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${foods.error}'),
              )
            ];
          } else {
            children = <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return ListView(
            children: children,
          );

        }
        // (
        //   children: foods +
        //     [SizedBox(height:50)], // Placeholder since DraggableScrollableSheet may cover the last product
            
            
        // ),
      );
    }else {
      retVal = FutureBuilder(
        future: getProductsData('beverage'),
        builder: (context, beverages) {
          List<Widget> children;
          if (beverages.hasData) {
            children = beverages.data;
          } else if (beverages.hasError) {
            children = <Widget>[
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${beverages.error}'),
              )
            ];
          } else {
            children = <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              )
            ];
          }
          return ListView(
            children: children,
          );

        }
      );
    }
    return retVal;
  }
}
