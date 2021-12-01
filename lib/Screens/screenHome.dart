import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nord_theme/flutter_nord_theme.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/provider/weatherProvider.dart';
import 'develop.dart';
import 'favorites.dart';
import 'forecast.dart';
import 'settings.dart';
import 'search.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weather_icons/weather_icons.dart';

class ScreenHome extends StatefulWidget {
  static const routeName = '/screenHome';

  @override
  _ScreenHomeState createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  var ruDatesFuture = initializeDateFormatting('ru', null);
  String key = 'ea87ba38053e9919cb14cfe5623d236d';
  String cityName = 'Saint Petersburg';
  double _temperature = 12;
  bool _done = false;
  String formattedDate = DateFormat.yMMMMd('ru').format(DateTime.now());

  PageController _pageController = PageController();
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Future<void> _getData() async {
    _isLoading = true;
    final weatherData = Provider.of<WeatherProvider>(context, listen: false);
    weatherData.getWeatherData();
    _isLoading = false;
  }

  Future<void> _refreshData(BuildContext context) async {
    await Provider.of<WeatherProvider>(context, listen: false).getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherProvider>(context);
    final myContext = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        drawer: Container(
          width: 223,
          child: Drawer(
            child: ListView(
              children: [
                ListTile(
                  title: Row(
                    children: [
                      Text('Weather app',
                          style: GoogleFonts.dancingScript(
                              fontSize: 35, fontWeight: FontWeight.w800)),
                    ],
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      const Icon(Icons.settings),
                      const SizedBox(
                        width: 18,
                      ),
                      Text('Настройки',
                          style: GoogleFonts.didactGothic(fontSize: 23)),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => SettingsPage(title: 'title')));
                  },
                ),
                ListTile(
                  title: Row(children: [
                    const Icon(Icons.favorite_border),
                    const SizedBox(
                      width: 18,
                    ),
                    Text('Избранное',
                        style: GoogleFonts.didactGothic(fontSize: 23)),
                  ]),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => FavoritesPage(title: 'title')));
                  },
                ),
                ListTile(
                  title: Row(
                    children: [
                      const Icon(Icons.account_circle_outlined),
                      const SizedBox(
                        width: 18,
                      ),
                      Text('О приложении',
                          style: GoogleFonts.didactGothic(fontSize: 23)),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => DeveloperPage(title: 'title')));
                  },
                ),
              ],
            ),
          ),
        ),
        body: Builder(builder: (context) {
          return SlidingUpPanel(
            color: const Color(0xECEFF4FF),
            minHeight: 170,
            maxHeight: 350,
            panel: Column(children: [
              const Padding(padding: EdgeInsets.only(top: 15)),
              Container(
                height: 5,
                width: 60,
                decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(
                            depth: 3,
                            lightSource: LightSource.top,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 6,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '06:00',
                                  style: GoogleFonts.manrope(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: Icon(Icons.wb_sunny),
                                ),
                                Text(
                                  '10°c',
                                  style: GoogleFonts.manrope(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Neumorphic(
                          style: NeumorphicStyle(
                            depth: 3,
                            lightSource: LightSource.top,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 6,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '06:00',
                                  style: GoogleFonts.manrope(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: Icon(Icons.wb_sunny),
                                ),
                                Text(
                                  '10°c',
                                  style: GoogleFonts.manrope(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Neumorphic(
                          style: NeumorphicStyle(
                            depth: 3,
                            lightSource: LightSource.top,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 6,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '06:00',
                                  style: GoogleFonts.manrope(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: Icon(Icons.wb_sunny),
                                ),
                                Text(
                                  '10°c',
                                  style: GoogleFonts.manrope(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Neumorphic(
                          style: NeumorphicStyle(
                            depth: 3,
                            lightSource: LightSource.top,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 6,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  '06:00',
                                  style: GoogleFonts.manrope(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: Icon(Icons.wb_sunny),
                                ),
                                Text(
                                  '10°c',
                                  style: GoogleFonts.manrope(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(
                            depth: 3,
                            lightSource: LightSource.top,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 40,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '06:00',
                                  style: GoogleFonts.manrope(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: Icon(
                                    WeatherIcons.thermometer,
                                    size: 26,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Neumorphic(
                          style: NeumorphicStyle(
                            depth: 3,
                            lightSource: LightSource.top,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 40,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '06:00',
                                  style: GoogleFonts.manrope(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: Icon(
                                    WeatherIcons.humidity,
                                    size: 26,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Neumorphic(
                          style: NeumorphicStyle(
                            depth: 3,
                            lightSource: LightSource.top,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 40,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '06:00',
                                  style: GoogleFonts.manrope(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: Icon(
                                    WeatherIcons.strong_wind,
                                    size: 26,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Neumorphic(
                          style: NeumorphicStyle(
                            depth: 3,
                            lightSource: LightSource.top,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 40,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  '06:00',
                                  style: GoogleFonts.manrope(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: Icon(
                                    WeatherIcons.barometer,
                                    size: 26,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/gorylight.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(children: [
                  const Padding(padding: EdgeInsets.only(top: 0)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: const Icon(Icons.menu),
                            iconSize: 40),
                        Text("Санкт-Петербург",
                            style: GoogleFonts.manrope(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => SearchPage(title: 'title')));
                          },
                          icon: const Icon(Icons.add_circle_outline),
                          iconSize: 40,
                        ),
                      ]),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        formattedDate,
                        style: GoogleFonts.manrope(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ])),
          );
        }),
      ),
    );
  }
}
