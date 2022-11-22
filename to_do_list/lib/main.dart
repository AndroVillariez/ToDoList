import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.teal),
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  Home createState() => Home();
}

class Home extends State<MyApp> {
  List task = [];
  String input = "";

  void initState() {
    super.initState();
    task.add("Exercise");
    task.add("Study");
    task.add("Walk the dog");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
        centerTitle: false,
        // backgroundColor: Colors.teal,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Add a task to your list"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    ElevatedButton(
                      child: const Text("ADD"),
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          task.add(input);
                        });
                      },
                    ),
                    ElevatedButton(
                        child: const Text("CANCEL"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })
                  ],
                );
              });
        },
        child: const Icon(Icons.add, color: Colors.white),
        // backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: task.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              key: ObjectKey(task[index]),
              onDismissed: (DismissDirection direction) {
                setState(() {
                  task.removeAt(index);
                });
              },
              child: Card(
                margin: const EdgeInsets.all(5),
                child: ListTile(
                  title: Text(task[index]),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red[400],
                    ),
                    onPressed: () {
                      setState(() {
                        task.removeAt(index);
                      });
                    },
                  ),
                ),
              ));
        },
      ),
    );
  }
}

//Andro Edsarev S. Villariez
