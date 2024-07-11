import 'package:flutter/material.dart';
import 'bacaandoa.dart';
import 'comments_page.dart';
import 'pesan_page.dart';
import 'favorite_page.dart'; // Import file favorite_page.dart di sini

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<String> _favorites = [];

  static List<Widget> _widgetOptions(BuildContext context, List<String> favorites) => <Widget>[
    HomeContent(),
    BacaanDoaPage(),
    CommentsPage(),
    PesanPage(),
    FavoritePage(favorites: favorites), // Tambahkan widget FavoritePage di sini
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: _widgetOptions(context, _favorites).elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.purple), // Ikon dengan warna ungu
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book, color: Colors.grey), // Ikon dengan warna abu-abu
            label: 'Bacaan Solat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment, color: Colors.grey), // Ikon dengan warna abu-abu
            label: 'Comments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Colors.grey), // Ikon dengan warna abu-abu
            label: 'Pesan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.grey), // Ikon love untuk menu favorit
            label: 'Favorite',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple, // Warna untuk item yang dipilih
        unselectedItemColor: Colors.grey, // Warna untuk item yang tidak dipilih
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        height: screenHeight,
        width: screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/home.png', // Pastikan file gambar berada di folder 'assets'
                        height: screenHeight * 0.3,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Selamat Datang Di Aplikasi Doa-Doa Harian',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Aplikasi ini menyediakan berbagai bacaan doa sehari-hari ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login'); // Ganti dengan route ke halaman login
                            },
                            child: Text('Login'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange, // Ganti primary dengan backgroundColor
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register'); // Ganti dengan route ke halaman register
                            },
                            child: Text('Register'),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.orange),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                              foregroundColor: Colors.orange, // Warna teks
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
