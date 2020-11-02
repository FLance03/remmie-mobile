import 'package:flutter/material.dart';

class DisplayDrawer extends StatelessWidget {
  final String current;
  final List <String>items;

  DisplayDrawer({@required this.items,this.current});
  Widget build(BuildContext context){
    return Drawer(
      child: ListView.builder(
        itemCount: items.length+1,
        itemBuilder: (BuildContext context, int index){
          if (index==0){
            return DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              );
          }
          index -= 1;
          int selectedIndex = items.indexOf(current);
          return ListTile(
            title: Text(items[index]),
            selected: selectedIndex==index,
          );
        },
      ),
        // padding: EdgeInsets.zero,
        // children: <Widget>[
          
        //   ListTile(
        //     title: Text('Home'),
        //   ),
        //   ListTile(
        //     title: Text('Item 1'),
        //   ),
        //   ListTile(
        //     title: Text('Exit'),
        //     onTap: (){
        //       Navigator.pop(context);
        //     },
        //   ),
        // ],
      );
    // );
  }
}