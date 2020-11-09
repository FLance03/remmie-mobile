import 'package:flutter/material.dart';

typedef UpdateCart<T> = void Function({@required String name,@required int quantity,@required double price});

class Tabs extends StatefulWidget {
  String section;
  UpdateCart updateHandle;

  Tabs({@required this.section,@required this.updateHandle});

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  
  @override
  Widget build(BuildContext outContext) {
    return Center(
              child: RaisedButton(
                child: Text('Add Test ${this.widget.section}'),
                onPressed: (){
                  this.widget.section=='Foods'
                  ?
                  this.widget.updateHandle(
                    name: 'Test for Foods',
                    quantity: 5,
                    price: 2.5,
                  )
                  :
                  this.widget.updateHandle(
                    name: 'Test for Beverages',
                    quantity: 7,
                    price: 3.45,
                  )
                  ;
                },
              ),
            );
  }
}
