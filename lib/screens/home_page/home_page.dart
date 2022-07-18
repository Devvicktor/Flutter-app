import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';
import 'package:my_app/screens/categories/all_categories.dart';
import 'package:my_app/screens/home_page/components/body.dart';

import '../cart/cart_screen.dart';
import '../sign_in/login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  static String routeName = "/";
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        //add sign in button here
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded),
            onPressed: () {
              Navigator.pushNamed(context, SignInScreen.routeName);
            },
          ),
          IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, CartScreen.routeName),
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: const Body(),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: GlobalVaraibles.secondaryColor,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () async {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, MyHomePage.routeName);
              break;
            case 1:
              Navigator.pushNamed(context, AllCategoriesScreen.routeName);
              break;
            case 2:
              Navigator.pushNamed(context, SignInScreen.routeName);
              break;
            default:
              Navigator.pushNamed(context, MyHomePage.routeName);
              break;
          }
        },
        selectedItemColor: GlobalVaraibles.secondaryColor,
      ),
    );
  }
}
