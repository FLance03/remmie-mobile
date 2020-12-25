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

  void getProductsData() async {
    final String api = Api.tab;
    final response = await http.get(api);

    if (response.statusCode == 200) {
      List productData = json.decode(response.body);
      print(productData);
      List <ProductsDB> products = productData.map((product) => new ProductsDB.fromJson(product)).toList();
      for (int i=0 ; i<products.length ; i++){
        if (products[i].type == 'food'){
          setState(() {
            foods.add(Product(
              id: products[i].id,
              name: products[i].name,
              imageLocation: products[i].imageUrl,
              price: products[i].price,
              description: products[i].description,
              stock: products[i].stock,
              updateHandle: this.widget.updateHandle,
            ));
          });
        }else if (products[i].type == 'beverage'){
          setState(() {
            beverages.add(Product(
              id: products[i].id,
              name: products[i].name,
              imageLocation: products[i].imageUrl,
              price: products[i].price,
              description: products[i].description,
              stock: products[i].stock,
              updateHandle: this.widget.updateHandle,
            ));
          });
        }
      }
    }
  }
  @override
  Widget build(BuildContext outContext) {
    if (count == 0){
      setState(() {
        count++;
      });
      getProductsData();
    }
    return displayProducts();
  }
  Widget displayProducts() {
    Widget retVal;

    if (this.widget.section == 'Foods') {
      retVal = ListView(
        children: foods +
          [SizedBox(height:50)], // Placeholder since DraggableScrollableSheet may cover the last product
          // Product(
          //   id: 1,
          //   name: 'Grilled Burgers',
          //   imageLocation: 'assets/grilled_burger.PNG',
          //   price: 185.5,
          //   description: '2 Patty Burger',
          //   stock: 7,
          //   updateHandle: this.widget.updateHandle,
          // ),
          // Product(
          //   id: 2,
          //   name: 'Fries',
          //   imageLocation: 'assets/fries.PNG',
          //   price: 85.99,
          //   description: 'Includes Ketchup',
          //   stock: 5,
          //   updateHandle: this.widget.updateHandle,
          // ),
          // Product(
          //   id: 3,
          //   name: 'Noodles',
          //   imageLocation: 'assets/noodles.PNG',
          //   price: 70.50,
          //   description: 'Its Long',
          //   stock: 10,
          //   updateHandle: this.widget.updateHandle,
          // ),
          // Product(
          //   id: 10,
          //   name: 'Noodles',
          //   imageLocation: 'assets/noodles.PNG',
          //   price: 70.50,
          //   description: 'Its Long',
          //   stock: 10,
          //   updateHandle: this.widget.updateHandle,
          // ),
          // Product(
          //   id: 11,
          //   name: 'Noodles',
          //   imageLocation: 'assets/noodles.PNG',
          //   price: 70.50,
          //   description: 'Its Long',
          //   stock: 10,
          //   updateHandle: this.widget.updateHandle,
          // ),
          // Product(
          //   id: 12,
          //   name: 'Noodles',
          //   imageLocation: 'assets/noodles.PNG',
          //   price: 70.50,
          //   description: 'Its Long',
          //   stock: 10,
          //   updateHandle: this.widget.updateHandle,
          // ),
          // Product(
          //   id: 12,
          //   name: 'Noodles',
          //   imageLocation: 'assets/noodles.PNG',
          //   price: 70.50,
          //   description: 'Its Long',
          //   stock: 10,
          //   updateHandle: this.widget.updateHandle,
          // ),
          // Product(
          //   id: 12,
          //   name: 'Noodles',
          //   imageLocation: 'assets/noodles.PNG',
          //   price: 70.50,
          //   description: 'Its Long',
          //   stock: 10,
          //   updateHandle: this.widget.updateHandle,
          // ),
          // Product(
          //   id: 12,
          //   name: 'Noodles',
          //   imageLocation: 'assets/noodles.PNG',
          //   price: 70.50,
          //   description: 'Its Long',
          //   stock: 10,
          //   updateHandle: this.widget.updateHandle,
          // ),
          // Product(
          //   id: 12,
          //   name: 'Noodles',
          //   imageLocation: 'assets/noodles.PNG',
          //   price: 70.50,
          //   description: 'Its Long',
          //   stock: 10,
          //   updateHandle: this.widget.updateHandle,
          // ),
          
      );
    }else {
      retVal = ListView(
        children: beverages + 
          [SizedBox(height:50)], // Placeholder since DraggableScrollableSheet may cover the last product
          // Product(
          //   id: 4,
          //   name: 'Pepsi',
          //   imageLocation: 'assets/pepsi.png',
          //   price: 40.0,
          //   description: 'Black',
          //   stock: 12,
          //   updateHandle: this.widget.updateHandle,
          // ),
          // Product(
          //   id: 5,
          //   name: 'Royal',
          //   imageLocation: 'assets/royal.png',
          //   price: 30.0,
          //   description: 'Orange',
          //   stock: 15,
          //   updateHandle: this.widget.updateHandle,
          // ),
      );
    }
    return retVal;
  }
}
