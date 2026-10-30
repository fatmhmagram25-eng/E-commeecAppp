import 'dart:convert';

// دالة فك التشفير أصبحت ذكية وتقبل أي نوع بيانات قادم من Dio
List<ProductModel> prodectFromJson(dynamic str) {
  if (str == null) return [];
  try {
    if (str is String) {
      final decoded = jsonDecode(str);
      return List<ProductModel>.from(
        decoded.map(
          (x) => ProductModel.fromJson(Map<dynamic, dynamic>.from(x)),
        ),
      );
    } else if (str is List) {
      return List<ProductModel>.from(
        str.map((x) => ProductModel.fromJson(Map<dynamic, dynamic>.from(x))),
      );
    }
  } catch (e) {
    print("🔥 خطأ في تحويل المودل: $e");
  }
  return [];
}

class ProductModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  // التعديل الأهم: استخدام Map<dynamic, dynamic> لتجنب تعارض أنواع بيانات Dio
  factory ProductModel.fromJson(Map<dynamic, dynamic> json) => ProductModel(
    id: json["id"] != null ? int.tryParse(json["id"].toString()) : null,
    title: json["title"]?.toString(),
    price: json["price"] != null
        ? double.tryParse(json["price"].toString())
        : null,
    description: json["description"]?.toString(),
    category: json["category"]?.toString(),
    image: json["image"]?.toString(),
    // تمرير البيانات بشكل آمن لكلاس التقييم
    rating: json["rating"] == null
        ? null
        : Rating.fromJson(Map<dynamic, dynamic>.from(json["rating"])),
  );
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<dynamic, dynamic> json) => Rating(
    rate: json["rate"] != null
        ? double.tryParse(json["rate"].toString())
        : null,
    count: json["count"] != null
        ? int.tryParse(json["count"].toString())
        : null,
  );
}
