
import 'package:equatable/equatable.dart';

class RatingEntity extends Equatable {
  final double? rate;
  final int? count;

  const RatingEntity({this.rate, this.count});

  @override
  List<Object?> get props => [rate, count];
}

class CrudEntity extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final RatingEntity? rating;

  const CrudEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  @override
  List<Object?> get props => [id, title, price, description, category, image, rating];
}