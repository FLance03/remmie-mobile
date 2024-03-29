import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String image, title, description, subDescription;
  final Widget rightWidget;
  final double height;
  final Function onTap;

  HomeCard(
      {this.image,
      this.title,
      this.description,
      this.subDescription,
      this.rightWidget,
      this.height,
      this.onTap});
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap==null ? (){} : onTap,
      child: Container(
        child: Column(
          children: [
            Image.network(
              image,
              width: MediaQuery.of(context).size.width,
              height: height != null ? height : 200,
              fit: BoxFit.fill,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 20, bottom: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(title,
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                          ),
                        ),
                        rightWidget != null ? rightWidget : Container(),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(
                        left: 32, right: 32, top: 4, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        description!=null
                            ?Text(description,
                              style: TextStyle(
                                fontSize: 12,
                              ))
                            : Container(),
                        subDescription != null
                            ? Text(subDescription,
                                style: TextStyle(
                                  fontSize: 12,
                                ))
                            : Container(),
                      ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
