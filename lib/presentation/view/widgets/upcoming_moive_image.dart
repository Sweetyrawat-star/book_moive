import 'dart:convert';

import 'package:book_moive/presentation/blocs/upComibg_moive_images_bloc/upComing_moive_images_bloc.dart';
import 'package:book_moive/presentation/blocs/upComibg_moive_images_bloc/upComing_moive_images_state.dart';
import 'package:book_moive/presentation/view/widgets/temp_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../common/constant/appColorConstant.dart';
import '../../../dependency_injection/get_it.dart';

import '../../blocs/upComibg_moive_detail_bloc/upComing_moive_Details_state.dart';
import '../../blocs/upComibg_moive_detail_bloc/upComing_moive_detail_bloc.dart';
import 'circularpogressbarIndicator.dart';

class UpComingMoiveImages extends StatefulWidget {
  final int id;
  const UpComingMoiveImages({super.key, required this.id,});

  @override
  State<UpComingMoiveImages> createState() => _UpComingMoiveImagesState();
}

class _UpComingMoiveImagesState extends State<UpComingMoiveImages> {
  late UpComingMoiveImagelBloc _upComingMoiveImageslBloc;
  double kelvinToCelsius(double kelvin) {
    return kelvin - 273.15;
  }

  @override
  void initState() {
    _upComingMoiveImageslBloc = appDi<UpComingMoiveImagelBloc>();
    _upComingMoiveImageslBloc.add(FetchUpComingMoiveVideosEvent(widget.id));

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
      value:  _upComingMoiveImageslBloc,
      child: BlocConsumer<UpComingMoiveImagelBloc, UpComingMoiveImagesState>(
        listener: (context, state) {
          if (state is UpComingMoiveImageInitial ) {
            const UpComingMoiveDetailsIndicator();
          }
          if (state is UpComingMoiveImageProgress) {
            const UpComingMoiveDetailsIndicator();
          }
          if (state is UpComingMoiveImageSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Data is loaded Sucessfully")));
          }
        },
        builder: (context, state) {
          if (state is UpComingMoiveImageInitial ) {
            const UpComingMoiveDetailsIndicator();
          }
          if (state is UpComingMoiveImageProgress) {
            const UpComingMoiveDetailsIndicator();
          }
          if (state is UpComingMoiveImageSuccess) {
            return Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2),
                      height: 200),
                  items:state.upComingMoiveImages.backdrops.map((i) {
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin:  const EdgeInsets.only(left: 10,right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3),
                              BlendMode.darken,
                            ),
                            image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500${i.filePath}'??"",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10, bottom: 6),
                                  child: Text(
                                    '#${i.voteCount}',
                                    style: TextStyle(
                                      color: Colors.amber.withOpacity(0.7),
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 8, bottom: 5),
                                  width: 90,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.amber.withOpacity(0.2),
                                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Icon(Icons.star, color: Colors.amber, size: 20),
                                      const SizedBox(width: 10),
                                      Text(
                                        '${i.voteAverage}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    });
                  }).toList(),

                ),
              ],
            );
          }
          if (state is UpComingMoiveDetailFailed) {
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
