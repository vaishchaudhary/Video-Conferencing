import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_conferencing/HomePage/bloc/home_page_bloc.dart';
import 'package:video_conferencing/HomePage/pages/widgets/loader_widget.dart';
import 'package:video_conferencing/HomePage/pages/widgets/top_header_widget.dart';

import 'widgets/bottom_view.dart';
import 'widgets/error_widget.dart';
import 'widgets/loaded_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  late HomeBloc _homeBloc;
  late List<IconInfo> bottomIcons;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 35.0, right: 25.0, top: 50.0,bottom: 100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TopHeader(),
                    BlocBuilder(
                        buildWhen: (previous, current) => current is HomeState,
                        bloc: _homeBloc,
                        builder: (context, HomeState state) {
                          switch (state.status) {
                            case Status.LOADING:
                              return LoaderWidget();
                            case Status.LOADED:
                              return LoadedWidget(state.data);
                            case Status.ERROR:
                              return HomeErrorWidget(onRetry);
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
          BottomIconView(bottomIcons),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  void onRetry(){
    _homeBloc.loadData();
  }
  @override
  void initState() {
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.loadData();
    bottomIcons = _homeBloc.getBottomIconList();
  }
}
