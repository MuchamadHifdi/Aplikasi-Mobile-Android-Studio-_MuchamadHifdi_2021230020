import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class CommentsPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  CommentsPage({Key? key}) : super(key: key) {
    // Set the date to today's date in the format dd MM yyyy
    _dateController.text = DateFormat('dd MM yyyy').format(DateTime.now());
  }

  void _submitComment(BuildContext context) async {
    String name = _nameController.text;
    String comment = _commentController.text;
    String date = _dateController.text;

    // Send data to server
    var response = await http.post(
      Uri.parse('http://mobilecomputing.my.id/api_hifdi/submit_comment.php'),
      body: {
        'name': name,
        'comment': comment,
        'date': date,
      },
    );

    String message;
    if (response.statusCode == 200) {
      message = 'Kritik dan saran terkirim';
    } else {
      message = 'Gagal mengirim kritik dan saran!';
    }

    // Show AlertDialog instead of SnackBar
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notification'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Masukan nama'),
            ),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(labelText: 'Masukan kritik dan saran kamu'),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Date',
              ),
              readOnly: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _submitComment(context),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
