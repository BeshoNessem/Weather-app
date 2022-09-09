import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_task2/Network/api/services.dart';
import 'package:weather_task2/Network/bloc/cubit.dart';
import 'package:weather_task2/Presentation/data_resources/routes.dart';
import 'package:weather_task2/Presentation/data_resources/theme.dart';
import 'package:weather_task2/app/chaches/chache_helper.dart';
void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  DioHelper();
  await CacheHelper.initCashHelper();
  final List<String> mylocations = CacheHelper.getData("locations") ??const [];
  final List<String> myTemps = CacheHelper.getData("temps") ??const [];

  runApp( MyApp(location: mylocations,temp: myTemps,));
}

class MyApp extends StatelessWidget {
  final List<String> ?location;
  final List<String> ?temp;

  const MyApp({Key? key,required this.location,required this.temp}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => WeatherCubit(locations: location!,temps: temp!)..getData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather app',
        onGenerateRoute: RouteGenerator.getRoute,
        theme: getApplicationTheme(),
      ),
    );
  }
}