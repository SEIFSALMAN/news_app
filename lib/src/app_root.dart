import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/news_cubit.dart';
import 'package:news_app/views/home_view.dart';
import 'package:news_app/views/splash_view.dart';

class AppRoot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => NewsCubit()..getAllNews())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:HomeView()
      ),
    );
  }
}
