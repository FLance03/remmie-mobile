import 'package:flutter/material.dart';

class CustomRoomDropDown extends StatefulWidget {
  final double width;
  final double height;

  CustomRoomDropDown({@required this.width, @required this.height});

  @override
  _CustomRoomDropDownState createState() => _CustomRoomDropDownState();
}

class _CustomRoomDropDownState extends State<CustomRoomDropDown> {
  String selected = 'Deluxe';

  @override
  Widget build(BuildContext context) {
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
                  'Deluxe',
                  'Single',
                  'Double',
                  'Triple',
                  'Queen',
                  'King',
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
