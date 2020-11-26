import 'package:flutter/material.dart';

class IconTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final double vertical;

  IconTextField({@required this.hintText, @required this.icon, this.vertical});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      margin: EdgeInsets.symmetric(
          vertical: vertical != null ? vertical : 10.0, horizontal: 40.0),
      child: TextFormField(
        autofocus: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: this.hintText,
          contentPadding: EdgeInsets.only(top: 20.0),
          prefixIcon: Icon(
            this.icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
