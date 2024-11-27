class CategoryModel {
  CategoryModel({
    required this.result,
    required this.message,
    required this.data,
  });

  final bool? result;
  final String? message;
  final CategoryModelData? data;

  factory CategoryModel.fromJson(Map<String, dynamic> json){
    return CategoryModel(
      result: json["result"],
      message: json["message"],
      data: json["data"] == null ? null : CategoryModelData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };

}

class CategoryModelData {
  CategoryModelData({
    required this.category,
  });

   List<Category> category;

  factory CategoryModelData.fromJson(Map<String, dynamic> json){
    return CategoryModelData(
      category: json["category"] == null ? [] : List<Category>.from(json["category"]!.map((x) => Category.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "category": category.map((x) => x.toJson()).toList(),
  };

}

class Category {
  Category({
    required this.categoryId,
    required this.categoryName,
  });

  final int? categoryId;
  final String? categoryName;

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      categoryId: json["category_id"],
      categoryName: json["category_name"],
    );
  }

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
  };

}
