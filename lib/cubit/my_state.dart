import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofitapi/data/api_handling/network_exceptions.dart';

part 'my_state.freezed.dart';

@freezed
class ResultState<T> with _$ResultState<T> {
  const factory ResultState.idel() = Idel<T>;
  const factory ResultState.loading() = Loading<T>;
  const factory ResultState.success(T data) = Success<T>;
  const factory ResultState.error(NetworkExceptions networkExceptions) = Error<T>;

}