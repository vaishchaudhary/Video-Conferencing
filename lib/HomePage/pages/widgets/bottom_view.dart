import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_conferencing/HomePage/bloc/home_page_bloc.dart';

class BottomIconView extends StatelessWidget {
  final List<IconInfo> bottomIcons;
  int selectedIndex = 0;

  BottomIconView(this.bottomIcons, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0.0,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
            ),
            height: 100.0,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: bottomIcons.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: (MediaQuery.of(context).size.width - 40) /
                        bottomIcons.length,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(bottomIcons[index].iconData,
                            size: 30.0,
                            color: index == selectedIndex
                                ? Colors.red
                                : Colors.white),
                        SizedBox(height: 5.0),
                        Expanded(
                          child: Text(bottomIcons[index].IconName,
                              style: TextStyle(
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.bold,
                                  color: index == selectedIndex
                                      ? Colors.red
                                      : Colors.white),
                              textAlign: TextAlign.center),
                        )
                      ],
                    ),
                  );
                })));
  }
}
