import 'package:skill_develop_project/core/features/skill_project/data/models/crud_models.dart';
import 'package:skill_develop_project/core/network/api_service.dart';

abstract class RemoteDataSource {
   Future<List<CrudModel>> getProduct();

   Future<bool> postProduct(Map<String, dynamic> products);

    Future<bool>deleteProduct (int id);
 }

class RemoteDataSourceImpl implements RemoteDataSource {
   final ApiService apiService;
   RemoteDataSourceImpl(this.apiService);

  @override
  Future<List<CrudModel>> getProduct() async {
   
    final response = await apiService.getCrudApiData("products");

     if(response.isSuccess){
      
      final List<dynamic> data = response.responseData;

       return data.map((item)=> CrudModel.fromJson(item)).toList();

     } else {
      throw Exception("Something Wrong Remote Data Source");

     }
  }
     
    @override
      Future<bool> postProduct(Map<String, dynamic> products) async{

      final response = await apiService.postApiData("products", body: products);

       if(response.isSuccess){
        return true;
       }
       else {
        throw Exception("Failed to post data: ${response.errorMessage}");

       }
       
    }
    
      @override
      Future<bool> deleteProduct(int id) async{
        final response = await apiService.deleteProductApi(id);

         if(response.isSuccess){
           return true;
         } else {
          throw Exception("Failed to Delete data : ${response.errorMessage}" );
         }
      }
    
     
     
    
     
         
      

  
}