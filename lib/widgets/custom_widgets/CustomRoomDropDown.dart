import 'package:flutter/material.dart';

//ignore: must_be_immutable
class CustomRoomDropDown extends StatefulWidget {
  final double width;
  final double height;
  TextEditingController controller;

  CustomRoomDropDown({@required this.width, @required this.height, @required this.controller});

  @override
  _CustomRoomDropDownState createState() => _CustomRoomDropDownState();
}

class _CustomRoomDropDownState extends State<CustomRoomDropDown> {
  String selected = 'Superior';

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
          Text('Room Type: ',
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
                  'Superior',
                  'Business Class',
                  'Executive Suite',
                  'Holiday Suite',
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
