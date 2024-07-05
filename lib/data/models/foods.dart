class FoodsResponse {
  FoodsResponse({required this.foods});
  List<Food> foods;
  
  factory FoodsResponse.fromJson(List<dynamic> json) {
    return FoodsResponse(
      foods: json.map((food) => Food.fromJson(food)).toList(),
    );
  }
}

class Food {
  final String name;
  final String image;
  final String desc;

  Food({
    required this.name,
    required this.image,
    required this.desc,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        name: json["name"],
        image: json["image"],
        desc: json["desc"],
      );
}
