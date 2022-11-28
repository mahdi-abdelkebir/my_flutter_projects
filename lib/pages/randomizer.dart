import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tp/drawer.dart';
import '../services/globalvars.dart';

class RandomizerPage extends StatefulWidget {
  const RandomizerPage({super.key});

  final String title = "Duplicate Picture";

  @override
  State<RandomizerPage> createState() => _MyRandomizerState();
}

class _MyRandomizerState extends State<RandomizerPage> {
  int _img_id = 1;

  // int _color_n = 0;
  // List<Color> colors = [Colors.red, Colors.blue];

  // var _color;

  Icon randomIcon() {
    getHex() {
      return 0xe0b0 + Random().nextInt(1000);
    }

    return Icon(IconData(getHex(), fontFamily: 'MaterialIcons'));
  }

  var icon;

  void _save_img() {
    GlobalVariables.saved_imgs.add(_img_id);
  }

  // void _color_cycle() {
  //   setState(() {
  //     _color_n++;
  //   });
  // }

  // void _randomize_color() {
  //   int random(int min, int max) {
  //     return min + Random().nextInt(max - min);
  //   }

  //   setState(() {
  //     _color =
  //         Color.fromRGBO(random(0, 255), random(0, 255), random(0, 255), 1);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    icon = randomIcon();
    return Scaffold(
        drawer: MyDrawer(routeTitle: widget.title),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text(widget.title)),
        body: _body(),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton.extended(
              heroTag: "btn1",
              onPressed: () {
                Navigator.pushNamed(context, '/cartevisite');
              },
              backgroundColor: const Color.fromARGB(223, 139, 139, 139),
              // child: const Icon(Icons.star),
              label: const Text('Retourner'),
              icon: const Icon(Icons.arrow_back)),
          const Padding(padding: EdgeInsets.only(left: 5, right: 5)),
          FloatingActionButton.extended(
              heroTag: "btn2",
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const HomePage()),
                // );
                Navigator.pushNamed(context, '/form_article');
              },
              backgroundColor: const Color.fromARGB(223, 139, 139, 139),
              // child: const Icon(Icons.star),
              label: const Text('Next Page'),
              icon: const Icon(Icons.arrow_forward)),
        ]));
  }

  Widget _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 200,
              height: 200,
              // the more you increase this, the higher it'll get
              margin: const EdgeInsets.only(bottom: 50),
              child: CircleAvatar(
                  radius: 110,
                  // backgroundColor: _color
                  // colors[_color_n % 2],
                  backgroundImage: NetworkImage(
                      'https://picsum.photos/id/$_img_id/200/200'))),
          Text(
            '$_img_id',
            style: Theme.of(context).textTheme.headline4,
          ),
          Container(
              margin: const EdgeInsets.only(top: 50),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton.icon(
                    onPressed: () => {
                          setState(() {
                            icon = randomIcon();
                            _img_id++;
                          })
                        },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(223, 170, 173, 13),
                      padding: EdgeInsets.only(right: 10, left: 10),
                      shape: const StadiumBorder(),
                    ),
                    icon: icon, //icon da
                    label: Text("Randomize")),
                Padding(padding: const EdgeInsets.only(right: 5, left: 5.0)),
                ElevatedButton.icon(
                    onPressed: _save_img,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(223, 74, 138, 241),
                      padding: EdgeInsets.only(right: 10, left: 10),
                      shape: const StadiumBorder(),
                    ),
                    icon: Icon(Icons.save), //icon da
                    label: Text(
                        "Save Image ID") //label text ta for elevated button
                    )
                // child: const Text("Save Image ID")),
              ]))
        ],
      ),
    );
  }
}
