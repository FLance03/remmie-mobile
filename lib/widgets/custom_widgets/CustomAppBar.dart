import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
    CustomAppBar({Key key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

    @override
    final Size preferredSize; // default is 56.0

    @override
    _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>{
    @override
    Widget build(BuildContext context) {
        return AppBar(
            title: Text('remmie',
                style: TextStyle(
                  letterSpacing: 1.0,
                  color: Colors.black,
                )),
            centerTitle: true,
            // backgroundColor: Colors.red[600],
          );
    }
}