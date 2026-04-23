class CrudModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  CrudModel(
      {
      this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating
    });

  CrudModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    title = json['title'] as String;
    price = (json['price'] as num).toDouble();
    description = json['description'] as String;
    category = json['category']as String;
    image = json['image'] as String;
    rating =
        json['rating'] != null ?  Rating.fromJson(json['rating']) : null;
  }

  
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

     factory Rating.fromJson(Map<String, dynamic> json) {
      return Rating(
      
      rate: (json['rate'] as num).toDouble(),
      count: json['count'] as int,
    );
  }

}
