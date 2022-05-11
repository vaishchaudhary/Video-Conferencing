import 'package:flutter/material.dart';

class HomeErrorWidget extends StatelessWidget{
  final Function? onRetry;
  HomeErrorWidget(this.onRetry,{Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return
        Container(
          margin: const EdgeInsets.symmetric(vertical: 50.0),
          height: MediaQuery.of(context).size.height-100,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.error_outline,color: Colors.red,size: 100),
              Text("OOPS!",style: TextStyle(
                  color: Colors.red,fontSize: 20.0,fontWeight: FontWeight.w600)),
              Text("Issue in loading meetings",style: TextStyle(
                  color: Colors.red,fontSize: 20.0,fontWeight: FontWeight.w600)),
              SizedBox(height: 20.0),
              InkWell(
                onTap:(){ onRetry!();},
                child: Text("Retry",style: TextStyle(
                    color: Colors.blue,fontSize: 25.0,fontWeight: FontWeight.w700)),
              )
            ],
          ),
        );
  }

}