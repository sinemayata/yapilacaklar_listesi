




// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Yapılacaklar Listesi',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: TodoListScreen(),
//     );
//   }
  
// }

// class TodoListScreen extends StatefulWidget {
//   @override
//   _TodoListScreenState createState() => _TodoListScreenState();
// }

// class _TodoListScreenState extends State<TodoListScreen> {
  
//   List<String> _todoList = [];

  
//   TextEditingController _controller = TextEditingController();

  
//   void _addTodo() {
//     setState(() {
//       if (_controller.text.isNotEmpty) {
//         _todoList.add(_controller.text); 
//         _controller.clear(); 
//       }
//     });
//   }

  
//   void _removeTodo(int index) {
//     setState(() {
//       _todoList.removeAt(index); 
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Yapılacaklar Listesi'),
//       ),
//       backgroundColor: const Color.fromARGB(255, 190, 214, 226),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: <Widget>[
//             //Yeni yapılacak öğesi eklemek için bir TextField
//             TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 labelText: ' Yapilacaklar',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 10),
//            // Yapılacak öğeyi eklemek için buton
//             ElevatedButton(
//               onPressed: _addTodo,
//               child: Text('Ekle'),
//             ),
//             SizedBox(height: 30),
//           
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _todoList.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(_todoList[index]),
//                     trailing: IconButton(
//                       icon: Icon(Icons.delete),
//                       onPressed: () => _removeTodo(index), // Silme işlemi
//                     ),
                    
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yapılacaklar Listesi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
 
  List<Map<String, dynamic>>_todoList = [];


  TextEditingController _controller = TextEditingController();


  void _addTodo() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _todoList.add({
          'task': _controller.text,
          'completed': false, 
        });
        _controller.clear();
      }
    });
  }


  void _removeTodo(int index) {
    setState(() {
      _todoList.removeAt(index);
    });
  }

  
  void _toggleCompletion(int index) {
    setState(() {
      _todoList[index]['completed'] = !_todoList[index]['completed'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yapılacaklar Listesi'),
      ),
      backgroundColor: const Color.fromARGB(255, 238, 192, 226),
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          children: <Widget>[
          
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Yapılacaklar',
                border: OutlineInputBorder(),
                
              ),
            ),
            SizedBox(height: 35),
            SizedBox(width: 60),
            ElevatedButton(
              onPressed: _addTodo,
              child: Text('Ekle'),
            ),
            SizedBox(height: 70),
            SizedBox(width: 100,),
            Expanded(
              child: ListView.builder(
              
                itemCount: _todoList.length,
                itemBuilder: (context, index) {
                  final todo = _todoList[index];
                  return ListTile(
                  
                    leading: Checkbox(
                      value: todo['completed'],
                      onChanged: (value) {
                       
                        _toggleCompletion(index);
                      },
                    ),
                    
                    title: Text(
                      todo['task'],
                      style: TextStyle(
                        fontSize: (20),
                        decoration: todo['completed']
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete_forever_rounded),
                      onPressed: () => _removeTodo(index), 
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}





