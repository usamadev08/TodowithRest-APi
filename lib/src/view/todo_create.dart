import 'package:apitutorials/src/viewmodel/todo_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class TodoCreate extends StatefulWidget {
  const TodoCreate({super.key});

  @override
  State<TodoCreate> createState() => _TodoCreateState();
}

class _TodoCreateState extends State<TodoCreate> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final todoController = Provider.of<TodoViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Text('TODO LIST')),
      ),
      backgroundColor: Colors.amber[200],
      body: Form(
        key: formkey,
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: 400,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: todoController.titlecontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Feild';
                      } else {
                        return null;
                      }
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: 'Enter Title',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: 400,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    controller: todoController.descriptioncontroller,
                    minLines: 3,
                    maxLines: 5,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required Feild';
                      } else {
                        return null;
                      }
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      hintText: 'Enter Description',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      todoController.createTodo();
                    }
                  },
                  child: Container(
                    width: 200,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
