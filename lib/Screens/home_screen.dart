import 'package:flutter/material.dart';
import 'package:flutter_nord_theme/flutter_nord_theme.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:untitled/Screens/daily_weather_screen.dart';
import '../Screens/settings.dart';
import '../widgets/bar.dart';
import '../provider/weatherProvider.dart';
import '../widgets/hourlyForecast.dart';
import '../widgets/mainWeather.dart';
import '../widgets/requestError.dart';
import '../widgets/weatherDetail.dart';
import 'develop.dart';
import 'favorites.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  PanelController _panelController = PanelController();
  late bool _isLoading;
  late bool _isDark;

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

  Future<void> _updateData() async {
    _isLoading = true;
    final weatherData = Provider.of<WeatherProvider>(context, listen: false);
    weatherData.searchWeatherData(location: weatherData.weather.cityName);
    _isLoading = false;
  }

  Future<void> _getData() async {
    _isLoading = true;
    _isDark = true;
    final prefs = await SharedPreferences.getInstance();
    _isDark = Get.isDarkMode;
    Get.changeTheme(
        prefs.getInt('selected4') == 0 ? NordTheme.dark() : NordTheme.light());
    final weatherData = Provider.of<WeatherProvider>(context, listen: false);
    weatherData.getWeatherData();
    // await Future.delayed(Duration(seconds: 1, microseconds: 10));
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
        backgroundColor:
            !_isDark ? Color(0xECEFF4FF) : Color(0xFF071427),
        drawer: weatherDrawer(),
        resizeToAvoidBottomInset: false,
        body: _isLoading
            ? Center(
                child: Column(children: [
                const Padding(padding: EdgeInsets.only(top: 100)),
                Text(
                  "Weather",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 56.0,
                    color: !Get.isDarkMode ? Colors.black : Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 150)),
                CircularProgressIndicator(
                  color: !Get.isDarkMode ? Colors.black : Colors.white,
                  strokeWidth: 18,
                ),
              ]))
            : weatherData.loading
                ? Container(
                    decoration: BoxDecoration(
                      color: !_isDark ? Color(0xECEFF4FF) : Color(0xFF071427),
                      image: DecorationImage(
                        image: Get.isDarkMode
                            ? AssetImage("assets/night.png")
                            : AssetImage("assets/day.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: !_isDark ? Color(0xECEFF4FF) : Color(0xFF071427),
                      ),
                    ))
                : Container(
                    decoration: BoxDecoration(
                      color: !_isDark ? Color(0xECEFF4FF) : Color(0xFF071427),
                      image: DecorationImage(
                        image: Get.isDarkMode
                            ? AssetImage("assets/night.png")
                            : AssetImage("assets/day.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        Bar(),
                        weatherData.isRequestError
                            ? Expanded(
                                child: PageView(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    width: mediaQuery.size.width,
                                    child: RefreshIndicator(
                                      onRefresh: () async {
                                        _refreshData(context);
                                      },
                                      child: ListView(
                                        children: [
                                          RequestError(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                            : Expanded(
                                child: PageView(
                                  controller: _pageController,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: mediaQuery.size.width,
                                      child: RefreshIndicator(
                                        onRefresh: () async {
                                          _updateData();
                                        },
                                        child: ListView(
                                          children: [
                                            MainWeather(wData: weatherData),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        weatherData.isRequestError
                            ? Container()
                            : SlidingUpPanel(
                                controller: _panelController,
                                color: !Get.isDarkMode
                                    ? Color(0xECEFF4FF)
                                    : Color(0xFF071427),
                                minHeight: 245,
                                panel: Column(
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(top: 15)),
                                    Container(
                                      height: 5,
                                      width: 60,
                                      decoration: const BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(30))),
                                    ),
                                    Column(
                                      children: [
                                        const Padding(
                                            padding: EdgeInsets.only(top: 15)),
                                        HourlyForecast(
                                            weatherData.hourlyWeather),
                                        const Padding(
                                            padding: EdgeInsets.only(top: 65)),
                                        WeatherDetail(
                                          wData: weatherData,
                                          title: 'title',
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
                                collapsed: Column(
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(top: 185)),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        textStyle:
                                            const TextStyle(fontSize: 20),
                                        primary: Colors.green.withOpacity(0),
                                        side: BorderSide(
                                          color: !Get.isDarkMode
                                              ? Color(0xFF071427)
                                              : Color(
                                                  0xECEFF4FF,
                                                ),
                                          width: 2.0,
                                        ),
                                      ),
                                      onPressed: () {
                                        if (!_panelController.isPanelOpen)
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      DailyWeatherPage(
                                                        title: 'title',
                                                      )));
                                      },
                                      child: const Text('Прогноз на неделю'),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
      ),
    );
  }

  weatherDrawer() {
    return _isLoading
        ? Container()
        : Container(
            width: 223,
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor:
                    !Get.isDarkMode ? Color(0xECEFF4FF) : Color(0xFF071427),
              ),
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
          );
  }
}
