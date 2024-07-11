import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'doa_detail_page.dart';
import 'favorite_page.dart';

class BacaanDoaPage extends StatefulWidget {
  @override
  _BacaanDoaPageState createState() => _BacaanDoaPageState();
}

class _BacaanDoaPageState extends State<BacaanDoaPage> {
  List<String> favoriteDoas = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  void loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favoriteDoas = prefs.getStringList('favoriteDoas') ?? [];
    });
  }

  void toggleFavorite(String doaName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      if (favoriteDoas.contains(doaName)) {
        favoriteDoas.remove(doaName);
      } else {
        favoriteDoas.add(doaName);
      }
      prefs.setStringList('favoriteDoas', favoriteDoas);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doa Sehari-hari'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritePage(favorites: favoriteDoas),
                ),
              );
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
                  (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          buildDoaCard(
            context,
            doaName: 'Doa untuk Orangtua',
            detail: [
              {
                'namadoa': 'Doa untuk Orangtua',
                'arab': 'اللّهُمَّ اعْفِرْلِيْ وَلِوَالِدَيَّ وَرْحَمْهُمَا كَمَا رَبَّيَانِيْ صَغِيْرَا',
                'latin': 'Allohummaghfirlii waliwaalidayya warhamhumaa kamaa robbayaanii soghiiroo',
                'arti': 'Artinya: "Ya Allah, ampunilah aku dan kedua orang tuaku (ibu dan ayahku), sayangilah mereka seperti mereka menyayangiku di waktu kecil."',
              }
            ],
          ),
          buildDoaCard(
            context,
            doaName: 'Doa Agar Diberikan Nikmat Sehat',
            detail: [
              {
                'namadoa': 'Doa Agar Diberikan Nikmat Sehat',
                'arab': 'اللَّهُمَّ عَافِنِى فِى بَدَنِى اللَّهُمَّ عَافِنِى فِى سَمْعِى اللَّهُمَّ عَافِنِى فِى بَصَرِى لاَ إِلَهَ إِلاَّ أَنْتَ',
                'latin': 'Allahumma afini fi badani, Allahumma afini fi sam i, Allahumma afini fi bashori la ilaha illa Anta',
                'arti': 'Artinya: "Ya Allah, sehatkanlah badanku, Ya Allah sehatkanlah pendengaranku, Ya Allah, sehatkanlah penglihatanku. Tiada Tuhan selain Engkau"',
              }
            ],
          ),
          buildDoaCard(
            context,
            doaName: 'Doa Sebelum Tidur',
            detail: [
              {
                'namadoa': 'Doa Sebelum Tidur',
                'arab': 'بِسْمِكَ اللّهُمَّ اَحْيَا وَاَمُوْتُ',
                'latin': 'Bismikallahhumma ahyaa wa amuut',
                'arti': 'Artinya: "Dengan nama-Mu ya Allah aku hidup dan mati."',
              }
            ],
          ),
          buildDoaCard(
            context,
            doaName: 'Doa Bangun Tidur',
            detail: [
              {
                'namadoa': 'Doa Bangun Tidur',
                'arab': 'اَلْحَمْدُ لِلهِ الَّذِيْ اَحْيَانَا أَمَاتَنَا وَإِلَيْهِ النُّشُوْرِ',
                'latin': 'Alhamdulillahilladzii ahyaanaa ba da maa amaatanaa wailaihinnusyuur',
                'arti': 'Artinya: "Segala puji bagi Allah Yang membangunkan kami setelah ditidurkan-Nya dan kepada-Nya kami dibangkitkan."',
              }
            ],
          ),
          buildDoaCard(
            context,
            doaName: 'Doa Sebelum Makan',
            detail: [
              {
                'namadoa': 'Doa Sebelum Makan',
                'arab': 'ِاَللَّهُمَّ بَارِكْ لَنَا فِيْمَا رَزَقْتَنَا وَقِنَا عَذَابَ النَّارِ',
                'latin': 'Allahumma barik lanaa fiimaa razaqtanaa waqinaa adzaabannar',
                'arti': 'Artinya: "Ya Allah, berkahilah untukku dalam sesuatu yang Engkau rezekikan kepadaku, dan peliharalah aku dari siksa neraka."',
              }
            ],
          ),
          buildDoaCard(
            context,
            doaName: 'Doa Sesudah Makan',
            detail: [
              {
                'namadoa': 'Doa Sesudah Makan',
                'arab': 'اَلْحَمْدُ ِللهِ الَّذِيْنَ اَطْعَمَنَا وَسَقَانَا وَجَعَلَنَا مِنَ الْمُسْلِمِيْنَ',
                'latin': 'Alhamdulillahil-ladzi ath-amanaa wa saqaana waja alanaa minal muslimiin',
                'arti': 'Artinya: "Segala puji bagi Allah yang telah memberi kami makan dan minum serta menjadikan kami termasuk golongan orang Muslim."',
              }
            ],
          ),
          buildDoaCard(
            context,
            doaName: 'Doa Keluar Rumah',
            detail: [
              {
                'namadoa': 'Doa Keluar Rumah',
                'arab': 'بِسْمِ الله تَوَكَّلْتُ عَلَى اللَّه لَا حَوْلَ وَلَا قُوَّةَ إِِلاَّ بِاللهِ',
                'latin': 'Bismillahi tawakkaltu ala Allah laa hawlaa wa laa quwwata illa billaah',
                'arti': 'Artinya: "Dengan menyebut nama Allah. Aku bertawakal kepada Allah, tidak ada daya serta kekuatan apapun tanpa pertolongan Allah."',
              }
            ],
          ),
          buildDoaCard(
            context,
            doaName: 'Doa Masuk Rumah',
            detail: [
              {
                'namadoa': 'Doa Masuk Rumah',
                'arab': 'ِسْمِ اللَّهِ وَلَجْنَا وَبِسْمِ اللَّهِ خَرَجْنَا وَعَلَى اللَّهِ رَبِّنَا تَوَكَّلْنَا ثُمَّ لِيُسَلِّمْ عَلَى أَهْلِهِ',
                'latin': 'Bismillahi walajnaa wa bismillah kharajnaa wa alallahi Rabbinaa tawakkalnaa tsumma liyusallim ala ahlihi',
                'arti': 'Artinya: "Dengan menyebut nama Allah kami masuk, dan dengan menyebut nama Allah kami keluar. Dan kepada Allah lah kami bertawakal. "Selanjutnya ia mengucapkan salam kepada keluarganya."',
              }
            ],
          ),
          buildDoaCard(
            context,
            doaName: 'Doa Ketika Hujan Turun',
            detail: [
              {
                'namadoa': 'Doa Ketika Hujan Turun',
                'arab': 'اَللّهُمَّ صَيِّبًا نَافِعًا',
                'latin': 'Allahumma shoyyiban naafi an.',
                'arti': 'Artinya: "Ya Allah turunkanlah pada kami hujan yang bermanfaat."',
              }
            ],
          ),
          buildDoaCard(
            context,
            doaName: 'Doa Saat Bercermin',
            detail: [
              {
                'namadoa': 'Doa Saat Bercermin',
                'arab': 'اللّهُمَّ كَمَا حَسِّنْتَ خَلْقِيْ فَحَسًّنْ خُلُقِيْ',
                'latin': 'Allahumma kamaa hassanta kholqi fahassan khuluqi',
                'arti': 'Artinya: "Ya Allah, sebagaimana Engkau telah memperindah kejadianku, maka perindah pula akhlakku."',
              }
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDoaCard(BuildContext context, {required String doaName, required List<Map<String, String>> detail}) {
    final isFavorite = favoriteDoas.contains(doaName);

    return Card(
      child: ListTile(
        title: Text(doaName),
        trailing: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : null,
          ),
          onPressed: () => toggleFavorite(doaName),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DoaDetailPage(doaName: doaName, detail: detail),
            ),
          );
        },
      ),
    );
  }
}
