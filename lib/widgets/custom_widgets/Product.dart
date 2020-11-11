import 'package:Remmie/widgets/widgets.dart';
import 'package:flutter/material.dart';

enum incrementDecrement {
  increment,
  decrement,
}

typedef UpdateHandle<T> = void Function({@required Products product,@required incrementDecrement action});

class Products {
  int id;
  String name;
  double price;

  Products({@required this.id,@required this.name,@required this.price});
}
class Product extends StatefulWidget {
  String imageLocation,name,description;
  double price;
  int id,stock;
  UpdateHandle updateHandle;

  Product({@required this.id,this.imageLocation,@required this.name,this.description,@required this.price,@required this.stock,@required this.updateHandle});
  
  @override
  _ProductState createState() => _ProductState();
}
class _ProductState extends State<Product> with AutomaticKeepAliveClientMixin<Product>{
  int quantity=0;

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(this.widget.imageLocation),
            )
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.only(
                left: 5,
              ),
              child: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(this.widget.name),
                  Text('Php'+this.widget.price.toStringAsFixed(2)+'/serving'),
                  Text(this.widget.description),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  Expanded(
                    flex: 3,
                    // child: DecoratedBox(
                    //   decoration: BoxDecoration(
                    //     color: const Color(0xFFEEEEEE),
                    //   ),
                    //   child: ButtonTheme(
                    //     height: 10.0,
                        child: ElevatedButton(
                          child: Text("-"),
                          onPressed: (){
                            updateCart(incrementDecrement.decrement);
                          },
                        ),
                      // ),
                    // ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Text(quantity.toString()),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      child: Text("+"),
                      onPressed: (){
                        updateCart(incrementDecrement.increment);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void updateCart(incrementDecrement action) {
    if (!(action==incrementDecrement.decrement && quantity==1) && !(action==incrementDecrement.increment && quantity==this.widget.stock)){
      this.widget.updateHandle(
        product: Products(
          id: this.widget.id,
          name: this.widget.name,
          price: this.widget.price,
        ),
        action: action,
      );
      if (action == incrementDecrement.increment){
        setState(() {
          quantity += 1;
        });
      }else {
        setState(() {
          quantity -= 1;
        });
      }
    }
  }
}