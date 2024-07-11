import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> registerUser(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://mobilecomputing.my.id/api_hifdi/register.php'),
    body: {
      'email': email,
      'password': password,
    },
  );

  if (response.statusCode == 200) {
    final result = jsonDecode(response.body);
    return !result['error'];
  } else {
    return false;
  }
}

Future<bool> loginUser(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://mobilecomputing.my.id/api_hifdi/login.php'),
    body: {
      'email': email,
      'password': password,
    },
  );

  if (response.statusCode == 200) {
    final result = jsonDecode(response.body);
    return !result['error'];
  } else {
    return false;
  }
}
