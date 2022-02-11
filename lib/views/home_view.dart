import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/news_cubit.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
      },
      builder: (context, state) {

        var newsCubit = NewsCubit.get(context);

        return newsCubit.articles.isEmpty?
            Center(child: CircularProgressIndicator())
            :
          Scaffold(backgroundColor: Colors.black,
          appBar: AppBar(
            actions: [
              PopupMenuButton(
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem<int>(
                        value: 0,
                        child: Text("Choose Country"),
                      ),
                      PopupMenuItem<int>(
                        value: 1,
                        child: Text("My Account"),
                      ),

                      PopupMenuItem<int>(
                        value: 2,
                        child: Text("Settings"),
                      ),

                      PopupMenuItem<int>(
                        value: 3,
                        child: Text("Logout"),
                      ),
                    ];
                  },
                  onSelected: (value) {
                    if (value == 0) {
                      print("My account menu is selected.");
                    } else if (value == 1) {
                      print("Settings menu is selected.");
                    } else if (value == 2) {
                      print("Logout menu is selected.");
                    }
                  }
              ),

            ],
            backgroundColor: Colors.black,
            title: Text('365 News',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,fontFamily: 'Satisfy'),),
            shadowColor: Colors.white,
          ),
          body: Center(
            child: ListView.builder(

              itemCount: newsCubit.articles.length,
              itemBuilder:(context,index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(29),
                ),

                        child: Padding(
                          padding: const EdgeInsets.all(19.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,

                            children: [
                              Image.network(
                                  newsCubit.articles[index].urlToImage==null?
                                   'https://e0.365dm.com/22/01/1600x900/skysports-mohamed-salah-liverpool_5638215.jpg?20220111105345'   :newsCubit.articles[index].urlToImage!
                              ),
                              Text(newsCubit.articles[index].title!,style: TextStyle(color: Colors.white),textDirection:TextDirection.rtl ,),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              })
          ),
            bottomNavigationBar: BottomNavigationBar(

              currentIndex: NewsCubit.get(context).currentIndex,
              onTap: (index){
                newsCubit.changedIndex(index);
              },

              backgroundColor: Colors.black,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(

                  icon: Icon(Icons.home_outlined,color: Colors.white,),
                  label: 'Home' ,
                    backgroundColor: Colors.black,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border,color: Colors.white,),
                  label: 'Favorite',
                    backgroundColor: Colors.black
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search,color: Colors.white,),
                  label: 'Search' ,
                    backgroundColor: Colors.black
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_none_rounded,color: Colors.white,),
                  backgroundColor: Colors.black,
                  label: 'Notifications',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.perm_contact_calendar_outlined,color: Colors.white,),
                  backgroundColor: Colors.black,
                  label: 'Profile',
                ),
              ],
            ),
        );
      },
    );
  }
  }

