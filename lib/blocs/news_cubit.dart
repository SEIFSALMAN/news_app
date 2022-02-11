import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/model/news.dart';
import 'package:news_app/service/dio_helper/dio_services.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {

  NewsCubit() : super(NewsInitial());
  int currentIndex = 0;

  List<String> titles =
  [
    'Home',
    'Favorite',
    'Search',
    'Notifications',
    'Profile'
  ];

  static NewsCubit get(context) => BlocProvider.of(context);

  List<Articles> articles = [];

  NewsHub? newsHub;


  void changedIndex(int index){
    currentIndex = index;
    emit(AppChangeBottomNavBarState());

  }



  getAllNews(){
    emit(NewsLoadingState());
    DioHelper.getData(query:
      {
        'apikey':'34ab57ef8bbf4ca2be7a84e6e92226d2',
        'country':'eg',
        'category':'sports'
      }
    ).then((value) {


      newsHub = NewsHub.fromJson(value.data);
      for(var news in newsHub!.articles!) {
        articles.add(news);
      }
      emit(NewsSuccessState());

    }).catchError((error){
      print(error.toString());
      emit(NewsErrorState());
    });
  }
}
