import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/Screens/settings.dart';

import '../provider/weatherProvider.dart';
import '../widgets/WeatherInfo.dart';
import '../widgets/fadeIn.dart';
import '../widgets/hourlyForecast.dart';
import '../widgets/locationError.dart';
import '../widgets/mainWeather.dart';
import '../widgets/requestError.dart';
import '../widgets/searchBar.dart';
import '../widgets/weatherDetail.dart';
import '../widgets/sevenDayForecast.dart';
import 'develop.dart';
import 'favorites.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        resizeToAvoidBottomInset: false,
        body:Container(
            decoration: const BoxDecoration(
            image: DecorationImage(
            image: AssetImage("assets/gorylight.png"),
              fit: BoxFit.cover,
            ),
          ),
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: myContext.primaryColor,
                ),
              )
            : weatherData.loading
                ? Center(
                    child: CircularProgressIndicator(
                      backgroundColor: myContext.primaryColor,
                    ),
                  )
                : weatherData.isLocationError
                    ? LocationError()
                    : Column(
                        children: [
                          SearchBar(),
                          weatherData.isRequestError
                              ? RequestError()
                              : Expanded(
                                  child: PageView(
                                    controller: _pageController,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        width: mediaQuery.size.width,
                                        child: RefreshIndicator(
                                          onRefresh: () =>
                                              _refreshData(context),
                                          backgroundColor: Colors.blue,
                                          child: ListView(
                                            children: [
                                              MainWeather(wData: weatherData),
                                          ],
                                          ),
                                        ),
                                      ),
                                      // Container(
                                      //   height: mediaQuery.size.height,
                                      //   width: mediaQuery.size.width,
                                      //   child: ListView(
                                      //     children: [
                                      //         SevenDayForecast(
                                      //           wData: weatherData,
                                      //           dWeather:
                                      //               weatherData.sevenDayWeather,
                                      //         ),
                                      //
                                      //     ],
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                          SlidingUpPanel(
                              color: const Color(0xECEFF4FF),
                              minHeight: 170,
                              maxHeight: 425,
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
                                    const Padding(padding: EdgeInsets.only(top: 15)),
                                    HourlyForecast(
                                      weatherData.hourlyWeather),
                                  // WeatherInfo(
                                  //     wData: weatherData
                                  //         .currentWeather),
                                    const Padding(padding: EdgeInsets.only(top: 15)),
                                    WeatherDetail(
                                      wData: weatherData),
                              ],
                              )
                              ],
                              ),
                              borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)
                          ),
                      ),
          ],
      ),
    ),
    ),
    );
  }
}
