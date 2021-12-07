import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:listview_utils/listview_utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/provider/weatherProvider.dart';
import '../main.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SearchPage> createState() => _FavoritesPageState();
}

fetchData(Client client, String text) async {
  final resp = await client.get(Uri.parse(
      'http://api.geonames.org/searchJSON?name_startsWith=$text&maxRows=10&orderby=relevance&username=oksik'));
  log(resp.body.toString());
  final respFromJson = jsonDecode(resp.body);
  respFromJson['geonames'][0];
  log(respFromJson.toString());
}

class _FavoritesPageState extends State<SearchPage> {
  List<String> Cities = [];
  List<String> FCities = [];
  final _textController = TextEditingController();
  bool _validate = false;

  void _loadCities() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      Cities = prefs.getStringList('cities')!;
      FCities = prefs.getStringList('favorite_cities')!;
      print(Cities);
      print(FCities);
    });
  }

  void _saveSelectors() async {
    final prefs = await SharedPreferences.getInstance();
    await
    prefs.setStringList('favorite_cities', FCities.toSet().toList());
  }

  @override
  void dispose() {
    super.dispose();
    _saveSelectors();
  }

  @override
  void initState() {
    super.initState();
    _loadCities();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor:
            !Get.isDarkMode ? Color(0xECEFF4FF) : Color(0xFF071427),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_outlined),
                        iconSize: 20,
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                    LimitedBox(
                      maxWidth: 350,
                      child: CupertinoSearchTextField(
                        style: TextStyle(
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black),
                        controller: _textController,
                        placeholder: "Введите название города",
                        onSubmitted: (value) {
                          setState(() {
                            _textController.text.isEmpty
                                ? _validate = true
                                : Provider.of<WeatherProvider>(context,
                                        listen: false)
                                    .searchWeatherData(location: value);
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Cities.length > 0
                      ? ListView.builder(
                          itemCount: Cities.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text('${Cities[index]}'),
                              onTap: () {
                                Provider.of<WeatherProvider>(context,
                                        listen: false)
                                    .searchWeatherData(location: Cities[index]);
                                Navigator.pop(context);
                              },
                              onLongPress: (){
                                FCities.add(Cities[index]);
                                print("added");
                                print(FCities);
                              },
                            );
                          },
                        )
                      : const Center(child: Text('No cities')),
                ),
              ],
            ),
          ),
        ),
      );
}
