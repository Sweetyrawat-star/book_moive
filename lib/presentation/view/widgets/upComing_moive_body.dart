import 'package:book_moive/presentation/blocs/upComibg_moive_videos_bloc/upComing_moive_videos_state.dart';
import 'package:book_moive/presentation/view/ReservationPage.dart';
import 'package:book_moive/presentation/view/widgets/vedio_player_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../common/constant/appColorConstant.dart';
import '../../../dependency_injection/get_it.dart';

import '../../blocs/upComibg_moive_detail_bloc/upComing_moive_Details_state.dart';
import '../../blocs/upComibg_moive_detail_bloc/upComing_moive_detail_bloc.dart';
import '../../blocs/upComibg_moive_images_bloc/upComing_moive_images_bloc.dart';
import 'circularpogressbarIndicator.dart';

class UpComingMoiveDetailPageBody extends StatefulWidget {
  final int id;
  const UpComingMoiveDetailPageBody({
    super.key,
    required this.id,
  });

  @override
  State<UpComingMoiveDetailPageBody> createState() =>
      _UpComingMoiveDetailPageBodyState();
}

class _UpComingMoiveDetailPageBodyState
    extends State<UpComingMoiveDetailPageBody> {
  late UpComingMoiveDetailBloc _upComingMoiveDetailsBloc;
  late UpComingMoiveImagelBloc _comingMoiveVideoslBloc;
  late String formattedDate;

  @override
  void initState() {
    _upComingMoiveDetailsBloc = appDi<UpComingMoiveDetailBloc>();
    _upComingMoiveDetailsBloc.add(FetchUpComingMoiveDetailEvent(widget.id));
    _comingMoiveVideoslBloc = appDi<UpComingMoiveImagelBloc>();
    _comingMoiveVideoslBloc.add(FetchUpComingMoiveVideosEvent(widget.id));

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
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _upComingMoiveDetailsBloc),
        BlocProvider.value(value: _comingMoiveVideoslBloc),
      ],
      child: BlocConsumer<UpComingMoiveDetailBloc, UpComingMoiveDetailState>(
        listener: (context, state) {
          if (state is UpComingMoiveDetailInitial) {
            const UpComingMoiveDetailsIndicator();
          }
          if (state is UpComingMoiveDetailProgress) {
            const UpComingMoiveDetailsIndicator();
          }
          if (state is UpComingMoiveDetailSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Data is loaded Sucessfully")));
          }
        },
        builder: (context, state) {
          if (state is UpComingMoiveDetailInitial) {
            const UpComingMoiveDetailsIndicator();
          }
          if (state is UpComingMoiveDetailProgress) {
            const UpComingMoiveDetailsIndicator();
          }
          if (state is UpComingMoiveDetailSuccess) {
            DateTime? apiDate = state.upComingMoiveEntity.releaseDate;

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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.upComingMoiveEntity.title,
                        style: const TextStyle(
                            fontFamily: 'open sans',
                            decoration: TextDecoration.none,
                            color: darkBlack,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.25)),
                    GestureDetector(
                      onTap: () {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MoviePlayerScreen( id: widget.id,),
                              ),);





                      },
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                            color: orangeColor,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: const Center(
                          child: Text("Watch Trailer"),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("Release Date",
                    style: TextStyle(
                      fontFamily: 'open sans',
                      decoration: TextDecoration.none,
                      color: darkBlack,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )),
                Text(formattedDate,
                    style: const TextStyle(
                        fontFamily: 'open sans',
                        decoration: TextDecoration.none,
                        color: greyDarkColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.25)),
                const Text("Overview",
                    style: TextStyle(
                      fontFamily: 'open sans',
                      decoration: TextDecoration.none,
                      color: darkBlack,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )),
                Text(state.upComingMoiveEntity.overview,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontFamily: 'open sans',
                      decoration: TextDecoration.none,
                      color: greyDarkColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                Container(
                    padding: const EdgeInsets.only(top: 10),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.upComingMoiveEntity.genres.length,
                        itemBuilder: (context, index) {
                          //generes box
                          return Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(25, 25, 25, 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                  state.upComingMoiveEntity.genres[index].name,
                                  style: const TextStyle(
                                      fontFamily: 'open sans',
                                      decoration: TextDecoration.none,
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1.25)));
                        })),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ReservationPage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                          color: orangeColor,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: const Center(
                        child: Text("Book Now"),
                      ),
                    ),
                  ),
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
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
