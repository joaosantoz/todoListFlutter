import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Todo List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final newTodo = TextEditingController();
  List<String> todoList =["Tomar café", "Aprender flutter"];

  void addNewTodo() {
    if (newTodo.text != ''){
      setState(() {
        todoList.add(newTodo.text);
      });
      newTodo.text = '';
    }
  }

  void clearAllTodos() {
    setState(() {
      todoList.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    for (var todoItem in todoList)
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(10.0),
                        width: 300,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12, width: 2.0),
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.deepOrangeAccent,
                        ),
                          child: Text(
                            todoItem,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Container(
                width: 260,
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      labelText: "Digite seu todo aqui"
                    ),
                    controller: newTodo,
                  ),
              ),
            ),
        ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => clearAllTodos(),
            child: Icon(
                Icons.delete_outline,
            ),
          ),
          FloatingActionButton(
            onPressed: () => addNewTodo(),
            child: Icon(
                Icons.add
            ),
          ),
        ],
      )

    );
  }
}
