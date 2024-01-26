import 'dart:convert';
import 'package:http/http.dart' as http;

class PreRegisterRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String? university;
  final String? comments;

  PreRegisterRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.university,
    this.comments,
  });
}

class PreRegister {
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  PreRegister();

  Future<bool> post(PreRegisterRequest user) async {
    try {
      // Create Body by Request
      final String bodyRequestSignIn = jsonEncode(
        {
          "first_name": user.firstName,
          "last_name": user.lastName,
          "email": user.email,
          "organization": user.university,
          "comments": user.comments,
        },
      );

      // Make the Request
      final http.Response response = await http.post(
        Uri.parse('https://unicon-api-roni.onrender.com/v1/users/pre-register'),
        headers: headers,
        body: bodyRequestSignIn,
      );

      // Proccess if THe Request is Successfull
      if (response.statusCode == 201) {
        // Get Data
        return Future(() => true);
      }
    } on Exception {
      return Future(() => false);
    }

    return Future(() => false);
  }
}
