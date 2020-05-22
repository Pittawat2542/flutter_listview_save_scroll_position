import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  Widget _buildScreen(int currentIndex) {
    List<List<String>> items = [];
    for (int i=0; i < 3; i++) {
      items.add([]);
      for (int j=0+(i*100); j < 100 + (i*100); j++) {
        items[i].add('${j+1}');
      }
    }

    return Container(
      key: Key(_currentIndex.toString()),
      child: ListView.builder(
        key: PageStorageKey(currentIndex),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[currentIndex][index].toString()),
          );
        },
        itemCount: items[currentIndex].length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildScreen(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.tab),
              icon: Icon(Icons.tab_unselected),
              title: Text('Tab 1')),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.tab),
            icon: Icon(Icons.tab_unselected),
            title: Text('Tab 2'),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.tab),
            icon: Icon(Icons.tab_unselected),
            title: Text('Tab 3'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
