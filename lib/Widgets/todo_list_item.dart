import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/models/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    //DateTime dataAtual = DateTime.now();
    return Slidable(
      actionPane: const SlidableBehindActionPane(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueAccent,
        ),

        //height: 60, --> não preciso mais porque é interessante que se autoajuste para evitar overflow.
        margin: const EdgeInsets.symmetric(
            vertical: 2), // é para espaçamento fora do container
        padding:
            const EdgeInsets.all(16), // é para espaçamento dentro do container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.notification_add_outlined),
                const SizedBox(
                  width: 97,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('dd/MMM/yyyy - EE - HH:mm')
                          .format(todo.dateTime),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      todo.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
