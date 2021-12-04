import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../helper/utils.dart';

class MainWeather extends StatelessWidget {
  var ruDatesFuture = initializeDateFormatting('ru', null);
  final wData;

  MainWeather({this.wData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(25, 15, 25, 5),
      height: MediaQuery.of(context).size.height / 3.4,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Icon(Icons.location_on_outlined),
          //     Text('${wData.weather.cityName}', style: _style1),
          //   ],
          // ),
          // SizedBox(height: 1),
          Text(
                '${wData.weather.temp.toStringAsFixed(0)}°C',
                style: TextStyle(
                  fontSize: 85,
                  fontWeight: FontWeight.w600,
                ),
              ),
          SizedBox(height: 10),
          Text(
            DateFormat.yMMMd("ru").format(DateTime.now()),
            // style: _style2,
          ),
          // SizedBox(height: 10),
          // Text(
          //   '${wData.weather.tempMax.toStringAsFixed(0)}°/ ${wData.weather.tempMin.toStringAsFixed(0)}° ',//Feels like ${wData.weather.feelsLike.toStringAsFixed(0)}°
          //   style: _style2.copyWith(fontSize: 19),
          // ),
        ],
      ),
    );
  }
}
