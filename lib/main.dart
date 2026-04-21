import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_develop_project/core/features/skill_project/data/datasources/remote_data_source.dart';
import 'package:skill_develop_project/core/features/skill_project/data/repositories/crud_repo_impl.dart';
import 'package:skill_develop_project/core/features/skill_project/domain/usecases/product_use_case.dart';
import 'package:skill_develop_project/core/features/skill_project/presentation/bloc/cubit.dart';
import 'package:skill_develop_project/core/network/api_service.dart';
import 'package:skill_develop_project/my_app.dart';

    void main(){

      final service = ApiService();
      final dataSource = RemoteDataSourceImpl(service);
      final repository =  CrudRepoImpl(dataSource);
      final getProductUseCase = GetProductUseCase(repository);

      runApp(
        BlocProvider(create: (context)=>
         ProductCubit(getProductUseCase), 
         child: MyNewApp(),
        )
      );
    }