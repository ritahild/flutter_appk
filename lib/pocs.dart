import 'dart:io';

import 'package:dio/dio.dart';

const String accessKey = 'a060f410-fc54-4bcb-8177-282d3a4270a9';
const String baseUrl = 'https://api.web3forms.com/submit';
const String redirectUrl = 'https://web3forms.com/success';

Future<void> submitForm(String name, String email, String message) async {
  try {
    final dio = Dio();

    // Prepare form data
    final formData = FormData.fromMap({
      'access_key': accessKey,
      'name': name,
      'email': email,
      'message': message,
      'redirect': redirectUrl,
    });

    // Set content type for multipart/form-data
    dio.options.contentType = Headers.formUrlEncodedContentType;

    // Send POST request with form data
    final response = await dio.post(
      baseUrl,
      data: formData,
    );

    if (response.statusCode == HttpStatus.ok) {
      print('Form submitted successfully!');
      // Handle successful submission (e.g., navigate to success page)
    } else {
      print('Error submitting form: ${response.statusCode}');
      print(response.data); // Log error details for debugging
      // Handle submission errors (e.g., display error message to user)
    }
  } on DioError catch (e) {
    print('Error making HTTP request: ${e.message}');
    // Handle network or other errors (e.g., display error message to user)
  }
}
