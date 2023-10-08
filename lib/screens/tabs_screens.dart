import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_app_flutter/screens/categorys_Screen.dart';
import 'package:navigation_app_flutter/screens/favorite_screen.dart';

import '../components/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  final List<Map<String, dynamic>> _screens = [
    {
      'tittle': 'Lista De Categorias',
      'sreen': CategoriesScreen(),
    },
    {
      'tittle': 'Meus Favoritos',
      'sreen': FavoriteScreen(),
    },
  ];

  _selectScreen(int Index) {
    setState(() {
      _selectedScreenIndex = Index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['tittle']),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['sreen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.background,
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.category),
            label: "Categorias",
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.favorite),
            label: "Favoritos",
          ),
        ],
      ),
    );

    // return DefaultTabController(length: 2,
    // child: Scaffold(
    //   appBar: AppBar(
    //     title: Text("Vamos cozinhar"),
    //     bottom: const TabBar(tabs: [
    //       Tab(
    //         icon: Icon(Icons.category),text: 'Categorias',
    //       ),
    //       Tab(
    //         icon: Icon(Icons.favorite),text: 'Favorite',
    //       )
    //     ]),
    //   ),
    //   body: TabBarView(children: [
    //     CategoriesScreen(),
    //     FavoriteScreen()
    //   ]),
    // ));
  }
}
