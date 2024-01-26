import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../common/exceptions/app_error.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}


class NoParamsData extends Equatable {
  @override
  List<Object> get props => [];
}