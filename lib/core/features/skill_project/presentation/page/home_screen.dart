// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_develop_project/core/features/skill_project/presentation/bloc/cubit.dart';
import 'package:skill_develop_project/core/features/skill_project/presentation/bloc/cubit_state.dart';
import 'package:skill_develop_project/core/features/skill_project/presentation/page/add_page.dart';
import 'package:skill_develop_project/core/features/skill_project/presentation/page/product_list_view.dart';

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
      body: BlocBuilder<ProductCubit, CubitState>(
        builder: (context, state) {
          if (state is ListLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LoadedList) {
            return ListView.builder(
              itemCount: state.post.length,
              itemBuilder: (_, index) {
                final item = state.post[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=> ProductListView(product: item,))); 
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(item.title.toString()),
                      subtitle: Text(item.price.toString()),

                       trailing: IconButton(onPressed: () {
                      

                        context.read<ProductCubit>().deleteProduct(item.id!);


                       }, 
                       icon: Icon(Icons.delete), color: Colors.red,),

                    ),
                  ),
                );
              },
            );
          } else if (state is ErrorLoaded) {
            return Center(
              child: Column(
                children: [
                  Text(state.message),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: context.read<ProductCubit>().fetchProduct,
                    child: Text("Retry"),
                  ),
                ],
              ),
            );
          }

          return Center(child: Text("No Data Available"));
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPageScreen()),
          );
           if(!mounted) return;
           
           if(result == true){
             context.read<ProductCubit>().fetchProduct();
           }
        },
        child: Text("Add"),
      ),
    );
  }

 
}
