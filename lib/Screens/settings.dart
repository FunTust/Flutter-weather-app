import 'package:flutter_nord_theme/flutter_nord_theme.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Screens/home_screen.dart';

import '../main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int selected1 = 0;
  int selected2 = 0;
  int selected3 = 0;
  int selected4 = Get.isDarkMode ? 1 : 0;

  void _loadSelectors() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selected1 = prefs.getInt('selected1')!;
      selected2 = prefs.getInt('selected2')!;
      selected3 = prefs.getInt('selected3')!;
    });
  }

  void _saveSelectors() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('selected1', selected1);
    await prefs.setInt('selected2', selected2);
    await prefs.setInt('selected3', selected3);
    await prefs.setInt('selected4', selected4);
    Get.offAll(()=>HomeScreen());
  }

  @override
  void initState() {
    super.initState();
    _loadSelectors();
    selected4 = Get.isDarkMode ? 0 : 1;
  }

  @override
  void dispose() {
    super.dispose();
    _saveSelectors();
    // Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Container(
            color: !Get.isDarkMode ? Color(0xECEFF4FF) : Color(0xFF071427),
              child: Column(children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {Navigator.pop(context);},
                    icon: Icon(Icons.arrow_back_ios_new),
                    iconSize: 28),
                SizedBox(
                  width: 18,
                ),
                Text('Настройки',
                    style: GoogleFonts.didactGothic(
                        fontSize: 30, fontWeight: FontWeight.w600))
              ],
            ),
            Row(
              children: [
                const Padding(padding: EdgeInsets.only(top: 42, left: 20)),
                Text('Единицы измерения',
                    style: GoogleFonts.manrope(
                        fontSize: 15, fontWeight: FontWeight.w600)),
              ],
            ),
            Container(
              width: 360,
              child: Neumorphic(
                style: NeumorphicStyle(
                  color: !Get.isDarkMode ? Color(0xECEFF4FF) : Color(0xFF071427),
                  depth: 3,
                  lightSource: LightSource.top,
                  boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.all(Radius.circular(30))),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 13, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Температура',
                                style: GoogleFonts.manrope(
                                    color: !Get.isDarkMode ? Colors.black : Colors.white,
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 110,
                                height: 27,
                                child: NeumorphicToggle(
                                  onChanged: (val) {
                                    setState(() {
                                      selected1 = val;
                                    });
                                  },
                                  selectedIndex: selected1,
                                  thumb: Container(),
                                  children: [
                                    ToggleElement(
                                      background: Center(
                                        child: Text(
                                          '°C',
                                          style: TextStyle(
                                            color: !Get.isDarkMode ? Colors.black : Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      foreground: Center(
                                        child: Text(
                                          '°С',
                                          style: TextStyle(
                                            color: Get.isDarkMode ? Colors.black : Colors.black54,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ToggleElement(
                                      background: Center(
                                        child: Text(
                                          '°F',
                                          style: TextStyle(
                                            color: !Get.isDarkMode ? Colors.black : Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      foreground: Center(
                                        child: Text(
                                          '°F',
                                          style: TextStyle(
                                            color: Get.isDarkMode ? Colors.black : Colors.black54,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  style: NeumorphicToggleStyle(
                                    backgroundColor: !Get.isDarkMode ? Color(0xECEFF4FF) : Color(0xFF071427),
                                    lightSource: LightSource.bottom,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 13, left: 20, right: 20),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 13, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Сила ветра',
                                style: GoogleFonts.manrope(
                                    color: !Get.isDarkMode ? Colors.black : Colors.white,
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Container(
                                width: 110,
                                height: 27,
                                child: NeumorphicToggle(
                                  onChanged: (val) {
                                    setState(() {
                                      selected2 = val;
                                    });
                                  },
                                  selectedIndex: selected2,
                                  thumb: Container(),
                                  children: [
                                    ToggleElement(
                                      background: Center(
                                        child: Text(
                                          'М/с',
                                          style: TextStyle(
                                            color: !Get.isDarkMode ? Colors.black : Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      foreground: Center(
                                        child: Text(
                                          'М/с',
                                          style: TextStyle(
                                            color: Get.isDarkMode ? Colors.black : Colors.black54,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ToggleElement(
                                      background: Center(
                                        child: Text(
                                          'км/ч',
                                          style: TextStyle(
                                            color: !Get.isDarkMode ? Colors.black : Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      foreground: Center(
                                        child: Text(
                                          'км/ч',
                                          style: TextStyle(
                                            color: Get.isDarkMode ? Colors.black : Colors.black54,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  style: NeumorphicToggleStyle(
                                    backgroundColor: Colors.transparent,
                                    lightSource: LightSource.bottom,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 13, left: 20, right: 20),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 13, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Давление',
                                style: GoogleFonts.manrope(
                                    color: !Get.isDarkMode ? Colors.black : Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              Container(
                                width: 170,
                                height: 27,
                                child: NeumorphicToggle(
                                  onChanged: (val) {
                                    setState(() {
                                      selected3 = val;
                                    });
                                  },
                                  selectedIndex: selected3,
                                  thumb: Container(),
                                  children: [
                                    ToggleElement(
                                      background: Center(
                                        child: Text(
                                          'мм.рт.ст',
                                          style: TextStyle(
                                            color: !Get.isDarkMode ? Colors.black : Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      foreground: Center(
                                        child: Text(
                                          'мм.рт.ст',
                                          style: TextStyle(
                                            color: Get.isDarkMode ? Colors.black : Colors.black54,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ToggleElement(
                                      background: Center(
                                        child: Text(
                                          'гПа',
                                          style: TextStyle(
                                            color: !Get.isDarkMode ? Colors.black : Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      foreground: Center(
                                        child: Text(
                                          'гПа',
                                          style: TextStyle(
                                            color: Get.isDarkMode ? Colors.black : Colors.black54,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  style: NeumorphicToggleStyle(
                                    backgroundColor: Colors.transparent,
                                    lightSource: LightSource.bottom,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 13, left: 20, right: 20),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 13, left: 20, right: 20, bottom: 13),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Тема',
                                style: GoogleFonts.manrope(
                                    color: !Get.isDarkMode ? Colors.black : Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),
                              ),
                              Container(
                                width: 170,
                                height: 27,
                                child: NeumorphicToggle(
                                  onChanged: (val) {
                                    setState(() {
                                      Get.changeTheme(val == 0
                                          ? NordTheme.dark()
                                          : NordTheme.light());
                                      print(val);
                                      selected4 = val;
                                    });
                                  },
                                  selectedIndex: selected4,
                                  thumb: Container(),
                                  children: [
                                    ToggleElement(
                                      background: Center(
                                        child: Text(
                                          'Темная',
                                          style: TextStyle(
                                            color: !Get.isDarkMode ? Colors.black : Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      foreground: Center(
                                        child: Text(
                                          'Темная',
                                          style: TextStyle(
                                            color: Get.isDarkMode ? Colors.black : Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ToggleElement(
                                      background: Center(
                                        child: Text(
                                          'Светлая',
                                          style: TextStyle(
                                            color: !Get.isDarkMode ? Colors.black : Colors.white,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      foreground: Center(
                                        child: Text(
                                          'Светлая',
                                          style: TextStyle(
                                            color: Get.isDarkMode ? Colors.black : Colors.black54,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  style: NeumorphicToggleStyle(
                                    backgroundColor: Colors.transparent,
                                    lightSource: LightSource.bottom,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ])),
        ),
      );
}
