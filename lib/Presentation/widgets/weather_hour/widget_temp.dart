import 'package:flutter/material.dart';
import 'package:weather_task2/Presentation/widgets/weather_hour/temp.dart';
import 'package:weather_task2/data/model/forecast.dart';

class HourlyMainWidget extends StatelessWidget {
  final List<Hour> hours;
  const HourlyMainWidget({Key? key, required this.hours}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              HourlyTempRow(hours: hours),
              SizedBox(
                height: 100,
              ),
              //   ),
              DropsRow(hours: hours),
            ],
          ),
        ),
        Weatherchart(hours:hours),
      ],
    );
  }
}