import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'bacaandoa.dart';
import 'comments_page.dart';
import 'favorite_page.dart'; // Tambahkan ini

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> favorites = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Doa-Doa Harian',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        '/bacaandoa': (context) => BacaanDoaPage(),
        '/comments': (context) => CommentsPage(),
        '/favorites': (context) => FavoritePage(favorites: favorites), // Tambahkan ini
      },
    );
  }
}
