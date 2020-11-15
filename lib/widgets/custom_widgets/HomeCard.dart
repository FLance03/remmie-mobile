import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String image,title,description,subDescription;
  final Widget rightWidget;

  HomeCard({this.image,this.title,this.description,this.subDescription,this.rightWidget});
  Widget build(BuildContext build) {
    return Column(
      children: [
        Image.asset(
          image,
          width: 600,
          height: 200,
          fit: BoxFit.cover,
        ),
        Container(
          child:Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left:32, right:32, top:16, bottom:4),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                          )
                        ),
                      ),
                    ),
                    rightWidget!=null ? rightWidget : Container(),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left:32, right:32, top:4, bottom:15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 12,
                        )
                      ),
                      subDescription!=null ? Text(
                        subDescription,
                        style: TextStyle(
                          fontSize: 12,
                        )
                      ) : Container(),
                    ]
                ),
              ),
            ],
          ),
        ),
      ],
    );
  } 
}