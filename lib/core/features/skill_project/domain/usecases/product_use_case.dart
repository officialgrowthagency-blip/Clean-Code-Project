import 'package:skill_develop_project/core/features/skill_project/domain/entities/crud_entity.dart';
import 'package:skill_develop_project/core/features/skill_project/domain/repositories/repo.dart';

  class GetProductUseCase {
  final CrudRepositories repositories;
  GetProductUseCase(this.repositories);

  Future<List<CrudEntity>> call () async{

   return await repositories.getCrud();

  }

   Future<bool> postCall (Map<String, dynamic> products) async {
    return await repositories.postCrud(products);

   }

  
}