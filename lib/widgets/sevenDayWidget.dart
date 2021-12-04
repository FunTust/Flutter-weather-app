import 'package:flutter/material.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Screens/settings.dart';

import '../helper/utils.dart';
import '../models/dailyWeather.dart';

class SevenDayWidget extends StatefulWidget {
  SevenDayWidget({this.wData, required this.dWeather, required this.title});

  final wData;
  final List<DailyWeather> dWeather;
  final String title;

  @override
  State<SevenDayWidget> createState() =>
      _SevenDayWidgetState(dWeather: dWeather, wData: wData);

}

class _SevenDayWidgetState extends State<SevenDayWidget> {
  _SevenDayWidgetState({required this.wData, required this.dWeather});
  final wData;
  final List<DailyWeather> dWeather;
  int selected1 = 1;
  int selected2 = 1;
  int selected3 = 0;

  @override
  void initState() {
    super.initState();
    _loadSelectors();
  }

  void _loadSelectors() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selected1 = prefs.getInt('selected1')!;
      selected2 = prefs.getInt('selected2')!;
      selected3 = prefs.getInt('selected3')!;
    });
  }

  @override

  Widget dailyWidget(dynamic weather, BuildContext context) {


    final dayOfWeek = DateFormat.MMMMd("ru").format(weather.date);
    return Card(
      margin: EdgeInsets.all(15),
      shadowColor: Colors.grey,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                !Get.isDarkMode?Color(0xCDDAF5FF):Color(0x223B70FF),
                !Get.isDarkMode?Color(0xFF9CBCFF):Color(0x0F1F40FF),
              ],
            )
        ),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FittedBox(
              child: Text(
                dayOfWeek,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 20),
              child: MapString.mapStringToIcon(
                  '${weather.condition}', context, 55),
            ),
            SizedBox(height: 20),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5, right: 15),
                child: Icon(
                  WeatherIcons.wiCelsius,
                  color: Colors.grey,
                  size: 35,
                ),
              ),
              Text(
                selected1 == 0
                    ? '${weather.dailyTemp} °C'
                    : '${weather.dailyTempF} °F',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]),
            SizedBox(height: 20),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5, right: 15),
                child: Icon(
                  WeatherIcons.wiStrongWind,
                  color: Colors.grey,
                  size: 35,
                ),
              ),
              Text(
                selected2 == 0
                    ? '${weather.windSpeed} km/h'
                    : '${(weather.windSpeed/3.6).toStringAsFixed(2)} М/с',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]),
            SizedBox(height: 20),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5, right: 15),
                child: Icon(
                  WeatherIcons.wiRaindrop,
                  color: Colors.grey,
                  size: 35,
                ),
              ),
              Text(
                '${weather.humidity} %',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]),
            SizedBox(height: 20),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5, right: 15),
                child: Icon(
                  WeatherIcons.wiBarometer,
                  color: Colors.grey,
                  size: 35,
                ),
              ),
              Text(
                selected3 == 0
                    ? '${weather.pressure} гПа'
                    : '${weather.pressure2} мм.рт.ст',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 1.65,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(15),
          child: PageView(
            children:
                dWeather.map((item) => dailyWidget(item, context)).toList(),
          ),
        ),
      ],
    );
  }
}
