import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:rijal_driweather/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:rijal_driweather/features/weather/presentation/bloc/weather_event.dart';
import 'package:rijal_driweather/features/weather/presentation/bloc/weather_state.dart';
import 'package:rijal_driweather/features/weather/presentation/pages/detail_weather_page.dart';
import '../widgets/myappbar.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //isSearch
  bool isSearch = false;
  String getWeatherDescription(int code) {
    switch (code) {
      case 1000:
        return 'Sunny';
      case 1100:
        return 'Mostly Clear';
      case 1101:
        return 'Partly Cloudy';
      case 1102:
        return 'Mostly Cloudy';
      case 1001:
        return 'Cloudy';
      case 2000:
        return 'Fog';
      case 4000:
        return 'Drizzle';
      case 4200:
        return 'Light Rain';
      case 4001:
        return 'Rain';
      case 4201:
        return 'Heavy Rain';
      default:
        return 'Unknown';
    }
  }

  //default location
  String location = 'Toronto';

  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(GetWeatherEvent(location));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //kotak utama background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF47BFDF), // Biru muda
              Color(0xFF4A91FF), // Biru tua
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  isSearch
                      ?
                      //app bar mode pencarian lokasi
                      Padding(
                          padding: const EdgeInsets.only(
                            top: 50,
                            left: 20,
                            right: 20,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 3,
                              ),
                            ),
                            child: Row(
                              children: [
                                //icon back
                                GestureDetector(
                                  onTap: () {
                                    isSearch = !isSearch;
                                    setState(() {});
                                  },
                                  child: Icon(Icons.arrow_back_ios_new,
                                      color: Colors.black.withOpacity(0.8)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: TextField(
                                    onSubmitted: (value) {
                                      setState(() {
                                        isSearch = false;
                                        location = value;
                                      });

                                      Future.delayed(
                                          const Duration(milliseconds: 500),
                                          () {
                                        context
                                            .read<WeatherBloc>()
                                            .add(GetWeatherEvent(location));
                                      });
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Search Location',
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                    ),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      :
                      //appbar mode lokasi tersedia
                      Padding(
                          padding: const EdgeInsets.only(
                            top: 50,
                            left: 20,
                            right: 20,
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        isSearch = !isSearch;
                                        setState(() {});
                                      },
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/icons/map.svg',
                                            colorFilter: const ColorFilter.mode(
                                              Color(0xFFFFFFFF),
                                              BlendMode.srcIn,
                                            ),
                                            width: 20,
                                            height: 20,
                                          ),
                                          const SizedBox(width: 20),
                                          Text(
                                            location,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          const Icon(Icons.keyboard_arrow_down,
                                              color: Colors.white),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              //icon notifikasi
                              GestureDetector(
                                onTap: () {
                                  showNotification(
                                      context: context,
                                      builder: (builder) {
                                        return Container();
                                      });
                                },
                                child: SvgPicture.asset(
                                  'assets/icons/notifikasi.svg',
                                  colorFilter: const ColorFilter.mode(
                                    Color(0xFFFFFFFF),
                                    BlendMode.srcIn,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  //awan
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Image.asset(
                      'assets/images/awan.png',
                      width: 172,
                      height: 170,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //informasi cuaca
                  BlocBuilder<WeatherBloc, WeatherState>(
                      builder: (context, state) {
                    if (state is WeatherLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is WeatherLoadedState) {
                      return Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFFFFFFF).withOpacity(0.2),
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFFFFFF).withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.only(
                            top: 20, left: 20, right: 20, bottom: 20),
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          children: [
                            Text(
                                'Today, ${DateFormat('d MMMM yyyy').format(DateTime.parse(state.weather.time))}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${state.weather.temperature}°',
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              getWeatherDescription(state.weather.weatherCode),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //wind
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/windy.svg',
                                  colorFilter: const ColorFilter.mode(
                                    Color(0xFFFFFFFF),
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Wind',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  '|',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${state.weather.windSpeed} m/s',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            //humidity
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/hum.svg',
                                  colorFilter: const ColorFilter.mode(
                                    Color(0xFFFFFFFF),
                                    BlendMode.srcIn,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Hum',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  '|',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${state.weather.humidity}%',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else if (state is WeatherErrorState) {
                      return Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFFFFFFF).withOpacity(0.2),
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFFFFFF).withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.only(
                            top: 20, left: 20, right: 20, bottom: 20),
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                                'Mohon maaf, tidak ada data cuaca untuk lokasi ini\nAtau koneksi internet anda tidak stabil.\nSilakan tekan tombol refresh untuk mencoba lagi',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            // Tombol Refresh
                            ElevatedButton.icon(
                              onPressed: () {
                                context
                                    .read<WeatherBloc>()
                                    .add(GetWeatherEvent(location));
                              },
                              icon: const Icon(Icons.refresh,
                                  color: Color(0xFF4A91FF)),
                              label: const Text(
                                'Refresh',
                                style: TextStyle(
                                  color: Color(0xFF4A91FF),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'No data',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      );
                    }
                  }),

                  const SizedBox(
                    height: 20,
                  ),
                ],
              )),
            ),
            //tombol ke detail cuaca
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 50),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: BlocBuilder<WeatherBloc, WeatherState>(
                  builder: (context, state) {
                    if (state is WeatherLoadedState) {
                      return Center(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 50),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailWeatherPage(
                                      location: state.weather.name),
                                ),
                              ).then((_) {
                                context
                                    .read<WeatherBloc>()
                                    .add(GetWeatherEvent(location));
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFFFFFF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                            ),
                            child: const Text(
                              'Detail Cuaca',
                              style: TextStyle(
                                color: Color(0xFF4A91FF),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox
                          .shrink(); // tidak menampilkan tombol jika data belum siap
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
