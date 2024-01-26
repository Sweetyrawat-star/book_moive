import 'package:book_moive/presentation/view/widgets/temp_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../common/constant/appColorConstant.dart';
import '../../../dependency_injection/get_it.dart';
import '../../blocs/city_weather_detail_bloc/city_weather_detail_bloc.dart';
import '../../blocs/city_weather_detail_bloc/city_weather_detail_state.dart';
import 'circularpogressbarIndicator.dart';

class UpComingMoiveDetailPageBody extends StatefulWidget {
  final int id;
  const UpComingMoiveDetailPageBody({super.key, required this.id,});

  @override
  State<UpComingMoiveDetailPageBody> createState() => _UpComingMoiveDetailPageBodyState();
}

class _UpComingMoiveDetailPageBodyState extends State<UpComingMoiveDetailPageBody> {
  late CityWeatherDetailBloc _weatherBloc;
  double kelvinToCelsius(double kelvin) {
    return kelvin - 273.15;
  }

  @override
  void initState() {
    _weatherBloc = appDi<CityWeatherDetailBloc>();
    _weatherBloc.add(FetchWeatherEvent(widget.id));

    super.initState();
  }
  // @override
  // void dispose() {
  //   _weatherBloc.close();
  //   // TODO: implement dispose
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
   return BlocProvider.value(
      value:  _weatherBloc,
      child: BlocConsumer<CityWeatherDetailBloc, CityWeatherDetailState>(
        listener: (context, state) {
          if (state is CityWeatherDetailInitial ) {
            const UpComingMoiveDetailsIndicator();
          }
          if (state is CityWeatherDetailProgress) {
            const UpComingMoiveDetailsIndicator();
          }
          if (state is CityWeatherDetailSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Data is loaded Sucessfully")));
          }
        },
        builder: (context, state) {
          if (state is CityWeatherDetailInitial ) {
            const UpComingMoiveDetailsIndicator();
          }
          if (state is CityWeatherDetailProgress) {
            const UpComingMoiveDetailsIndicator();
          }
          if (state is CityWeatherDetailSuccess) {
            // SchedulerBinding.instance.addPostFrameCallback((_) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(
            //       content: Text('Data is loaded Sucessfully'),
            //     ),
            //   );
            // });
         /*   final celTemp =
            kelvinToCelsius(state.cityWeatherEntity.main?.temp?.toDouble() ??0.0);
            final celTempMax = (state.cityWeatherEntity.main?.tempMax?.toDouble()??0.0);
            final celTempMin = (state.cityWeatherEntity.main?.tempMin?.toDouble()??0.0);*/
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.cityWeatherEntity.title,
                  style: const TextStyle(
                      color: greyDarkColor,
                      fontWeight: FontWeight.w400, // For bold text
                      fontFamily: 'Circle'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 200,
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  color: greyColor,
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // Handle back button action
                            },
                            icon: const Icon(Icons.arrow_upward_sharp),
                          ),
                        /*  Text(
                            "${celTempMax.toStringAsFixed(1)} °",
                            style: const TextStyle(fontSize: 16),
                          ),*/
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              // Handle back button action
                            },
                            icon: const Icon(Icons.arrow_downward),
                          ),
                         /* Text(
                            "${celTempMin.toStringAsFixed(1)}°",
                            style: const TextStyle(fontSize: 16),
                          ),*/
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child:  const SizedBox(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'humidity',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                           /* Text(
                              state.cityWeatherEntity.main?.humidity.toString() ?? "10",
                              style: TextStyle(fontSize: 16),
                            ),*/
                          ],
                        ),
                         SizedBox(
                          width: 150,
                          child: Row(
                            children: [
                              Text(
                                'wind',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                             /* Text(
                                "${state.cityWeatherEntity.wind.toString()} m/s" ?? "3 m/s",
                                style: const TextStyle(fontSize: 16),
                              ),*/
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child:  SizedBox(
                    width: 150,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'uv index',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '2',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 150,
                          child: Row(
                            children: [
                              const Text(
                                'pressure',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                               state.cityWeatherEntity.title ?? "10mmHg",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(
                  color: greyColor,
                ),
                const SizedBox(
                  height: 30,
                ),
                HorizontalListScreen(),
              ],
            );
          }
           if (state is CityWeatherDetailFailed) {
            return const Column(
              children: [
                Center(child: Text("Data not available")),
              ],
            );
          }else{
             return Container();
           }


        },
      ),
    );

  }
}
