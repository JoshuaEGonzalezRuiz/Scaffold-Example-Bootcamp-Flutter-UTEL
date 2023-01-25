import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scaffold Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Scaffold Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home Page',
    ),
    Text(
      'Profile Page',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: drawerBody(),
      ),
      endDrawer: Drawer(
        child: scrollableDrawerBody(),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }

  Widget drawerBody() {
    return Column(
      children: [
        drawerHeader(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  onTap: () {
                    _onItemTapped(0);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Profile"),
                  onTap: () {
                    _onItemTapped(1);
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget scrollableDrawerBody() {
    return ListView(
      children: [
        drawerHeader(),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text("Home"),
          onTap: () {
            _onItemTapped(0);
          },
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text("Profile"),
          onTap: () {
            _onItemTapped(1);
          },
        )
      ],
    );
  }

  Widget drawerHeader() {
    return Container(
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
              padding: EdgeInsets.only(left: 12, top: 12, right: 12),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: FlutterLogo(
                  size: 30,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(top: 6, bottom: 6),
              child: ListTile(
                title: Text(
                  "Joshua Gonzalez",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                subtitle: Text("joshua.gonzalez@ucamp.utel.edu.mx",
                    style: TextStyle(fontSize: 12, color: Colors.white)),
              ))
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }
}
