import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_develop_project/core/features/skill_project/domain/entities/crud_entity.dart';
import 'package:skill_develop_project/core/features/skill_project/domain/usecases/product_use_case.dart';
import 'package:skill_develop_project/core/features/skill_project/presentation/bloc/cubit_state.dart';

class ProductCubit extends Cubit<CubitState> {

  GetProductUseCase getProductUseCase;
  
  ProductCubit(this.getProductUseCase) : super (CubitInitialState());

  Future<void> fetchProduct () async {
     
     emit(ListLoading());

     try {
       List<CrudEntity> product = await getProductUseCase.call();

        emit(LoadedList(product));

     } catch (e){
        emit(ErrorLoaded(e.toString()));
        
     }
  } 
  Future<void> addProduct (Map<String, dynamic> products) async {
     
     emit(PostActionLoading());

     try {
       final bool isSuccess = await getProductUseCase.postCall(products);

        if(isSuccess){

         emit(ProductActionSuccess());

         fetchProduct();

        } 
       

     } catch (e){
        emit(ErrorLoaded(e.toString()));
        
     }
  } 

   Future<void> deleteProduct (int id) async { // delete api
     
      try {
        final isSuccess = await getProductUseCase.deleteCall(id);

         if(isSuccess){
        

         fetchProduct(); 
         }

      } catch (e){
        throw Exception("Error Cubit State : ${e.toString()}");
      }
   }
    
  
}