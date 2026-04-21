import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_develop_project/core/features/skill_project/presentation/bloc/cubit.dart';
import 'package:skill_develop_project/core/features/skill_project/presentation/bloc/cubit_state.dart';
import 'package:skill_develop_project/core/features/skill_project/presentation/page/add_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchProduct();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.blue[400],
        centerTitle: true,
      ),
      body: BlocBuilder<ProductCubit, CubitState> (
        builder: (context, state){
       
        if(state is ListLoading){
          return Center(child: CircularProgressIndicator(),
          );
        }
         else if(state is LoadedList){
        return ListView.builder(
        itemCount: state.post.length,
        itemBuilder: (_, index){
         final item = state.post[index];
        return ListTile(
          title: Text(item.title.toString()),
          subtitle: Text(item.price.toString()),
          
        );
      });

         }
          else if(state is ErrorLoaded){
            return Center(child: Text(state.message));
          }

          return SizedBox(); 
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, 
          MaterialPageRoute(builder: (context)=> const AddPageScreen()));
        }, 
        child: Text("Add"),
      ),
    );
  }
}