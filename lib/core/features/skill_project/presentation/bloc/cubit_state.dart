import 'package:equatable/equatable.dart';
import 'package:skill_develop_project/core/features/skill_project/domain/entities/crud_entity.dart';

abstract class CubitState extends Equatable {

   const CubitState();
}

class CubitInitialState extends CubitState {
  const CubitInitialState();
  
  @override
  List<Object?> get props => [];
  
}

 class ListLoading extends CubitState {
  const ListLoading();

  @override
  List<Object?> get props => [];
  
 }

 class PostActionLoading extends CubitState {
  @override
  
  List<Object?> get props => [];
  
 }

class LoadedList extends CubitState {

 final List<CrudEntity> post;

  const LoadedList(this.post);
  
  @override
  
  List<Object?> get props => [post];

}

 class ProductActionSuccess extends CubitState {

  @override
  List<Object?> get props => [];
  
 }



class ErrorLoaded extends CubitState {
 final String message;

  const ErrorLoaded(this.message);

     @override
     List<Object?> get props => [message];

}