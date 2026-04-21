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
  
}