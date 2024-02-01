import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movie/network/network_request.dart';
import 'package:flutter_movie/widget/home.dart';
import 'package:wakelock/wakelock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  Wakelock.enable();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieAppLayout(),
    );
  }
}

class MovieAppLayout extends StatefulWidget {
  const MovieAppLayout({super.key});

  @override
  State<MovieAppLayout> createState() => MovieAppLayoutState();
}

class MovieAppLayoutState extends State<MovieAppLayout> {
  int _selectedIndex = 0;

  final _widgetOptions = PageType.values.map((e) => PageHome(type: e)).toList();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> getBottomNavigationBarItems() {
    return PageType.values
        .map((e) => BottomNavigationBarItem(icon: Icon(e.icon), label: e.name))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // Fixed
        backgroundColor: Colors.black,
        // <-- This works for fixed
        unselectedItemColor: Colors.grey,
        items: getBottomNavigationBarItems(),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pinkAccent,
        elevation: 4.0,
        onTap: _onItemTapped,
      ),
    );
  }
}
