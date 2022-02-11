import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'home_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(

      backgroundColor: Colors.black,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Icon(Icons.book , size: 60,color: Colors.white,),
              Text('365 News' , style: TextStyle(fontSize: 50 , fontFamily: 'Satisfy', color: Colors.white),),
            ],),
          ),
          Text('All News you searching is here !' , style: TextStyle(fontSize: 15 , fontFamily: 'Satisfy', color: Colors.white),),
        ],
      ), nextScreen: HomeView(), splashTransition: SplashTransition.fadeTransition , duration:400000,);
  }
}
