import 'package:foods/api/api_provider.dart';
import 'package:foods/data/models/foods.dart';

class FoodsRepository {
  final ApiProvider _provider = ApiProvider();

  Future<FoodsResponse> response() async {
    try {
      dynamic responseJson = await _provider.get('/foods');
      FoodsResponse foodsResponse = FoodsResponse.fromJson(responseJson);
      return foodsResponse;
    } catch (e) {
      rethrow;
    }
  }
}
