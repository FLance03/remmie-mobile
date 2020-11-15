import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class RoomServicePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FoodsBeverages();
  }
}
class Line_Items {
  Products product;
  int quantity;

  Line_Items({@required this.product,@required this.quantity});

  double getLinePrice(){
    double retVal = quantity*product.price;
    retVal = double.parse(retVal.toStringAsFixed(2));
    return retVal;
  }
}
class Cart {
  List<Line_Items> lineItems;

  Cart([List<Line_Items> lineItems]) {
    this.lineItems = lineItems==null ? [] : lineItems;
  }

  double getTotalPrice() {
    return lineItems.fold(0, (prev, lineItem) => prev+lineItem.getLinePrice());
  }
}
class FoodsBeverages extends StatefulWidget {

  @override
  _FoodsBeveragesState createState() => _FoodsBeveragesState();
}

class _FoodsBeveragesState extends State<FoodsBeverages> {
  Cart inCart;
  int count=0;

  _FoodsBeveragesState() {
    this.inCart = new Cart();
  }

  void callback({@required Products product,@required incrementDecrement action}) {
    int indexCart;

    indexCart = inCart.lineItems.indexWhere((lineItem)=> lineItem.product.id==product.id);
    if (indexCart == -1 && action == incrementDecrement.increment){
      setState((){
        inCart.lineItems.add(new Line_Items(product:product, quantity:1));
      });
    }else if (indexCart != -1){
      if(action == incrementDecrement.increment){
        setState((){
          inCart.lineItems[indexCart].quantity += 1;
        });
      }else {
        if (inCart.lineItems[indexCart].quantity == 1){
          setState(() {
            inCart.lineItems.removeAt(indexCart);
          });
        }else {
          setState(() {
            inCart.lineItems[indexCart].quantity -= 1;
          });
        }
      }
    }
  }
  @override
  Widget build(BuildContext outContext) {
    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context);

          return Scaffold(
            appBar: AppBar(
              title: Text('Room Service'),
              bottom: TabBar(
                tabs: <Tab>[Tab(text:'Foods'),Tab(text:'Beverages')],
              ),
            ),
            body: Container(
              child: Column(
                children: [
                  Expanded(
                    child: TabBarView(
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
                  ),
                  Expanded(
                    child: DraggableScrollableSheet(
                      initialChildSize: 0.5,
                      minChildSize: 0.5,
                      maxChildSize: 1,
                      builder: (BuildContext context, ScrollController scrollController){
                        return Column(
                          children: [
                            Expanded(
                              flex: 6,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(width: 1.5, color: const Color(0xFF000000)),
                                  ),
                                ),
                                child: ListView.builder(
                                  controller: scrollController,
                                  itemCount: inCart.lineItems.length+1,
                                  itemBuilder: (BuildContext context, int index) {
                                    if (index==0){
                                      return ListTile(
                                        title: Text(
                                          'Your Cart:',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      );
                                    }
                                    return ListTile(
                                      title: Row(
                                        children:[
                                          Expanded(child: Text('${inCart.lineItems[index-1].product.name}')),
                                          Expanded(child: Text('${inCart.lineItems[index-1].product.price}')),
                                          Expanded(child: Text('${inCart.lineItems[index-1].getLinePrice()}')),
                                        ]
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Total: ${inCart.getTotalPrice().toStringAsFixed(2)}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ),
                            ),
                          ]
                        );
                        // Container(child:Text('a'));
                      },
                    ),
                  ),
                  // Text('${count}'),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
