import 'package:flutter/material.dart';

class IconTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;

  IconTextField({@required this.hintText, @required this.icon});
  
  @override
  Widget build(BuildContext context) {
    return Container(
        // width: 20.0,
        height: 35.0,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
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
