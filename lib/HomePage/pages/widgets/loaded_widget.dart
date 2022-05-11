import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../bloc/meeting_model.dart';

class LoadedWidget extends StatelessWidget {
  final MeetingData? data;

  const LoadedWidget(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: data?.body?.meetings?.length,
          itemBuilder: (context, index) {
            Meetings? item = data?.body?.meetings?[index];
           return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [BoxShadow(
                    color: Colors.grey.shade50,
                    blurRadius: 10.0,
                  )],
                  gradient: LinearGradient(
                    stops: [0, 0.015],
                    colors: [
                      Colors.red,
                      Colors.white,
                    ],
                  )
              ),
              width: 200.0,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0, horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${item?.name}',style:
                  TextStyle(fontWeight: FontWeight.w600,fontSize: 16.0,
                  color: Colors.black)),
                  const SizedBox(height: 8.0),
                  Text('${item?.startTime} - ${item?.endTime}',style:
                  TextStyle(fontWeight: FontWeight.w400,fontSize: 12.0,
                      color: Colors.black)),
                ],
              ),
            );
          }),
    );
  }
}
