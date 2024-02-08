import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

class LoginService {
  String baseUrl = 'https://apiv2stg.promilo.com/user/oauth/token';

  String grantType = 'password';

  Future login(String email, String password) async {
    print('heloo');
    String hashedPassword = _sha256Password(password);
    Map<String, String> payload = {
      'username': email,
      'password': hashedPassword,
      'grant_type': grantType,
    };
    String authHeader = 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==';
    try {
      var response = await http.post(
        Uri.parse(baseUrl),
        headers: <String, String>{
          'Authorization': authHeader,
        },
        body: payload,
      );
      if (response.statusCode == 200) {
        print('hiii');
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to login: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  static String _sha256Password(String password) {
    List<int> bytes = utf8.encode(password);

    Digest sha256Result = sha256.convert(bytes);

    return sha256Result.toString();
  }
}
