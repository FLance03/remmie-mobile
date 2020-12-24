import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// lel :) - daniel
//ignore: must_be_immutable
class CustomDatePicker extends StatefulWidget {
  final double width;
  final double height;
  final String label;
  TextEditingController controller;

  CustomDatePicker(
      {@required this.width,
      @required this.height,
      @required this.label,
      @required this.controller});

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime _dateTime;
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
          Text(widget.label,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2F2F2F),
              )),
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              width: 60.0,
              child: FlatButton(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: AbsorbPointer(
                    child: TextField(
                      controller: widget.controller,
                      autofocus: false,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w300,
                        color: Color(0xFF2F2F2F),
                      ),
                    ),
                  ),
                ),
                onPressed: () => {
                  showDatePicker(
                    context: context,
                    initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                    firstDate: DateTime(2012),
                    lastDate: DateTime(2222),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData
                            .light(), // This will change to light theme.
                        child: child,
                      );
                    },
                  ).then((date) {
                    setState(() {
                      _dateTime = date;
                    });
                    widget.controller.text = 
                        DateFormat.yMMMMd('en_US').format(_dateTime).toString();
                        // YYYY-MM-DD HH:MI:SS.
                  })
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
