import 'package:equatable/equatable.dart';

abstract class FileFailure extends Equatable {
  const FileFailure([
    List properties = const <dynamic>[],
  ]) : super();
}

class FileOperationFailure extends FileFailure {
  @override
  List<Object> get props => [];
}

class FileManagerPickFailure extends FileFailure {
  String? message;

  FileManagerPickFailure(this.message);

  @override
  List<Object> get props => [];
}

class CameraFailure extends FileFailure {
  @override
  List<Object> get props => [];
}

class GalleryImageFailure extends FileFailure {
  @override
  List<Object> get props => [];
}
