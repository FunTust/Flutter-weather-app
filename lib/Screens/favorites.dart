import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/provider/weatherProvider.dart';
import '../main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<String> Cities = [];

  void _loadCities() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      Cities = prefs.getStringList('favorite_cities')!;
      print(Cities);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCities();
  }

  void _saveSelectors() async {
    final prefs = await SharedPreferences.getInstance();
    await
    prefs.setStringList('favorite_cities', Cities.toSet().toList());
  }

  @override
  void dispose() {
    super.dispose();
    _saveSelectors();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Container(
            color: !Get.isDarkMode ? Color(0xECEFF4FF) : Color(0xFF071427),
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
                        color: !Get.isDarkMode ? Colors.black : Colors.white),
                    SizedBox(
                      width: 18,
                    ),
                    Text('Избранные',
                        style: GoogleFonts.manrope(
                            fontSize: 20,
                            color:
                                !Get.isDarkMode ? Colors.black : Colors.white,
                            fontWeight: FontWeight.w600)),
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
                              onLongPress: () {
                                showAlertDialog(context, index, Cities[index]);
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



  showAlertDialog(BuildContext context, int index, String name) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Нет"),
      onPressed:  () {Navigator.pop(context);},
    );
    Widget continueButton = TextButton(
      child: Text("Да"),
      onPressed:  () {setState(() {
        Cities.removeAt(index);
        Navigator.pop(context);
      });},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text('Вы точно хотите удалить "' + name + '" из ибранного?'),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
