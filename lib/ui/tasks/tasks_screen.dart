import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List _toDoList = [];
  var _taskFieldController = TextEditingController();
  var _lastTaskRemoved = Map<String, dynamic>();
  int _lastTaskRemovedPos;

  @override
  void initState() {
    super.initState();
    _loadData().then((data) {
      setState(() {
        _toDoList = json.decode(data);
      });
    });
  }

  void _addToDo() {
    var newToDo = Map<String, dynamic>();
    newToDo["title"] = _taskFieldController.text;
    newToDo["ok"] = false;
    _toDoList.add(newToDo);

    setState(() {
      _taskFieldController.text = "";
    });

    _saveData();
  }

  void _checkTask(check, index) {
    setState(() {
      _toDoList[index]["ok"] = check;
    });

    _saveData();
  }

  void _undoDelete() {
    setState(() {
      _toDoList.insert(_lastTaskRemovedPos, _lastTaskRemoved);
      _saveData();
    });
  }

  void _dismissTask(context, index) {
    setState(() {
      _lastTaskRemoved = Map.from(_toDoList[index]);
      _lastTaskRemovedPos = index;
      _toDoList.removeAt(index);
      _saveData();

      final snack = SnackBar(
        content: Text("Tarefa \"${_lastTaskRemoved["title"]}\" foi removida!"),
        action: SnackBarAction(
            label: "Desfazer",
            onPressed: _undoDelete),
        duration: Duration(seconds: 2),
      );

      Scaffold.of(context).showSnackBar(snack);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("tasks"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _taskFieldController,
                      decoration: InputDecoration(
                          labelText: "Nova tarefa",
                          labelStyle: TextStyle(color: Colors.blue)),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    child: Text("ADD"),
                    onPressed: _addToDo,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: 16),
                itemBuilder: _buildTasks,
                itemCount: _toDoList.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTasks(context, index) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        onChanged: (check) => _checkTask(check, index),
        secondary: CircleAvatar(
          child: Icon(_toDoList[index]["ok"] ? Icons.check : Icons.error),
        ),
        value: _toDoList[index]["ok"],
        title: Text(_toDoList[index]["title"]),
      ),
      onDismissed: (direction) => _dismissTask(context, index),

    );
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json ");
  }

  Future<File> _saveData() async {
    String data = json.encode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _loadData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
