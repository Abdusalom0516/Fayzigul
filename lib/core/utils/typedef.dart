import 'package:dartz/dartz.dart';
import 'package:plant_store/core/errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;


