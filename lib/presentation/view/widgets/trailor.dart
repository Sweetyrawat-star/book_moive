import 'package:book_moive/presentation/blocs/upComibg_moive_videos_bloc/upComing_moive_videos_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../common/constant/appColorConstant.dart';
import '../../../dependency_injection/get_it.dart';
import '../../blocs/upComibg_moive_videos_bloc/upComing_moive_videos_bloc.dart';
import 'circularpogressbarIndicator.dart';

class trailerwatch extends StatefulWidget {
  var trailerytid;
  final int id;
  trailerwatch({this.trailerytid, required this.id});

  @override
  State<trailerwatch> createState() => _trailerwatchState();
}

class _trailerwatchState extends State<trailerwatch> {
  late YoutubePlayerController _controller;
  late UpComingMoiveVideoBloc _comingMoiveVideoslBloc;

  bool showDoneButton = false;

  @override
  void initState() {
    super.initState();
    _comingMoiveVideoslBloc = appDi<UpComingMoiveVideoBloc>();
    _comingMoiveVideoslBloc.add(FetchUpComingMoiveVideosEvent(widget.id));
    final videoid = YoutubePlayer.convertUrlToId(widget.trailerytid);
    _controller = YoutubePlayerController(
      initialVideoId: videoid.toString(),
      flags: const YoutubePlayerFlags(
        enableCaption: true,
        autoPlay: false,
        mute: false,
        // controlsVisibleAtStart: true,
        forceHD: true,
      ),
    );
    _controller.addListener(() {
      if (_controller.value.isFullScreen) {
        // Video has ended
        setState(() {
          showDoneButton = true;
        });
      }
      if (_controller.value.playerState == PlayerState.ended) {
        Navigator.pop(context);
      }
      if (_controller.value.playerState == PlayerState.playing) {
        setState(() {
          showDoneButton = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _comingMoiveVideoslBloc,
      child: BlocConsumer<UpComingMoiveVideoBloc, UpComingMoiveVideosState>(
        listener: (context, state) {
          if (state is UpComingMoiveVideosInitial) {
            const UpComingMoiveDetailsIndicator();
          }
          if (state is UpComingMoiveVideosProgress) {
            const UpComingMoiveDetailsIndicator();
          }
          if (state is UpComingMoiveVideosSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Data is loaded Sucessfully")));
          }
        },
        builder: (context, state) {
          if (state is UpComingMoiveVideosInitial) {
            const UpComingMoiveDetailsIndicator();
          }
          if (state is UpComingMoiveVideosProgress) {
            const UpComingMoiveDetailsIndicator();
          }
          if (state is UpComingMoiveVideosSuccess) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: YoutubePlayer(
                        controlsTimeOut: Duration(milliseconds: 1500),
                        aspectRatio: 16 / 9,
                        controller: _controller,
                        showVideoProgressIndicator: true,
                        bufferIndicator: const Center(
                          child: Center(
                              child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.amber),
                          )),
                        ),
                        progressIndicatorColor: Colors.amber,
                        bottomActions: [
                          CurrentPosition(),
                          ProgressBar(
                              isExpanded: true,
                              colors: const ProgressBarColors(
                                playedColor: Colors.white,
                                handleColor: Colors.amber,
                              )),
                          RemainingDuration(),
                          FullScreenButton(),
                        ],
                      ),
                    ),
                    if (showDoneButton)
                      Positioned(
                        top: 50,
                        left: 10,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                                color: orangeColor,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: const Center(
                              child: Text("Done"),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }
          if (state is UpComingMoiveVideosFailed) {
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
