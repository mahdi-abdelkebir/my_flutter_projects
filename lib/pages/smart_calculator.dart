import 'package:flutter/material.dart';
import 'package:tp/classes/Article.dart';
import 'package:tp/classes/Categories.dart';
import 'package:tp/classes/Etats.dart';
import 'package:tp/classes/TypeVentes.dart';
import 'package:tp/drawer.dart';
import 'package:tp/services/globalvars.dart';

class SmartCalculatorPage extends StatefulWidget {
  const SmartCalculatorPage({super.key});

  @override
  State<SmartCalculatorPage> createState() => _SmartCalculatorPageStruct();
}

class _SmartCalculatorPageStruct extends State<SmartCalculatorPage> {
  final _title = "Sixth Page - Smart Calculator";
  final _formKey = GlobalKey<FormState>();
  double resultat = 0;
  double montant = 0;
  double diviser = 1;
  double frais = 20;

  void calculate() {
    resultat = ((montant + frais) / diviser);
  }

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
              heroTag: "btn1",
              onPressed: () {
                Navigator.pushNamed(context, '/form_article');
              },
              backgroundColor: const Color.fromARGB(223, 139, 139, 139),
              // child: const Icon(Icons.star),
              label: const Text('Retourner'),
              icon: const Icon(Icons.arrow_back)),
          // const Padding(padding: EdgeInsets.only(left: 5, right: 5)),
          // FloatingActionButton.extended(
          //     heroTag: "btn2",
          //     onPressed: () {
          //       // Navigator.push(
          //       //   context,
          //       //   MaterialPageRoute(builder: (context) => const HomePage()),
          //       // );
          //       // Navigator.pushNamed(context, '/randomizer');
          //     },
          //     backgroundColor: const Color.fromARGB(223, 139, 139, 139),
          //     // child: const Icon(Icons.star),
          //     label: const Text('Next Page'),
          //     icon: const Icon(Icons.arrow_forward)),
        ]));
  }

  Widget _body() {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.only(top: 50, bottom: 50),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 198, 194),
              borderRadius: BorderRadius.circular(20)),
          alignment: Alignment.center,
          child: Column(
            children: [
              const Text("Montant total par personne",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(resultat.toStringAsFixed(3),
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))
            ],
          )),
      Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          padding: EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black)),
          child: Column(children: [
            TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.isEmpty) {
                    montant = 0;
                  } else {
                    montant = double.parse(value);
                  }
                  calculate();
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.numbers),
                  labelText: "Montant Commande",
                )),
            Padding(padding: EdgeInsets.only(top: 30)),
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Text("Diviser: "),
                  Row(children: [
                    Container(
                        width: 50,
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 255, 198, 194))),
                            onPressed: () {
                              if (diviser > 1) {
                                setState(() {
                                  diviser--;
                                });

                                calculate();
                              }
                            },
                            child: Icon(Icons.remove, color: Colors.black))),
                    Container(
                        alignment: Alignment.center,
                        width: 50,
                        child: Text(diviser.toInt().toString())),
                    Container(
                        width: 50,
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 255, 198, 194))),
                            onPressed: () {
                              setState(() {
                                if (diviser < 15) {
                                  setState(() {
                                    diviser++;
                                  });

                                  calculate();
                                }
                              });

                              calculate();
                            },
                            child: Icon(Icons.add, color: Colors.black)))
                  ])
                ])),
            Padding(padding: EdgeInsets.only(top: 30)),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("Frais: "), Text(frais.toString())]),
            // Expanded(
            //     child:
            Padding(padding: EdgeInsets.only(top: 20)),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('${frais}%',
                  style: TextStyle(color: Colors.grey, fontSize: 13)),
              Slider(
                  value: frais,
                  min: 0,
                  max: 100,
                  divisions: 5,
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  onChanged: (double newValue) {
                    setState(() {
                      frais = newValue;
                    });

                    calculate();
                  },
                  semanticFormatterCallback: (double newValue) {
                    return '$newValue';
                  })
            ])
            // )
          ]))
    ]));
  }
}
