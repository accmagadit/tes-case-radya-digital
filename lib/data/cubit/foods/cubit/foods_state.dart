part of 'foods_cubit.dart';

@immutable
sealed class FoodsState {}

final class FoodsInitial extends FoodsState {}

final class FoodsLoading extends FoodsState {}

final class FoodsFailure extends FoodsState {
  final ErrorType type;

  final String message;

  FoodsFailure({this.type = ErrorType.general, this.message = ""});

  FoodsFailure.network(String message)
      : this(type: ErrorType.network, message: message);

  FoodsFailure.general(String message)
      : this(type: ErrorType.network, message: message);

  List<Object> get props => [type, message];

}

final class FoodsSuccess extends FoodsState {
  final FoodsResponse response;

  FoodsSuccess({required this.response});

  List<Object> get props => [response];
}
