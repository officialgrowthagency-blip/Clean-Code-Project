import 'package:flutter/material.dart';
import 'package:skill_develop_project/core/features/skill_project/domain/entities/crud_entity.dart';

class ProductListView extends StatelessWidget {

   final CrudEntity product ; // প্যারামিটার এটা
  const ProductListView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title ?? ''),),
    );
  }
}