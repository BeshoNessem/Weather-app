import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_task2/Network/bloc/cubit.dart';
import 'package:weather_task2/Presentation/AppBar/sliver_appbar.dart';
import 'package:weather_task2/Presentation/data_resources/sizes.dart';
import 'package:weather_task2/Presentation/widgets/astro/astro.dart';
import 'package:weather_task2/Presentation/widgets/background.dart';
import 'package:weather_task2/Presentation/widgets/drawer/builder.dart';
import 'package:weather_task2/Presentation/widgets/forecast_day/forecast_day.dart';
import 'package:weather_task2/Presentation/widgets/forecast_txt/forecast_txt.dart';
import 'package:weather_task2/Presentation/widgets/humidity_uv/humidity.dart';
import 'package:weather_task2/Presentation/widgets/item.dart';
import 'package:weather_task2/Presentation/widgets/weather_hour/widget_temp.dart';
import 'package:weather_task2/data/model/forecast.dart';
import 'package:weather_task2/data/model/weather_data.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required}) : super(key: key);

@override
State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController scrollController;
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

  bool _appBarCollapsed = false;
  bool isLight = true;
  @override
  void initState() {
    scrollController = ScrollController()
      ..addListener(() {
        if (_isCollapsed() && !_appBarCollapsed) {
          setState(() {
            _appBarCollapsed = true;
            isLight = false;
          });
        } else if (!_isCollapsed() && _appBarCollapsed) {
          setState(() {
            _appBarCollapsed = false;
            isLight = true;
          });
        }
      });
    super.initState();
  }

  bool _isCollapsed() =>
      scrollController.hasClients && scrollController.offset > 230;
  WeatherDataModel? weatherData;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {
        if (state is WeatherGetDataSuccess) {
          weatherData = WeatherCubit.get(context).weatherData;
        }
        print(state.toString());
      },
      builder: (context, state) {
        print("object");

        return (state is WeatherDataLoading || state is WeatherGetDataError)
            ? ItemBackground(
          isLight: true,
          child: Center(
            child: Image.asset(
              "assets/images/sun.gif",
              height: 150,
            ),
          ),
        )
            : SideMenu(
          type: SideMenuType.slide,
          background: Colors.blueGrey.shade900,
          key: _sideMenuKey,
          closeIcon: null,
          menu: buildMenu(weatherData!.location!.region, weatherData!.current!.temp_c,context),
          maxMenuWidth: SizeConfig.screenWidth * 0.8,
          child: Scaffold(
            extendBodyBehindAppBar: true,
            body: backGround_layout(
              isLight: isLight,
              child: CustomScrollView(
                controller: scrollController,
                shrinkWrap: false,
                slivers: <Widget>[
                  CustomSliverAppBar(
                      sideMenuKey: _sideMenuKey,
                      isCollapsed: _appBarCollapsed,
                      isLight: isLight,
                      day: DateFormat('E').format(DateTime.now()),
                      feelsLike:
                      weatherData!.current!.feelslike_c.toString(),
                      maxTemp: weatherData!.forecastedDays![0].max,
                      minTemp: weatherData!.forecastedDays![0].min,
                      place: WeatherCubit.get(context)
                          .weatherData!
                          .location!
                          .region,
                      temp:
                      weatherData!.current!.temp_c.ceil().toString(),
                      time: DateFormat("h:mm a").format(DateTime.now())),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ItemBackground(
                            child: HourlyMainWidget(
                                hours: weatherData!
                                    .forecastedDays![0].hours),
                            isLight: isLight,
                          ),
                          ItemBackground(
                            isLight: isLight,
                            child: TextForecast(
                                forecastText: weatherData!
                                    .current!.condition.conditionText),
                          ),
                          ItemBackground(
                              isLight: isLight,
                              child: DaysForecast(
                                isLight: isLight,
                                days: weatherData!.forecastedDays!,
                              )),
                          ItemBackground(
                              isLight: isLight,
                              child: AstroView(
                                astroModel: AstroModel(
                                    moonPhase: weatherData!
                                        .forecastedDays![0]
                                        .astro
                                        .moonPhase,
                                    sunrise: weatherData!
                                        .forecastedDays![0].astro.sunrise,
                                    sunset: weatherData!
                                        .forecastedDays![0].astro.sunset),
                              )),
                          ItemBackground(
                              child: WeatherExtraWidget(
                                humidty: weatherData!.current!.humidty,
                                uvIndex: weatherData!.current!.uvIndex,
                                wind: weatherData!.current!.wind,
                              ),
                              isLight: isLight),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}