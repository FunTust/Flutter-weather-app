import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Screens/search.dart';

import '../provider/weatherProvider.dart';

class Bar extends StatefulWidget {
  @override
  _BarState createState() => _BarState();
}

class _BarState extends State<Bar> {
  final _textController = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: MediaQuery.of(context).size.width * .01,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu),
              iconSize: 40),
          Text("${weatherData.weather.cityName}",
              style: GoogleFonts.manrope(
                  fontSize: 26, fontWeight: FontWeight.w600)),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => SearchPage(title: 'title')));
            },
            icon: const Icon(Icons.add_circle_outline),
            iconSize: 40,
          ),
          // TextField(
          //   style: TextStyle(color: Colors.black),
          //   maxLines: 1,
          //   controller: _textController,
          //   decoration: InputDecoration(
          //     hintStyle: TextStyle(color: Colors.grey),
          //     errorText: _validate ? null : null,
          //     border: InputBorder.none,
          //     focusedBorder: InputBorder.none,
          //     enabledBorder: InputBorder.none,
          //     icon: Padding(
          //       padding: const EdgeInsets.only(left: 10),
          //       child: Icon(
          //         Icons.search,
          //         color: Colors.black,
          //       ),
          //     ),
          //     contentPadding: EdgeInsets.only(
          //       left: 0,
          //       bottom: 11,
          //       top: 11,
          //       right: 15,
          //     ),
          //     hintText: "Search Location",
          //   ),
          //   onSubmitted: (value) {
          //     setState(() {
          //       _textController.text.isEmpty
          //           ? _validate = true
          //           : Provider.of<WeatherProvider>(context, listen: false)
          //               .searchWeatherData(location: value);
          //     });
          //   },
          // ),
        ],
      ),
    );
  }
}
