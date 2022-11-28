import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Avatar
            Container(
              width: 200,
              height: 200,
              // the more you increase this, the higher it'll get
              margin: const EdgeInsets.only(bottom: 50),
              child: const CircleAvatar(
                  radius: 110,
                  backgroundImage:
                      NetworkImage("https://picsum.photos/200/200")),
            ),
            // Information
            Column(children: const [
              Text(
                "Yasmine Hamouda",
                style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.white,
                ),
              ),
              Text("Android Developper",
                  style: TextStyle(
                      fontSize: 18.0, color: Colors.white, letterSpacing: 2.5)),
            ]),
            // Divider
            const SizedBox(
              height: 19.0,
              width: 160.0,
              child: Divider(
                color: Colors.white,
              ),
            ),
            // Cards
            Column(children: [
              Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 20.0),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.phone,
                        color: Colors.purple,
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        "+216 501770027",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 20.0),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.email,
                        color: Colors.purple,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "hamoudayasmine15@gmail.com",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 20.0),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.location_city,
                        color: Colors.purple,
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        "Mahdia",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      )));
}
