import 'package:flutter/material.dart';
import 'package:news_app/service/dio_helper/dio_services.dart';
import 'package:news_app/src/app_root.dart';

main(){


  DioHelper.init();
  runApp(AppRoot());
}