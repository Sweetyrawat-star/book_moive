
import 'package:book_moive/Domain/usecase/upComing_moive_video.dart';
import 'package:book_moive/presentation/blocs/upComibg_moive_images_bloc/upComing_moive_images_bloc.dart';
import 'package:get_it/get_it.dart';
import '../Data/remote_source/remote_data_source.dart';
import '../Data/repository/reposistory_imp.dart';
import '../Domain/repository/repository.dart';
import '../Domain/usecase/upComing_moive_Images_usecase.dart';
import '../Domain/usecase/upComing_moive_UseCase.dart';
import '../Domain/usecase/upComing_moive_detail_usecase.dart';
import '../common/services/dio_client.dart';

import '../presentation/blocs/splash_text_bloc/splash_text_bloc.dart';
import '../presentation/blocs/upComibg_moive_detail_bloc/upComing_moive_detail_bloc.dart';
import '../presentation/blocs/upComibg_moive_videos_bloc/upComing_moive_videos_bloc.dart';
import '../presentation/blocs/upComing_moive_bloc/upComing_moive_bloc.dart';


final appDi = GetIt.instance;

void initDi() async {
  /// Api Client DI
  appDi.registerSingleton<DioClient>(DioClient());

  ///Remote Data Source DI
  appDi.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImpl(appDi()));

  ///Repo DI
  appDi.registerLazySingleton<UpComingMoiveReposistory>(
          () => PostUserReposistoryImpl(appDi()));
  ///splash Bloc DI
  appDi.registerLazySingleton<SplashTextBloc>(
          () => SplashTextBloc());

  ///Bloc DI
  appDi.registerLazySingleton<UpComingMoiveBloc>(
          () => UpComingMoiveBloc(appDi()));

  ///UseCase DI
  appDi.registerLazySingleton<CityWeatherUseCase>(
          () => CityWeatherUseCase(appDi()));
  ///UpComing Moive image Bloc DI
  appDi.registerLazySingleton<UpComingMoiveImagelBloc>(
          () => UpComingMoiveImagelBloc(appDi()));

  ///UpComing Moive image UseCase DI
  appDi.registerLazySingleton<UComingMoiveDetailImagesUseCase>(
          () => UComingMoiveDetailImagesUseCase(appDi()));

  ///UpComing Moive detail Bloc DI
  appDi.registerLazySingleton<UpComingMoiveDetailBloc>(
          () => UpComingMoiveDetailBloc(appDi()));

  ///UpComing Moive detail detail UseCase DI
  appDi.registerLazySingleton<UpComingMoiveDetailUseCase>(
          () => UpComingMoiveDetailUseCase(appDi()));

  ///UpComing Moive vedio Bloc DI
  appDi.registerLazySingleton<UpComingMoiveVideoBloc>(
          () =>UpComingMoiveVideoBloc (appDi()));

  ///UpComing Moive vedio UseCase DI
  appDi.registerLazySingleton<UpComingMoiveVediosUseCase>(
          () => UpComingMoiveVediosUseCase(appDi()));


}
