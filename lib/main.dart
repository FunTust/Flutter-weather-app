import 'package:flutter/material.dart';
import 'package:flutter_nord_theme/flutter_nord_theme.dart';
import 'package:provider/provider.dart';

import './Screens/hourlyWeatherScreen.dart';
import './provider/weatherProvider.dart';
import './Screens/weeklyWeatherScreen.dart';
import './Screens/homeScreen.dart';
import './Screens/screenHome.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        theme: NordTheme.light(),
        debugShowCheckedModeBanner: false,
        // home: ScreenHome(),
        home: HomeScreen(),
        routes: {
          WeeklyScreen.routeName: (myCtx) => WeeklyScreen(),
          HourlyScreen.routeName: (myCtx) => HourlyScreen(),
        },
      ),
    );
  }
}
