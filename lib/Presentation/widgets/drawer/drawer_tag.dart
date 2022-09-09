import 'package:flutter/material.dart';
import 'package:weather_task2/Presentation/data_resources/fonts.dart';
import 'package:weather_task2/Presentation/data_resources/style.dart';
import 'package:weather_task2/Presentation/data_resources/values.dart';
class DrawerTag extends StatelessWidget {
  final IconData iconData;
  final Icon? prephralIcon;
  final String text;

  const DrawerTag(
      {Key? key, required this.iconData, required this.text, this.prephralIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: getRegularStyle(fontSize: FontSize.s16),
          ),
          Spacer(),
          if (prephralIcon != null) prephralIcon!
        ],
      ),
    );
  }
}