import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:video_conferencing/HomePage/bloc/meeting_model.dart';
class HomePageRepository{
  late String token;
  late String BASE_URL;
  HomePageRepository(){
    token = "\$2y\$10\$6y7rX3ImTQUeZhk24lfjkObnOVqa4Y/crkJVybErTK8CX2UXLRVEq";
    BASE_URL = "https://bvidya.websites4demo.com/";
  }
  Future<MeetingData?> loadData(String endPoint) async {
    MeetingData? data;
    try {
      String url = BASE_URL + endPoint;
      Uri uri = Uri.parse(url);
      final MyConnectivity _connectivity = MyConnectivity.instance;
      _connectivity.initialise();

      bool? isInternet;
      _connectivity.myStream.listen((source) {
        if(source == ConnectivityResult.none){
          isInternet= false;
        }
        isInternet= true;
      });
      if(isInternet==false){
        return MeetingData(error: "Connection Issue");
      }
      String token = "\$2y\$10\$6y7rX3ImTQUeZhk24lfjkObnOVqa4Y/crkJVybErTK8CX2UXLRVEq";
      await http
          .get(uri,
          headers: {
            'X-Auth-Token': token,
          })
          .then((response) {
        if (response.statusCode == 200) {
          data = MeetingData.fromJson(jsonDecode(response.body));
        } else {
          print(response.body);
          data = MeetingData(error: "Data Error");
        }
      });
    }
    catch(exp){
      print(exp);
      data = MeetingData(error: "Data Error");
    }
    return data;
  }
}
class MyConnectivity {
  MyConnectivity._();

  static final _instance = MyConnectivity._();
  static MyConnectivity get instance => _instance;
  final _connectivity = Connectivity();
  final _controller = StreamController.broadcast();
  Stream get myStream => _controller.stream;

  void initialise() async {
    try {
      ConnectivityResult result = await _connectivity.checkConnectivity();
      _checkStatus(result);
      _connectivity.onConnectivityChanged.listen((result) {
        _checkStatus(result);
      });
    }catch(exp){}
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }catch (exp) {
      isOnline = false;
    }
    _controller.sink.add({result: isOnline});
  }

  void disposeStream() => _controller.close();
}