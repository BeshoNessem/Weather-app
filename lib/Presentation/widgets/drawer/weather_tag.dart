import 'package:flutter/material.dart';
import 'package:weather_task2/Presentation/data_resources/fonts.dart';
import 'package:weather_task2/Presentation/data_resources/style.dart';
import 'package:weather_task2/Presentation/data_resources/values.dart';
class WeatherTag extends StatelessWidget {
  final IconData? iconData;
  final String? temp;
  final String text;


  const WeatherTag(
      {Key? key,  this.iconData, required this.text, this.temp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const  SizedBox(
            width: 50,
          ),
          if(iconData!=null) Icon(
            iconData,
            color: Colors.white,
            size: AppSize.s12,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: getRegularStyle(fontSize: FontSize.s16),
          ),
          Spacer(),
          Row(
            children: [
              const Icon(
                Icons.circle,
                color: Colors.amber,
                size: AppSize.s12,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                temp!,
                style: getRegularStyle(fontSize: FontSize.s14),
              ),
            ],
          )
        ],
      ),
    );
  }
}