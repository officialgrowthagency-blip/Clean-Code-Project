import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_develop_project/core/features/skill_project/presentation/bloc/cubit.dart';
import 'package:skill_develop_project/core/features/skill_project/presentation/bloc/cubit_state.dart';
import 'package:skill_develop_project/core/features/skill_project/presentation/widgets/text_field.dart';

class AddPageScreen extends StatefulWidget {
  const AddPageScreen({super.key});

  @override
  State<AddPageScreen> createState() => _AddPageScreenState();
}

class _AddPageScreenState extends State<AddPageScreen> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _category = TextEditingController();
  final TextEditingController _image = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  bool isAddTaskProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task")),
      body: Form(
        key: _globalKey,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              TextFormFieldCustom(
                controller: _title, 
                helperText: 'title'
                ),
          
              const SizedBox(height: 20),
          
              TextFormFieldCustom(
                controller: _price, 
                helperText: 'Price'
                ),
          
              const SizedBox(height: 20),
          
              TextFormFieldCustom(
                controller: _description, 
                helperText: 'Description'
                ),
          
              const SizedBox(height: 20),
          
               TextFormFieldCustom(
                controller: _category, 
                helperText: 'Category'
                ),
          
              const SizedBox(height: 20),
          
               TextFormFieldCustom(
                controller: _image, 
                helperText: 'image'
                ),
          
              const SizedBox(height: 20),
          
              BlocConsumer<ProductCubit, CubitState>(
                listener: (context, state) {
                  if (state is ProductActionSuccess) {
                    Navigator.pop(context, true);
                  }
                },
          
                builder: (context, state) {
                  if (state is PostActionLoading) { // progress ঘুরছে নাহ
                   return const  Center(child: CircularProgressIndicator());
                  }
                  return ElevatedButton(
                    onPressed: () {
                      if(_globalKey.currentState!.validate()){
                        postServer(context);
                      }
                    },
                    child: Text("Add Task"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void postServer(BuildContext context) async {

    
    final requestInput = {
      "title": _title.text.trim(),
      "price": _price.text.trim(),
      "description": _description.text.trim(),
      "category": _category.text.trim(),
      "id": 0,
    };

    // isAddTaskProgress = true;

    context.read<ProductCubit>().addProduct(requestInput);
  }
}
