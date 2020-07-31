import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks_data.dart';

String newTaskTitle;

//if we put this string inside the class it doesnt show up why???..
//maybe as in provide build method is called again n again and then newTaskTile may become null.
class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (taskTitle) {
                newTaskTitle = taskTitle;
              },
            ),
            SizedBox(height: 10),
            FlatButton(
              child: Text(
                'Add Task',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                //why listen false passed here??
                context.read<TaskData>().addTask(newTaskTitle);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
