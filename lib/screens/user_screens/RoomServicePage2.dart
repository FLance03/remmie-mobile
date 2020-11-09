import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class RoomServicePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FoodsBeverages();
  }
}
class LineItem {
  String name;
  int quantity;
  double price;

  LineItem({@required this.name,@required this.quantity,@required this.price});

  double getLinePrice(){
    double retVal = quantity*price;
    retVal = double.parse(retVal.toStringAsFixed(2));
    return retVal;
  }
}
class Cart {
  List<LineItem> cartContents;

  Cart([List<LineItem> cartContents]) {
    this.cartContents = cartContents==null ? [] : cartContents;
  }

  double getTotalPrice() {
    return cartContents.fold(0, (prev, lineItem) => prev+lineItem.getLinePrice());
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

  void callback({@required String name,@required int quantity,@required double price}) {
    setState((){
      inCart.cartContents.add(new LineItem(name: name, quantity: quantity, price: price));
    });
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
            body: SizedBox.expand(
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
                                  itemCount: inCart.cartContents.length+1,
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
                                          Expanded(child: Text('${inCart.cartContents[index-1].name}')),
                                          Expanded(child: Text('${inCart.cartContents[index-1].price}')),
                                          Expanded(child: Text('${inCart.cartContents[index-1].getLinePrice()}')),
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
