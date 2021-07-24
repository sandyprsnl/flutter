import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './fevorites_screen.dart';
import './categories_screen.dart';

// class TabsScreen extends StatefulWidget {
//   // const TabsScreen({ Key? key }) : super(key: key);

//   @override
//   _TabsScreenState createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         // initialIndex: 0,
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text('Meals'),
//             bottom: TabBar(
//               tabs: [
//                 Tab(
//                   icon: Icon(Icons.category),
//                   text: 'Categories',
//                 ),
//                 Tab(
//                   icon: Icon(Icons.star),
//                   text: 'Favorites',
//                 )
//               ],
//             ),
//           ),
//           body: TabBarView(children: <Widget>[
//             CategoriesScreen(),
//             FevoritesScreen(),
//           ]),
//         ));
//   }
// }

class TabsScreen extends StatefulWidget {
  // const TabsScreen({ Key? key }) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': Text('Categories'),
    },
    {
      'page': FevoritesScreen(),
      'title': Text(' Your Fevorites'),
    },
  ];
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _pages[_selectedPageIndex]['title'],
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: 'Fevorites'),
        ],
      ),
    );
  }
}
