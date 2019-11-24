import 'package:flutter/material.dart';
import './unsplash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Center(child: PhotoList()),
        ));
  }
}

class PhotoList extends StatefulWidget {
  @override
  _PhotoListState createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  var photos = new List<Unsplash>();

  _getPhotos() {
    fetchPost().then((response) {
      setState(() {
        photos = response;
      });
    });
  }

  initState() {
    super.initState();
    _getPhotos();
  }

  dispose() {
    super.dispose();
  }

  Widget _buildRow(String url) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Image.network(url, fit: BoxFit.cover),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: photos.length,
        itemBuilder: (context, i) {
          return _buildRow(photos[i].small);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildSuggestions());
  }
}
