import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

// typedef UpdateCart<T> = void Function({@required String name,@required int quantity,@required double price});

class Tabs extends StatefulWidget {
  final String section;
  final UpdateHandle updateHandle;

  Tabs({@required this.section,@required this.updateHandle});

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  
  @override
  Widget build(BuildContext outContext) {
    return displayProducts();
  }
  Widget displayProducts() {
    Widget retVal;

    if (this.widget.section == 'Foods') {
      retVal = ListView(
        children: [
          Product(
            id: 1,
            name: 'Grilled Burgers',
            imageLocation: 'assets/grilled_burger.PNG',
            price: 185.5,
            description: '2 Patty Burger',
            stock: 7,
            updateHandle: this.widget.updateHandle,
          ),
          Product(
            id: 2,
            name: 'Fries',
            imageLocation: 'assets/fries.PNG',
            price: 85.99,
            description: 'Includes Ketchup',
            stock: 5,
            updateHandle: this.widget.updateHandle,
          ),
          Product(
            id: 3,
            name: 'Noodles',
            imageLocation: 'assets/noodles.PNG',
            price: 70.50,
            description: 'Its Long',
            stock: 10,
            updateHandle: this.widget.updateHandle,
          ),
          Product(
            id: 10,
            name: 'Noodles',
            imageLocation: 'assets/noodles.PNG',
            price: 70.50,
            description: 'Its Long',
            stock: 10,
            updateHandle: this.widget.updateHandle,
          ),
          Product(
            id: 11,
            name: 'Noodles',
            imageLocation: 'assets/noodles.PNG',
            price: 70.50,
            description: 'Its Long',
            stock: 10,
            updateHandle: this.widget.updateHandle,
          ),
          Product(
            id: 12,
            name: 'Noodles',
            imageLocation: 'assets/noodles.PNG',
            price: 70.50,
            description: 'Its Long',
            stock: 10,
            updateHandle: this.widget.updateHandle,
          ),
          Product(
            id: 12,
            name: 'Noodles',
            imageLocation: 'assets/noodles.PNG',
            price: 70.50,
            description: 'Its Long',
            stock: 10,
            updateHandle: this.widget.updateHandle,
          ),
          Product(
            id: 12,
            name: 'Noodles',
            imageLocation: 'assets/noodles.PNG',
            price: 70.50,
            description: 'Its Long',
            stock: 10,
            updateHandle: this.widget.updateHandle,
          ),
          Product(
            id: 12,
            name: 'Noodles',
            imageLocation: 'assets/noodles.PNG',
            price: 70.50,
            description: 'Its Long',
            stock: 10,
            updateHandle: this.widget.updateHandle,
          ),
          Product(
            id: 12,
            name: 'Noodles',
            imageLocation: 'assets/noodles.PNG',
            price: 70.50,
            description: 'Its Long',
            stock: 10,
            updateHandle: this.widget.updateHandle,
          ),
          SizedBox(height:50), // Placeholder since DraggableScrollableSheet may cover the last product
        ],
      );
    }else {
      retVal = ListView(
        children: [
          Product(
            id: 4,
            name: 'Pepsi',
            imageLocation: 'assets/pepsi.png',
            price: 40.0,
            description: 'Black',
            stock: 12,
            updateHandle: this.widget.updateHandle,
          ),
          Product(
            id: 5,
            name: 'Royal',
            imageLocation: 'assets/royal.png',
            price: 30.0,
            description: 'Orange',
            stock: 15,
            updateHandle: this.widget.updateHandle,
          ),
          SizedBox(height:50), // Placeholder since DraggableScrollableSheet may cover the last product
        ],
      );
    }
    return retVal;
  }
}
