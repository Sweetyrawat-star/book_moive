
import 'package:get_it/get_it.dart';
import '../Data/remote_source/remote_data_source.dart';
import '../Data/repository/reposistory_imp.dart';
import '../Domain/repository/repository.dart';
import '../Domain/usecase/cityWeatherUseCase.dart';
import '../Domain/usecase/city_weather_detail_usecase.dart';
import '../common/services/dio_client.dart';
import '../presentation/blocs/city_weather_bloc/city_weather_bloc.dart';
import '../presentation/blocs/city_weather_detail_bloc/city_weather_detail_bloc.dart';
import '../presentation/blocs/splash_text_bloc/splash_text_bloc.dart';


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

  ///city weather detail Bloc DI
  appDi.registerLazySingleton<CityWeatherDetailBloc>(
          () => CityWeatherDetailBloc(appDi()));

  ///city weather detail UseCase DI
  appDi.registerLazySingleton<CityWeatherDetailUseCase>(
          () => CityWeatherDetailUseCase(appDi()));


}
