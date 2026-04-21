import 'package:skill_develop_project/core/features/skill_project/data/datasources/remote_data_source.dart';
import 'package:skill_develop_project/core/features/skill_project/domain/entities/crud_entity.dart';
import 'package:skill_develop_project/core/features/skill_project/domain/repositories/repo.dart';

class CrudRepoImpl implements CrudRepositories{

  final RemoteDataSource remoteDataSource;
   CrudRepoImpl(this.remoteDataSource);

  @override
  Future<List<CrudEntity>> getCrud() async{
   try {
    final models = await remoteDataSource.getProduct();
      return models.map((s)=> CrudEntity(
       id: s.id,
       title: s.title,
       price: s.price,
       description: s.description,
       category: s.category,
       image: s.image,
       rating: s.rating != null ? 
       RatingEntity(rate: s.rating!.rate, count: s.rating!.count) : null

    

      )
      ).toList();

   }catch (e){
     throw Exception("Something Wrong CrudRepoImpl - $e");
   }
    
  }

  
}