import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/constant/appColorConstant.dart';
import '../../dependency_injection/get_it.dart';
import 'package:intl/intl.dart';

import '../blocs/city_weather_bloc/city_weather_bloc.dart';
import 'city_detail_page.dart';

class AnimatedScrollableList extends StatefulWidget {
  const AnimatedScrollableList({super.key});

  @override
  _AnimatedScrollableListState createState() => _AnimatedScrollableListState();
}

class _AnimatedScrollableListState extends State<AnimatedScrollableList> {
  final List<String> items = List.generate(50, (index) => 'Item ${index + 1}');
  final double itemHeight = 100.0;
  List<bool> itemVisibility = [];
  late String formattedDate;

  late UpComingMoiveBloc _cityWeatherBloc;
  double kelvinToCelsius(double kelvin) {
    return kelvin - 273.15;
  }

  String displayWeatherImagePath(String key) {
    String weatherImagePath;

    switch (key) {
      case 'clouds':
        weatherImagePath = 'assets/weather_condition_icons/cloud.png';
        break;
      case 'rain':
        weatherImagePath = 'assets/weather_condition_icons/rainy.png';
        break;
      case 'mist':
        weatherImagePath = 'assets/weather_condition_icons/sunCloud.png';
        break;
      case 'smoke':
        weatherImagePath = 'assets/weather_condition_icons/windySunny.png';
        break;
      default:
        weatherImagePath = 'assets/weather_condition_icons/sunny.png';
    }
    return weatherImagePath;
  }

  @override
  void initState() {
    _cityWeatherBloc = appDi<UpComingMoiveBloc>();
    _cityWeatherBloc.add(CityEvent());
    super.initState();
    itemVisibility = List.generate(items.length, (index) => false);
  }

  @override
  void dispose() {
    _cityWeatherBloc.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: whiteColor,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: BlocProvider.value(
          value: _cityWeatherBloc,
          child: BlocConsumer<UpComingMoiveBloc, UpComingMoiveState>(
            listener: (context, state) {
              if (state is UpComingMoiveInitial) {
                const CircularProgressIndicator();
              }
              if (state is UpComingMoiveProgress) {
                const CircularProgressIndicator();
              }
              if (state is UpComingMoiveSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Data is loaded Sucessfully")));
              }
            },
            builder: (context, state) {
              if (state is UpComingMoiveInitial) {
                return const CircularProgressIndicator();
              }
              return ListView.separated(
                shrinkWrap: true,
                itemCount: state.upcomingMoiveEntity.length,
                separatorBuilder: (context, index) => const Divider(
                  height: 1.0,
                  color: greyColor,
                ),
                itemBuilder: (context, index) {
                  final DateTime now = DateTime.now();
                  DateTime? apiDate =
                      state.upcomingMoiveEntity[index].releaseDate;

                  if (apiDate != null) {
                    formattedDate = DateFormat('dd-MM-yyyy').format(apiDate);
                    if (kDebugMode) {
                      print(formattedDate);
                    }
                  } else {
                    if (kDebugMode) {
                      print("Release date is null");
                    }
                  }

                  final DateFormat timeFormat = DateFormat.jm();
                  final String formattedTime = timeFormat.format(now);
                  /*final celTemp =
                      kelvinToCelsius(state.upcomingMoiveEntity[index].main.temp);
*/
                  return GestureDetector(
                    onTap: () {

                        Navigator.push(
                          context,
                          SlidePageRoute(
                              builder: (_) => WeatherScreen(
                                    id: state.upcomingMoiveEntity[index].id!,
                                  )));
                    },
                    child: VisibilityDetector(
                      key: Key('item_$index'),
                      onVisibilityChanged: (visibilityInfo) {
                        if (!itemVisibility[index] &&
                            visibilityInfo.visibleFraction == 1.0) {
                          setState(() {
                            itemVisibility[index] = true;
                          });
                        }
                      },
                      child: AnimatedOpacity(
                        opacity: itemVisibility[index] ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: AnimatedAlign(
                          alignment: itemVisibility[index]
                              ? Alignment.topCenter
                              : Alignment.bottomCenter,
                          duration: const Duration(milliseconds: 500),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, right: 8, left: 8, bottom: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: 'https://image.tmdb.org/t/p/original/gSkfBGdxdialBMM7P02V4hcI6Ij.jpg',
                                      imageBuilder: (context, imageProvider) => Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                              colorFilter:
                                              const ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                                        ),
                                      ),
                                      placeholder: (context, url) => const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => const Icon(Icons.error),// Widget to display when an error occurs
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.upcomingMoiveEntity[index]
                                              .title!,
                                          style: const TextStyle(
                                              color: darkBlack,
                                              fontWeight: FontWeight
                                                  .w400, // For bold text
                                              fontFamily: 'Circle'),
                                        ),
                                        const SizedBox(height: 10,),
                                        state.upcomingMoiveEntity[index]
                                                    .adult ==
                                                true
                                            ? const Text(
                                                "18+",
                                                style: TextStyle(
                                                    color: darkBlack,
                                                    fontWeight: FontWeight
                                                        .w400, // For bold text
                                                    fontFamily: 'Circle'),
                                              )
                                            : const Text(
                                                "Below 18",
                                                style: TextStyle(
                                                    color: darkBlack,
                                                    fontWeight: FontWeight
                                                        .w400, // For bold text
                                                    fontFamily: 'Circle'),
                                              ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          formattedDate,
                                          style: const TextStyle(
                                              color: greyDarkColor,
                                              fontWeight:
                                                  FontWeight.w400, // For bold text
                                              fontFamily: 'Circle'),
                                        ),
                                        const SizedBox(height: 10,),
                                        Container(
                                          height: 40,
                                          width: 80,
                                          decoration: BoxDecoration(
                                           color: orangeColor,
                                            borderRadius: BorderRadius.circular(15.0)
                                          ),
                                          child: const Center(
                                            child: Text("Book Now"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    /* Text(
                                      state.upcomingMoiveEntity[index].name,
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight:
                                              FontWeight.bold, // For bold text
                                          fontFamily: 'Circle'),
                                    ),*/

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
