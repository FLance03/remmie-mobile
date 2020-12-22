import 'package:flutter/material.dart';

class IconTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final double vertical;
  final TextEditingController controller;
  final bool obscureText;
  final String bottomText;

  IconTextField({@required this.hintText, @required this.icon, this.vertical, this.controller, this.obscureText, this.bottomText=''});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 75.0,
      margin: EdgeInsets.symmetric(
          vertical: vertical != null ? vertical : 10.0, horizontal: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            autofocus: false,
            obscureText: obscureText==true ? true : false,
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
          DisplayBottomText(),
          
        ],
      ),
    );
  }
  Widget DisplayBottomText() {
    return bottomText!='' ? 
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              bottomText,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ) : SizedBox(height: 15.0);
  }
}
