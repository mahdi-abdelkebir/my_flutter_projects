import 'package:flutter/material.dart';
import 'package:tp/drawer.dart';
import 'package:tp/services/globalvars.dart';

class CarteVistePage extends StatefulWidget {
  const CarteVistePage({super.key});

  @override
  State<CarteVistePage> createState() => _CarteVistePageStruct();
}

class _CarteVistePageStruct extends State<CarteVistePage> {
  final String _title = "Third Page - Carte Visite";
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final telController = TextEditingController();

  @override
  void initState() {
    super.initState();

    emailController.text = GlobalVariables.email_;
    telController.text = GlobalVariables.tel_;
  }

  var _message;

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
                Navigator.pushNamed(context, '/');
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
                Navigator.pushNamed(context, '/randomizer');
              },
              backgroundColor: const Color.fromARGB(223, 139, 139, 139),
              // child: const Icon(Icons.star),
              label: const Text('Next Page'),
              icon: const Icon(Icons.arrow_forward)),
        ]));
  }

  Widget _body() {
    return Center(
        child: Column(children: <Widget>[
      Container(
          padding: const EdgeInsets.only(bottom: 20, top: 20),
          child: const Icon(Icons.face_outlined, size: 200)),
      Form(
          key: _formKey,
          child: Column(children: <Widget>[
            Container(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(children: const <Widget>[
                  Text("Mahdi Abdelkbir", style: TextStyle(fontSize: 20)),
                  Text("Etudiant", style: TextStyle(fontSize: 16)),
                ])),
            Container(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Column(children: [
                  TextFormField(
                      controller: emailController,
                      // use the validator to return an error string (or null) based on the input text
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        labelText: "Email",
                      )),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      controller: telController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (int.tryParse(value) == null) {
                          return 'Only numbers are allowed!';
                        }

                        return null;
                      },
                      // onChanged: (value) => setState(() => _tel = value),
                      decoration: const InputDecoration(
                        icon: Icon(Icons.phone),
                        labelText: "Numero de telephone",
                      ))
                ])),
            Container(
                margin: const EdgeInsets.only(top: 20),
                width: 140,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // call a server or save the information in a database.
                        GlobalVariables.email_ = emailController.text;
                        GlobalVariables.tel_ = telController.text;

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Successfully saved data.')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Failure.')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(224, 158, 158, 158),
                      shape: const StadiumBorder(),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.save),
                          Padding(padding: EdgeInsets.only(left: 3, right: 3)),
                          Text("Save")
                        ])))
          ]))
    ]));
  }
}
