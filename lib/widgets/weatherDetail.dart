import 'package:flutter/material.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Screens/homeScreen.dart';

class WeatherDetail extends StatefulWidget {
  final wData;
  var title;
  WeatherDetail({this.wData, required this.title});

  @override
  State<WeatherDetail> createState() => _WeatherDetailState(wData: wData);

}

class _WeatherDetailState extends State<WeatherDetail> {
  _WeatherDetailState({required this.wData});
  final wData;
  int selected1 = 0;
  int selected2 = 0;
  int selected3 = 0;

  void _loadSelectors() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selected1 = prefs.getInt('selected1')!;
      selected2 = prefs.getInt('selected2')!;
      selected3 = prefs.getInt('selected3')!;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadSelectors();
  }

  @override
  void dispose() {
    super.dispose();
  }


  Widget _gridWeatherBuilder(String header, String body, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: !Get.isDarkMode ? Color(0xECEFF4FF) : Color(0xFF071427),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(6, 8),
          ),
        ],
      ),
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15, right: 5),
            child: Icon(
              icon,
              color: Colors.blue,
              size: 30,
            ),
          ),
          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  header,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: !Get.isDarkMode ? Colors.black : Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  body,
                  style: TextStyle(fontWeight: FontWeight.w400, color: !Get.isDarkMode ? Colors.black : Colors.white, fontSize: 15),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(15),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 2 / 1,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            children: [
              _gridWeatherBuilder(
                  selected1 == 0
                      ? '${wData.weather.temp} °C'
                      : '${wData.weather.tempF.toStringAsFixed(1)} °F',
                  'Feels Like',
                  WeatherIcons.wiCelsius),
              _gridWeatherBuilder('${wData.weather.humidity}%', 'Humidity',
                  WeatherIcons.wiRaindrop),
              _gridWeatherBuilder(selected2 != 0
                  ? '${wData.weather.windSpeed} km/h'
                  : '${(wData.weather.windSpeed/3.6).toStringAsFixed(2)} М/с', 'Wind',
                  WeatherIcons.wiStrongWind),
              _gridWeatherBuilder(selected3 == 1
                  ? '${wData.weather.pressure} гПа'
                  : '${(wData.weather.pressure*0.750062).toStringAsFixed(0)} мм.рт.ст', 'Pressure',
                  WeatherIcons.wiBarometer),
            ],
          ),
    );
  }
}
