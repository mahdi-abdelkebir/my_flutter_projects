import 'package:flutter/material.dart';
import 'package:tp/drawer.dart';

class PuzzlePage extends StatefulWidget {
  const PuzzlePage({super.key});

  @override
  State<PuzzlePage> createState() => _PuzzlePageStruct();
}

class _PuzzlePageStruct extends State<PuzzlePage> {
  final String _title = "Second Page - Puzzle";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(routeTitle: _title),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text(_title)),
        body: _body(),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton.extended(
              heroTag: "btn2",
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const HomePage()),
                // );
                Navigator.pushNamed(context, '/alert_dialog');
              },
              backgroundColor: const Color.fromARGB(223, 139, 139, 139),
              // child: const Icon(Icons.star),
              label: const Text('Next Page'),
              icon: const Icon(Icons.arrow_back)),
          const Padding(padding: EdgeInsets.only(left: 5, right: 5)),
          FloatingActionButton.extended(
              heroTag: "btn1",
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              backgroundColor: const Color.fromARGB(223, 139, 139, 139),
              // child: const Icon(Icons.star),
              label: const Text('Retourner'),
              icon: const Icon(Icons.arrow_forward)),
        ]));
  }

  Widget _body() {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
      Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
                height: 100,
                color: Colors.red,
                child: const Center(
                    child: Text("1",
                        style: TextStyle(fontSize: 30, color: Colors.white)))),
          ),
          Expanded(
            flex: 1,
            child: Container(
                height: 100,
                width: 100,
                color: Colors.orange,
                child: const Center(
                    child: Text("2",
                        style: TextStyle(fontSize: 30, color: Colors.white)))),
          )
        ],
      ),
      Row(children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
              height: 200,
              color: Colors.green,
              child: const Center(
                  child: Text("3",
                      style: TextStyle(fontSize: 30, color: Colors.white)))),
        ),
        Expanded(
            flex: 2,
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                        height: 100,
                        color: Colors.purple,
                        child: const Center(
                            child: Text("4",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white)))),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        height: 100,
                        color: Colors.orange,
                        child: const Center(
                            child: Text("5",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.white)))),
                  )
                ],
              ),
              Container(
                  height: 100,
                  color: Colors.blue,
                  child: const Center(
                      child: Text("6",
                          style:
                              TextStyle(fontSize: 30, color: Colors.white)))),
            ]))
      ])
    ]));
  }
}
