import 'package:flutter/material.dart';

//ignore: must_be_immutable
class CustomCardDropDown extends StatefulWidget {
  final double width;
  final double height;
  TextEditingController controller;

  CustomCardDropDown({@required this.width, @required this.height, this.controller});

  @override
  _CustomCardDropDownState createState() => _CustomCardDropDownState();
}

class _CustomCardDropDownState extends State<CustomCardDropDown> {
  String selected = 'VISA';
  
  @override
  Widget build(BuildContext context) {
    widget.controller.text = selected;
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 0.5),
            blurRadius: 0.8,
          ),
        ],
      ),
      child: Row(
        children: [
          Text('Credit Card: ',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2F2F2F),
              )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: DropdownButton(
                items: [
                  'VISA',
                  'MasterCard',
                  'Discover',
                  'American Express',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Center(
                        child: Text(
                      value,
                    )),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selected = newValue;
                  });
                  widget.controller.text = selected;
                },
                value: selected,
                isExpanded: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
