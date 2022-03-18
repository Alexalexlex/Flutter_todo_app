import 'package:flutter/material.dart';
import 'package:todo_app/widgets/card.dart';
import 'package:todo_app/widgets/homePage.dart';

void main() {
  runApp(Todo());
}

class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.w400),
          subtitle1: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w500),
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontFamily: 'Hind',
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('To-Do List'),
        ),
        body: Homepage(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
          },
          label: const Text('Create card'),
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
