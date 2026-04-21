import 'dart:convert';
import 'package:skill_develop_project/core/features/skill_project/data/models/crud_models.dart';
import 'package:skill_develop_project/core/network/api_service.dart';

abstract class RemoteDataSource {
   Future<List<CrudModel>> getProduct();
 }

class RemoteDataSourceImpl implements RemoteDataSource {
   final ApiService apiService;
   RemoteDataSourceImpl(this.apiService);

  @override
  Future<List<CrudModel>> getProduct() async {
   
    final response = await apiService.getCrudApiData("products");

     if(response.statusCode == 200){
      
      final List<dynamic> data = jsonDecode(response.body);

       return data.map((item)=> CrudModel.fromJson(item)).toList();

     } else {
      throw Exception("Something Wrong Remote Data Source");

     }
  }
  
}