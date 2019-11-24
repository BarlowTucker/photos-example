import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Unsplash>> fetchPost() async {
  final response = await http.get('https://api.unsplash.com/photos/', headers: {
    'Authorization': 'Client-ID [YOUR UNSPLASH TOKEN HERE]',
  });

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    print(response.body);
    Iterable list = json.decode(response.body);
    return list.map<Unsplash>((i) => Unsplash.fromJson(i)).toList();
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Unsplash {
  final String id;
  final String small;

  Unsplash({this.id, this.small});

  static fromJson(Map<String, dynamic> data) {
    Map<String, dynamic> urls = data['urls'];
    return Unsplash(id: data['id'], small: urls["small"]);
  }
}
