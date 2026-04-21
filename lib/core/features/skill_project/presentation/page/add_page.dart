import 'package:flutter/material.dart';

class AddPageScreen extends StatefulWidget {
  const AddPageScreen({super.key});

  @override
  State<AddPageScreen> createState() => _AddPageScreenState();
}

class _AddPageScreenState extends State<AddPageScreen> {





  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
      ),
      body: Column(

        children: [

          TextFormField(
           //controller: ,
           decoration: InputDecoration(
           helperText: "Product Name",
           border: OutlineInputBorder()
           ),
          ),

          const SizedBox(height: 20),

          TextFormField(
            decoration: InputDecoration(
           border: OutlineInputBorder()
           ),
          ),

          const SizedBox(height: 20),

          TextFormField(),
            
          const SizedBox(height: 20),

          ElevatedButton(onPressed: () {}, child: Text("Add Task"))
        ],
      ),
    );
  }
}