import 'package:flutter/material.dart';

class DoaDetailPage extends StatelessWidget {
  final String doaName;
  final List<Map<String, String>> detail;

  DoaDetailPage({required this.doaName, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doaName),
      ),
      body: ListView.builder(
        itemCount: detail.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detail[index]['namadoa']!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  detail[index]['arab']!,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  detail[index]['latin']!,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  detail[index]['arti']!,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
