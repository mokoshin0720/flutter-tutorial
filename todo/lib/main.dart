import 'package:flutter/material.dart';

void main() {
  runApp(MyTodoApp());
}

// これが大元のクラス
class MyTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Todo App',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: TodoListPage(), // TodoListPageの呼び出し
    );
  }
}

// MyTodoAppから呼び出される
class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO"),
      ),
      body: Center(
        child: Text('リスト一覧'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // "push"でTodoAddPageに遷移
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return TodoAddPage();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// TodoListPageから呼び出される
class TodoAddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("リスト追加画面（クリックで戻る）"),
        ),
      ),
    );
  }
}
