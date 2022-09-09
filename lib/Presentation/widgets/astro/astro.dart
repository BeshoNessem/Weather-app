import 'package:flutter/material.dart';
import 'package:weather_task2/Presentation/data_resources/assets.dart';
import 'package:weather_task2/Presentation/data_resources/fonts.dart';
import 'package:weather_task2/Presentation/data_resources/style.dart';
import 'package:weather_task2/Presentation/data_resources/values.dart';
import 'package:weather_task2/data/model/forecast.dart';
class AstroView extends StatelessWidget {
  final AstroModel astroModel;
  const AstroView({Key? key, required this.astroModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
      child: Row(
        children: [
          AstroViewComponent(
            date: astroModel.sunrise!,
            state: true, //if sunrise
          ),
          Spacer(),
          AstroViewComponent(
            date: astroModel.sunset!,
            state: false,
          ),
        ],
      ),
    );
  }
}

class AstroViewComponent extends StatelessWidget {
  final String date;
  final bool state;

  const AstroViewComponent({
    Key? key,
    required this.date,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          state ? "Sunrise" : "Sunset",
          style: getRegularStyle(fontSize: FontSize.s14),
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          date,
          style: getSemiBoldStyle(color: Colors.white, fontSize: FontSize.s14),
        ),
        Image.asset(
          state ? ImageAssets.sunrise : ImageAssets.sunsunset,
          height: AppSize.s120,
        )
      ],
    );
  }
}