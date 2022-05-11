import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(right: 15.0, bottom: 5.0),
        child: Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage('assets/profile.png'))),
      ),
      RichText(
          text: TextSpan(
              text: 'Hello, ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w400),
              children: <TextSpan>[
            TextSpan(
              text: 'Vaishali!',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            )
          ])),
      const SizedBox(height: 40.0),
      SizedBox(
        height: (MediaQuery.of(context).size.height / 2) - 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.black,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Create\nNew Meeting',
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            height: 1.5)),
                    Spacer(),
                    Text(
                      'Start meeting',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.black,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Join meeting',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5)),
                          Spacer(),
                          Icon(
                            Icons.video_call_outlined,
                            color: Colors.white,
                            size: 35.0,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 30,
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.black,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Schedule',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5)),
                          Spacer(),
                          Icon(
                            Icons.calendar_today_rounded,
                            color: Colors.white,
                            size: 30.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 40.0),
      Text('Scheduled meeting',
          style: TextStyle(
              color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w700)),
    ]);
  }
}
