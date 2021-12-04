import 'package:flutter_nord_theme/flutter_nord_theme.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:untitled/models/dailyWeather.dart';
import 'package:untitled/provider/weatherProvider.dart';
import 'package:untitled/widgets/sevenDayWidget.dart';

class DailyWeatherPage extends StatefulWidget {
  DailyWeatherPage({Key? key, required this.title}) : super(key: key);
  final String title;
  var weatherData;

  @override
  State<DailyWeatherPage> createState() => _DailyWeatherPageState();
}

class _DailyWeatherPageState extends State<DailyWeatherPage> {


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: !Get.isDarkMode ? Color(0xECEFF4FF) : Color(0xFF071427),
          child: Column(
            children: [
              SizedBox(height: 30),
                  Text('Прогноз на неделю',
                      style: GoogleFonts.didactGothic(
                          fontSize: 30, fontWeight: FontWeight.w600)),
              SizedBox(height: 20),
              SevenDayWidget(
                      wData: weatherData,
                      dWeather: weatherData.sevenDayWeather,
                      title: 'title',
                    ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  primary: Colors.green.withOpacity(0),
                  side: BorderSide(
                    color: !Get.isDarkMode ? Color(0xFF071427) : Color(0xECEFF4FF,),
                    width: 2.0,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Вернуться на главную'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
