import 'package:skill_develop_project/core/features/skill_project/domain/entities/crud_entity.dart';

abstract class CrudRepositories {
  Future<List<CrudEntity>> getCrud();
  
}
