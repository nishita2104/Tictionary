import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
// import 'tictionary/';

class Amadeus {
  String? token;
  Future<String?> generateAccessToken() async {
    print('in function');
    // fetch client id and client secret key from .env file
    String clientId = dotenv.env['client_id'] as String;
    String clientSecret = dotenv.env['client_secret'] as String;
    // Amadeus authorization endpoint
    print('here');
    Uri authorizationUri =
        Uri.parse("https://test.api.amadeus.com/v1/security/oauth2/token");
    Response response;
    print(clientSecret);
    print(clientId);
    // send authorization request
    try {
      response = await post(authorizationUri,
          headers: {"Content-type": "application/x-www-form-urlencoded"},
          body:
              "grant_type=client_credentials&client_id=$clientId&client_secret=$clientSecret");
    } catch (e) {
      print("error generating token --> $e");
      return "Unable to generate access token due to error $e";
    }
    Map data = jsonDecode(response.body);

    print(data);
    // get token from response
    token = data['access_token'];
    print(token);
    return token;
  }

  Future<Map> getHotelOffers(String link) async {
// check if there is an existing token before assigning the value to the variable.
    String? accessToken =
        token == null ? await generateAccessToken() : token.toString();
    Uri uri = Uri.parse(link);
    Response response;
    // send authorization request
    // try {
    response =
        await get(uri, headers: {"Authorization": "Bearer $accessToken"});
    // } catch (e) {
    //   print("error $e occurred");
    //   return ;
    // }
    Map data = jsonDecode(response.body);
    print("data is here");
    print(data);
    print('sent');
    print(data["data"][0]["name"]);
    return data;
  }

  // Map sendData() {
  //   print('sent');
  //   return data;
  // }
}