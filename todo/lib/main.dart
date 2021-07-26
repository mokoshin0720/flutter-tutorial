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

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

// MyTodoAppから呼び出される
class _TodoListPageState extends State<TodoListPage> {
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("リスト一覧ページ"),
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(todoList[index]),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // "push"でTodoAddPageに遷移
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return TodoAddPage();
            }),
          );
          if (newListText != null) {
            setState(() {
              todoList.add(newListText);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

// TodoListPageから呼び出される
class _TodoAddPageState extends State<TodoAddPage> {
  String _text = ''; // 入力されたテキストをデータとして持つ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト追加ページ'),
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (String value) {
                setState(() {
                  _text = value;
                });
              },
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity, // 横幅いっぱい
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(_text); // 引数に指定することで、前の画面にデータを渡す
                },
                child: Text('リスト追加', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("キャンセル"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TodoAddPage extends StatefulWidget {
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}
