import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:foods/api/api.dart';
import 'package:foods/data/models/foods.dart';
import 'package:foods/data/repositores/foods/login_repository.dart';
import 'package:foods/ui/widgets/foods_widget.dart';
import 'package:meta/meta.dart';

part 'foods_state.dart';

class FoodsCubit extends Cubit<FoodsState> {
  FoodsCubit() : super(FoodsInitial());
  final FoodsRepository _repository = FoodsRepository();

  void fetchApiFoods() async {
    if (state is FoodsSuccess) return;
    emit(FoodsLoading());
    try {
      FoodsResponse responseJson = await _repository.response();
      emit(FoodsSuccess(response: responseJson));
    } catch (e) {
      emit(FoodsFailure());
      rethrow;
    }
  }
}
