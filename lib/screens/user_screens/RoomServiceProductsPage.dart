import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../api.dart';
import '../../widgets/widgets.dart';

class RoomServiceProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FoodsBeverages();
  }
}

class LineItems {
  Products product;
  int quantity;

  LineItems({@required this.product, @required this.quantity});

  double getLinePrice() {
    double retVal = quantity * product.price;
    retVal = double.parse(retVal.toStringAsFixed(2));
    return retVal;
  }
}

class Cart {
  List<LineItems> lineItems;

  Cart([List<LineItems> lineItems]) {
    this.lineItems = lineItems == null ? [] : lineItems;
  }

  double getTotalPrice() {
    return lineItems.fold(
        0, (prev, lineItem) => prev + lineItem.getLinePrice());
  }
}

class FoodsBeverages extends StatefulWidget {
  @override
  _FoodsBeveragesState createState() => _FoodsBeveragesState();
}

class _FoodsBeveragesState extends State<FoodsBeverages> {
  Cart inCart;
  int count = 0;

  _FoodsBeveragesState() {
    this.inCart = new Cart();
  }

  void callback(
      {@required Products product, @required incrementDecrement action}) {
    int indexCart;

    indexCart = inCart.lineItems
        .indexWhere((lineItem) => lineItem.product.id == product.id);
    if (indexCart == -1 && action == incrementDecrement.increment) {
      setState(() {
        inCart.lineItems.add(new LineItems(product: product, quantity: 1));
      });
    } else if (indexCart != -1) {
      if (action == incrementDecrement.increment) {
        setState(() {
          inCart.lineItems[indexCart].quantity += 1;
        });
      } else {
        if (inCart.lineItems[indexCart].quantity == 1) {
          setState(() {
            inCart.lineItems.removeAt(indexCart);
          });
        } else {
          setState(() {
            inCart.lineItems[indexCart].quantity -= 1;
          });
        }
      }
    }
  }
  void checkout() async {
    String apiUrl = Api.cart;
    final Map<String,Map<String,String>> cartContents = {};
    for (int i=0 ; i<inCart.lineItems.length ; i++){
      cartContents[inCart.lineItems[i].product.id.toString()] = {
        "price": inCart.lineItems[i].product.price.toString(),
        "quantity": inCart.lineItems[i].quantity.toString(),
      };
    }
    print(cartContents);
    final userId = await FlutterSession().get("id");
    final reservationId = await FlutterSession().get("id");
    var body = json.encode({
      "user_id": userId,
      "reservation_id": reservationId,
      "cart": cartContents
    });
    print(body);
    final res = await http.post(apiUrl, body: body);
    if (res.statusCode != 200){
      print("Error: "+res.statusCode.toString());
    }
    var data = jsonDecode(res.body);

  }
  @override
  Widget build(BuildContext outContext) {
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Room Service'),
            bottom: TabBar(
              tabs: <Tab>[Tab(text: 'Foods'), Tab(text: 'Beverages')],
            ),
          ),
          body: Container(
            child: Stack(
              children: [
                TabBarView(
                  children: [
                    Tabs(
                      section: "Foods",
                      updateHandle: callback,
                    ),
                    Tabs(
                      section: "Beverages",
                      updateHandle: callback,
                    ),
                  ],
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.2,
                  minChildSize: 0.1,
                  maxChildSize: 0.5,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: inCart.lineItems.length + 3,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return ListTile(
                              title: Text(
                                'Your Cart',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            );
                          } else if (index < inCart.lineItems.length + 1) {
                            return ListTile(
                              title: Row(children: [
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Text(
                                        '${inCart.lineItems[index - 1].product.name}'),
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                        '${inCart.lineItems[index - 1].quantity}')),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    '₱${inCart.lineItems[index - 1].getLinePrice()}',
                                    style: TextStyle(
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ]),
                            );
                          } else if (index < inCart.lineItems.length + 2) {
                            return Center(
                                child: Text(
                              'TOTAL: ₱${inCart.getTotalPrice().toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ));
                          } else {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 100),
                              child: ElevatedButton(
                                child: Text("CHECKOUT"),
                                onPressed: () {
                                  checkout();
                                },
                              ),
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
