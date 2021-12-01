
import '../main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  static int selected1 = 0;
  static int selected2 = 0;
  static int selected3 = 0;
  static int selected4 = 0;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Container(
          child: Column(children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new),
                    iconSize: 28),
                SizedBox(
                  width: 18,
                ),
                Text('Настройки',
                    style: GoogleFonts.didactGothic(
                        fontSize: 30,
                        fontWeight: FontWeight.w600))
              ],
            ),
            Row(
              children: [
                const Padding(padding: EdgeInsets.only(top: 42, left: 20)),
                Text('Единицы измерения',
                    style: GoogleFonts.manrope(
                        fontSize: 15,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            Container(
              width: 360,
              child: Neumorphic(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 13, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Температура',
                                style: GoogleFonts.manrope(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),

                              ),
                              SizedBox(
                                width: 110,
                                height: 27,
                                child: NeumorphicToggle(
                                  onChanged: (val){
                                    setState(() {
                                      SettingsPage.selected1 = val;
                                    });
                                  },
                                  selectedIndex: SettingsPage.selected1,
                                  thumb: Container(
                                  ),
                                  children: [
                                    ToggleElement(
                                      background: Center(
                                        child: Text(
                                          '°C',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      foreground: Center(
                                        child: Text(
                                          '°С',
                                          style: TextStyle(
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
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      foreground: Center(
                                        child: Text(
                                          '°F',
                                          style: TextStyle(
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
                          padding: const EdgeInsets.only(top: 13, left: 20, right: 20),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Сила ветра',
                                style: GoogleFonts.manrope(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),

                              ),
                              Container(
                                width: 110,
                                height: 27,
                                child: NeumorphicToggle(
                                  onChanged: (val){
                                    setState(() {
                                      SettingsPage.selected2 = val;
                                    });
                                  },
                                  selectedIndex: SettingsPage.selected2,
                                  thumb: Container(
                                  ),
                                  children: [
                                    ToggleElement(
                                      background: Center(
                                        child: Text(
                                          'м/с',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      foreground: Center(
                                        child: Text(
                                          'м/с',
                                          style: TextStyle(
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
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      foreground: Center(
                                        child: Text(
                                          'км/ч',
                                          style: TextStyle(
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
                          padding: const EdgeInsets.only(top: 13, left: 20, right: 20),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Давление',
                                style: GoogleFonts.manrope(
                                    color: Color(0xFF333333),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),

                              ),
                              Container(
                                width: 170,
                                height: 27,
                                child: NeumorphicToggle(
                                  onChanged: (val){
                                    setState(() {
                                      SettingsPage.selected3 = val;
                                    });
                                  },
                                  selectedIndex: SettingsPage.selected3,
                                  thumb: Container(
                                  ),
                                  children: [
                                    ToggleElement(
                                      background: const Center(
                                        child: Text(
                                          'мм.рт.ст',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      foreground: const Center(
                                        child: Text(
                                          'мм.рт.ст',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ToggleElement(
                                      background: const Center(
                                        child: Text(
                                          'гПа',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      foreground: Center(
                                        child: Text(
                                          'гПа',
                                          style: TextStyle(
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
                          padding: const EdgeInsets.only(top: 13, left: 20, right: 20),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13, left: 20, right: 20, bottom: 13),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Тема',
                                style: GoogleFonts.manrope(
                                    color: Color(0xFF333333),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600),

                              ),
                              Container(
                                width: 170,
                                height: 27,
                                child: NeumorphicToggle(
                                  onChanged: (val){
                                    setState(() {
                                      SettingsPage.selected4 = val;
                                    });
                                  },
                                  selectedIndex: SettingsPage.selected4,
                                  thumb: Container(
                                  ),
                                  children: [
                                    ToggleElement(
                                      background: const Center(
                                        child: Text(
                                          'Темная',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      foreground: const Center(
                                        child: Text(
                                          'Темная',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ToggleElement(
                                      background: const Center(
                                        child: Text(
                                          'Светлая',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      foreground: Center(
                                        child: Text(
                                          'Светлая',
                                          style: TextStyle(
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
                style: NeumorphicStyle(
                  depth: 3,
                  lightSource: LightSource.top,
                  boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.all(Radius.circular(30))),
                ),
              ),
            ),
          ])),
    ),
  );
}