import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rijal_driweather/onboard_page.dart';

import 'features/weather/presentation/bloc/weather_bloc.dart';
import 'injection.dart' as inject;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inject.init(); // inisialisasi dependency injection
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherBloc>(create: (_) => inject.locator<WeatherBloc>()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'WEATHER',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const OnboardPage()),
    );
  }
}
