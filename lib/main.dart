import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_nord_theme/flutter_nord_theme.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import './Screens/hourlyWeatherScreen.dart';
import './provider/weatherProvider.dart';
import './Screens/weeklyWeatherScreen.dart';
import './Screens/homeScreen.dart';

void main() async {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super( key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: GetMaterialApp(
        themeMode: ThemeMode.light,
        theme: NordTheme.light(),
        darkTheme: NordTheme.dark(),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        routes: {
          WeeklyScreen.routeName: (myCtx) => WeeklyScreen(),
          HourlyScreen.routeName: (myCtx) => HourlyScreen(),
        },
      ),
    );
  }
}
