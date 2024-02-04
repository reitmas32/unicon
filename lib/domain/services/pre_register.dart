import 'dart:convert';
import 'package:http/http.dart' as http;

/// Request model for pre-registering to the conference
class PreRegisterRequest {
  /// Constructor
  PreRegisterRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.university,
    this.comments,
  });

  /// First name of attendee
  final String firstName;

  /// Last name of attendee
  final String lastName;

  /// Email address of attendee
  final String email;

  /// University name (optional)
  final String? university;

  /// Additional comments (optional)
  final String? comments;
}

/// Service for pre-registering to the conference
class PreRegister {
  /// Constructor
  PreRegister();

  /// Default headers for requests
  static final Map<String, String> headers = <String, String>{
    'Content-Type': 'application/json',
  };

  /// Sends a POST request to pre-register the user
  ///
  /// Returns true if the request succeeded, false otherwise
  Future<bool> post(PreRegisterRequest user) async {
    try {
      // Create Body by Request
      final String bodyRequestSignIn = jsonEncode(
        <String, String?>{
          'first_name': user.firstName,
          'last_name': user.lastName,
          'email': user.email,
          'organization': user.university,
          'comments': user.comments,
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
        return Future<bool>(() => true);
      }
    } on Exception {
      return Future<bool>(() => false);
    }

    return Future<bool>(() => false);
  }
}
