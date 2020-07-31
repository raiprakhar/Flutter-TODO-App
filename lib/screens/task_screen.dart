import 'package:flutter/material.dart';
import 'package:todoey/screens/add_tasks_screen.dart';
import 'package:todoey/widgets/task_list.dart';
import 'package:todoey/models/tasks_data.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                child: AddTaskScreen(),
              ),
            ),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 35, top: 60, bottom: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child:
                      Icon(Icons.list, size: 25, color: Colors.lightBlueAccent),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(height: 10),
                Text(
                  'Todoey',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 45,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  //(old version ) '${Provider.of<TaskData>(context).taskCount} Tasks',
                  '${context.watch<TaskData>().taskCount} Tasks',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TaskList(),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
