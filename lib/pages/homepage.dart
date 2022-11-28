import 'package:flutter/material.dart';
import 'package:tp/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageStruct();
}

class _HomePageStruct extends State<HomePage> {
  bool _visiblity = false;
  final String _title = "My first app";

  void _changeVisibility() {
    setState(() {
      _visiblity = !_visiblity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      drawer: MyDrawer(routeTitle: _title),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const PuzzlePage()),
                            // );
                            Navigator.pushNamed(context, '/puzzle');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(224, 158, 158, 158),
                            padding: EdgeInsets.zero,
                            shape: const StadiumBorder(),
                          ),
                          child: const Icon(Icons.keyboard_arrow_left)),
                      const Spacer(),
                      if (_visiblity == true)
                        const Text("Comment allez vous procéder?"),
                      const Spacer(),
                      ElevatedButton(
                          // onPressed: null,
                          onPressed: () {
                            Navigator.pushNamed(context, '/cartevisite');
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor:
                                const Color.fromARGB(224, 158, 158, 158),
                            shape: const StadiumBorder(),
                          ),
                          child: const Icon(Icons.keyboard_arrow_right))
                    ]))
          ])),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _changeVisibility();
          },
          backgroundColor: Colors.green,
          // child: const Icon(Icons.star),
          label: const Text('Question'),
          icon: const Icon(Icons.question_mark)),
    );
  }
}
