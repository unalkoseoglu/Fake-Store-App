import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'product_model.g.dart';

@JsonSerializable(createToJson: false)
class ProductModel extends INetworkModel<ProductModel?> {
  int? id;
  String? title;
  int? price;
  String? description;
  Category? category;
  List<String>? images;
  int? categoryId;
  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.images,
    this.categoryId,
  });

  @override
  @override
  fromJson(Map<String, dynamic> json) {
    return _$ProductModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return null;
  }
}

@JsonSerializable(createToJson: false)
class Category {
  int? id;
  String? name;
  String? image;

  Category({this.id, this.name, this.image});

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }
}
