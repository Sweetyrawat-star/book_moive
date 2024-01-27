import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../dependency_injection/get_it.dart';
import '../../blocs/upComibg_moive_videos_bloc/upComing_moive_videos_bloc.dart';
import '../../blocs/upComibg_moive_videos_bloc/upComing_moive_videos_state.dart';
import 'circularpogressbarIndicator.dart';

class MoviePlayerScreen extends StatefulWidget {
//  final String videoUrl;
  final int id ;

  MoviePlayerScreen({ required this.id});

  @override
  _MoviePlayerScreenState createState() => _MoviePlayerScreenState();
}

class _MoviePlayerScreenState extends State<MoviePlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  late UpComingMoiveVideoBloc _comingMoiveVideoslBloc;
  late String formattedDate;

  @override
  void initState() {
    _comingMoiveVideoslBloc = appDi<UpComingMoiveVideoBloc>();
    _comingMoiveVideoslBloc.add(FetchUpComingMoiveVideosEvent(widget.id));
   /* _videoPlayerController = VideoPlayerController.network("");
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
    );*/

    super.initState();
  }



  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
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
              return  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.upComingMoiveVideo.results[0].name),
                /*  Center(
                    child: Chewie(
                      controller: _chewieController,
                    ),
                  ),*/
                ],
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
      )



    );
  }
}
