import 'package:flutter/material.dart';

class IconTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;

  IconTextField({@required this.hintText, @required this.icon});
  
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
        child: TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.black,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(20.0),
            ),
            hintText: this.hintText,
            contentPadding: EdgeInsets.only(top: 20),
            prefixIcon: Icon(
              this.icon,
              color: Colors.black,
            ),
          ),
        ),
    );
  }
}
