import 'package:flutter/material.dart';
import "package:english_words/english_words.dart";

void main() {
  runApp(const MaterialApp(
    title: '',
    home: WeatherApp()
  ));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);
  static const appTitle = 'Flutter App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: const MyHomePage(title: appTitle),
      theme: ThemeData(
        // primarySwatch: Colors.white,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          // leading: const IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Navigation menu',
          //   onPressed: null,
          // ),
          title: Text(title),
          centerTitle: true,
          actions: const <Widget>[
            IconButton(onPressed: null, icon: Icon(Icons.hdr_on)),//add_circle_outline
          ],
        ),
        body: Center(
          child: Text('Hello World\n\n\n\n\n' + wordPair.asPascalCase),
        ),
        drawer: Drawer(
            child: ListView(
              children: const <Widget> [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Text(
                    'My Drawer',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Gallery'),
                ),
                ListTile(
                  title: Text('Slideshow'),
                ),
              ],
            )
        ),
      );
  }
}
