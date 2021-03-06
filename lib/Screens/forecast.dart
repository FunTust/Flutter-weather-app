import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../main.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({Key? key}) : super(key: key);

  @override
  State<ForecastPage> createState() => _ForecastPage();
}

class _ForecastPage extends State<ForecastPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 34),
                    child: Column(
                      children: [
                        Text(
                          'Прогноз на неделю',
                          style: GoogleFonts.manrope(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: Container(
                      height: 387,
                      width: 320,
                      child: Swiper(
                          itemHeight: 387,
                          itemWidth: 320,
                          itemCount: 7,
                          layout: SwiperLayout.STACK,
                          loop: false,
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(colors: [
                                  Color(0xFFCDDAF5),
                                  Color(0xFF9CBCFF),
                                ]),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        "23 сентября",
                                        style: GoogleFonts.manrope(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    ListTile(
                                      contentPadding:
                                          EdgeInsets.only(left: 10, top: 5),
                                      leading: SizedBox(
                                        height: 66,
                                        width: 66,
                                        child: Image.asset(
                                            "assets/partlycloudy.png"),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.thermostat_rounded),
                                      title: Align(
                                        child: Text(
                                          "8°c",
                                          style: GoogleFonts.manrope(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        alignment: Alignment(-1.2, 0),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.water_outlined),
                                      title: Align(
                                        child: Text(
                                          "9 м/с",
                                          style: GoogleFonts.manrope(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        alignment: Alignment(-1.22, 0),
                                      ),
                                    ),
                                    ListTile(
                                      leading:
                                          Icon(Icons.invert_colors_on_rounded),
                                      title: Align(
                                        child: Text(
                                          "87%",
                                          style: GoogleFonts.manrope(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        alignment: Alignment(-1.2, 0),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.explore_outlined),
                                      title: Align(
                                        child: Text(
                                          "761 мм.рт.ст.",
                                          style: GoogleFonts.manrope(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        alignment: Alignment(-1.26, 0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        side: BorderSide(color: Color(0xFF000000), width: 1),
                      ),
                      child: Text(
                        "Вернуться на главную",
                        style: GoogleFonts.manrope(
                            fontSize: 14,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
