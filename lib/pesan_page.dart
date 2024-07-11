import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PesanPage extends StatefulWidget {
  @override
  _PesanPageState createState() => _PesanPageState();
}

class _PesanPageState extends State<PesanPage> {
  List<dynamic> data = [];
  String dataType = 'users';

  @override
  void initState() {
    super.initState();
    fetchData(dataType);
  }

  Future<void> fetchData(String type) async {
    final String url;
    if (type == 'users') {
      url = 'http://mobilecomputing.my.id/api_hifdi/users.php';
    } else if (type == 'comments') {
      url = 'http://mobilecomputing.my.id/api_hifdi/submit_comment.php';
    } else {
      url = 'http://mobilecomputing.my.id/api_hifdi/social_accounts.php';
    }

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  void _onMenuSelected(String type) {
    setState(() {
      dataType = type;
    });
    fetchData(type);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () => _onMenuSelected('users'),
          ),
          IconButton(
            icon: Icon(Icons.comment),
            onPressed: () => _onMenuSelected('comments'),
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () => _onMenuSelected('social_accounts'),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => _onMenuSelected('users'),
                  child: Text('Akun Users'),
                ),
                ElevatedButton(
                  onPressed: () => _onMenuSelected('comments'),
                  child: Text('Comment Users'),
                ),
                ElevatedButton(
                  onPressed: () => _onMenuSelected('social_accounts'),
                  child: Text('Akun Sosial Media'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                if (dataType == 'users') {
                  return ListTile(
                    title: Text(data[index]['email']),
                    subtitle: Text(data[index]['password']),
                  );
                } else if (dataType == 'comments') {
                  return ListTile(
                    title: Text(data[index]['name']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data[index]['comment']),
                        Text(data[index]['date']),
                      ],
                    ),
                  );
                } else if (dataType == 'social_accounts') {
                  return ListTile(
                    title: Text(data[index]['platform']),
                    subtitle: Text(data[index]['username']),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
