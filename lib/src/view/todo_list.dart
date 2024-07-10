import 'package:apitutorials/src/viewmodel/todo_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todoController = Provider.of<TodoViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(child: Text('TODO LIST')),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          todoController.navigateToCreate();
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.amber[200],
      body: Column(
        children: [
          ListView.builder(
            itemCount: todoController.allTodos.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int i) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Material(
                  elevation: 4.0,
                  child: ListTile(
                    tileColor: Colors.white,
                    title:
                        Text(todoController.allTodos[i].todoTitle.toString()),
                    subtitle: Text(
                        todoController.allTodos[i].todoDescription.toString()),
                    trailing: PopupMenuButton<String>(
                      icon: Icon(Icons.more_vert),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        const PopupMenuItem(
                          value: 'edit',
                          child: Text('EDIT'),
                        ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Text('DELETE'),
                        ),
                      ],
                      onSelected: (String value) {
                        if (value == 'edit') {
                          todoController
                              .navigateToEdit(todoController.allTodos[i]);
                        }
                        if (value == 'delete') {
                          todoController.deleteTodo(
                            todoController.allTodos[i].sId.toString(),
                            i,
                          );
                        }
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
