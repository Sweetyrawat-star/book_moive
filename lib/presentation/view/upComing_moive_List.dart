import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/constant/appColorConstant.dart';
import '../../dependency_injection/get_it.dart';
import 'package:intl/intl.dart';
import '../blocs/upComing_moive_bloc/upComing_moive_bloc.dart';
import 'upComing_moive_detail_page.dart';

class UpComingMoiveList extends StatefulWidget {
  const UpComingMoiveList({super.key});

  @override
  _UpComingMoiveListState createState() => _UpComingMoiveListState();
}

class _UpComingMoiveListState extends State<UpComingMoiveList> {
  final List<String> items = List.generate(50, (index) => 'Item ${index + 1}');
  final double itemHeight = 100.0;
  List<bool> itemVisibility = [];
  late String formattedDate;

  late UpComingMoiveBloc _upComingMoiveBloc;
  @override
  void initState() {
    _upComingMoiveBloc = appDi<UpComingMoiveBloc>();
    _upComingMoiveBloc.add(UpComingMoiveImageEvent());
    super.initState();
    itemVisibility = List.generate(items.length, (index) => false);
  }

  @override
  void dispose() {
    _upComingMoiveBloc.close();
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
          value: _upComingMoiveBloc,
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
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            SlidePageRoute(
                                builder: (_) => UpComingMoiveScreen(
                                      tile: state
                                          .upcomingMoiveEntity[index].title!,
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
                              child: Container(
                                height: 100,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'https://image.tmdb.org/t/p/w500${state.upcomingMoiveEntity[index].posterPath}',
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          height: 100,
                                          width: 100,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                        Colors.red,
                                                        BlendMode.colorBurn)),
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons
                                                .error), // Widget to display when an error occurs
                                      ),
                                    ),
                                    const SizedBox(width: 20,),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.upcomingMoiveEntity[index]
                                                .title!,
                                            style: const TextStyle(
                                                color: darkBlack,
                                                fontWeight: FontWeight
                                                    .w600, // For bold text
                                                fontFamily: 'Circle'),
                                          ),
                                          Row(
                                            children: [
                                              const Text("Adult : "),
                                              state.upcomingMoiveEntity[index]
                                                          .adult ==
                                                      true
                                                  ? const Text(
                                                      "18+",
                                                style: TextStyle(
                                                    color: greyDarkColor,
                                                    fontWeight: FontWeight
                                                        .w400, // For bold text
                                                    fontFamily: 'Circle'),
                                                    )
                                                  : const Text(
                                                      "Below 18",
                                                style: TextStyle(
                                                    color: greyDarkColor,
                                                    fontWeight: FontWeight
                                                        .w400, // For bold text
                                                    fontFamily: 'Circle'),
                                                    ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Text("Language : "),
                                              Text(
                                                state.upcomingMoiveEntity[index].originalLanguage!,
                                                style: const TextStyle(
                                                    color: greyDarkColor,
                                                    fontWeight: FontWeight
                                                        .w400, // For bold text
                                                    fontFamily: 'Circle'),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            formattedDate,
                                            style: const TextStyle(
                                                color: greyDarkColor,
                                                fontWeight: FontWeight
                                                    .w400, // For bold text
                                                fontFamily: 'Circle'),
                                          ),
                                          const SizedBox(height: 20,),
                                          Container(
                                            height: 40,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                color: orangeColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0)),
                                            child: const Center(
                                              child: Text("Book Now"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
