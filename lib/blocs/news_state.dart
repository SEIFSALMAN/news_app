part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}
class NewsLoadingState extends NewsState {}
class NewsErrorState extends NewsState {}
class NewsSuccessState extends NewsState {}
class AppChangeBottomNavBarState extends NewsState {}

