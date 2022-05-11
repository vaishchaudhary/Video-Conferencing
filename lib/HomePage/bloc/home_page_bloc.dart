import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_conferencing/HomePage/bloc/home_page_repository.dart';
import 'package:video_conferencing/HomePage/bloc/meeting_model.dart';

class HomeBloc extends Cubit<HomeState>{
  HomePageRepository _homePageRepository = HomePageRepository();
  HomeBloc() : super(HomeState(Status.LOADING));
  void _emit(HomeState state){
    emit(state);
  }
  Future<void> loadData() async {
    _emit(HomeState(Status.LOADING));
    MeetingData? data = await _homePageRepository.loadData("api/meeting/meetings");
    if(data?.error != null)
      _emit(HomeState(Status.ERROR));
    else
      _emit(HomeState(Status.LOADED,data: data));
  }

  List<IconInfo> getBottomIconList() {
    List<IconInfo> iconsList=[];
    iconsList.add(IconInfo(Icons.videocam_outlined,"Video Conferencing"));
    iconsList.add(IconInfo(Icons.live_tv_outlined,"Live Streaming"));
    iconsList.add(IconInfo(Icons.message_outlined,"Messenger"));
    iconsList.add(IconInfo(Icons.forum_outlined,"Forum"));
    iconsList.add(IconInfo(Icons.settings,"Setting"));
    return iconsList;
  }
}
class IconInfo{
  final IconData iconData;
  final String IconName;
  IconInfo(this.iconData, this.IconName);
}
class HomeState{
  final Status status;
  final MeetingData? data;
  HomeState(this.status,{this.data});
}
enum Status{
  LOADING,
  LOADED,
  ERROR
}