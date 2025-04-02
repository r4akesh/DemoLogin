import 'package:bloc_login/HomeScreen.dart';
import 'package:bloc_login/CounterScreen.dart';
import 'package:bloc_login/ProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'botton_nav/bottombar_bloc.dart';

class MainTabBar extends StatelessWidget {
    MainTabBar({super.key});

  final List<Widget> _pages=[
    HomeScreen(),
    CounterScreen(),
    ProfileScreen(),
    // Center(child: Text('Home'),),
    // Center(child: Text('Search'),),
    // Center(child: Text('Profile'),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DemoBlocApp'),),
      body: BlocBuilder<BottombarBloc,BottombarState>(
        builder: (context,state)  {
          return _pages[state!.selectedindex];
        },
      ),
      bottomNavigationBar: BlocBuilder<BottombarBloc,BottombarState>(
        builder:(context,state){
          return BottomNavigationBar(
            currentIndex: state.selectedindex,
            onTap: (index){
                context.read<BottombarBloc>().add(TabSelected(index));
            }, items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
          ],
          );
        }
      ),
    );
  }
}
