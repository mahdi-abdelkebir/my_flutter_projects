import 'package:flutter/material.dart';
import 'package:tp/classes/Article.dart';
import 'package:tp/classes/Categories.dart';
import 'package:tp/classes/Etats.dart';
import 'package:tp/classes/TypeVentes.dart';
import 'package:tp/services/globalvars.dart';

class FormArticlePage extends StatefulWidget {
  const FormArticlePage({super.key});

  @override
  State<FormArticlePage> createState() => _FormArticlePageStruct();
}

class _FormArticlePageStruct extends State<FormArticlePage> {
  final _title = "Fifth Page - Ajouter Article";
  final _formKey = GlobalKey<FormState>();

  final codeController = TextEditingController();
  final libelleController = TextEditingController();
  final quantiteController = TextEditingController();
  var form_TypeVentes = createCheckbox(TypesVente);
  var category = form_Categorie.first;
  var typeVente = TypesVente.first;
  var etat = 0;
  var _dropdownError = null, _typeVenteError = null;
  // List<bool> categoryController = [true, false];
  // Map<String, bool> etatController = Map<String, bool>.from(Etats);
  // List<bool> typeVenteController = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text(_title)),
        body: _body(),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton.extended(
              heroTag: "btn1",
              onPressed: () {
                Navigator.pushNamed(context, '/randomizer');
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
                Navigator.pushNamed(context, '/smart_calculator');
              },
              backgroundColor: const Color.fromARGB(223, 139, 139, 139),
              // child: const Icon(Icons.star),
              label: const Text('Next Page'),
              icon: const Icon(Icons.arrow_forward)),
        ]));
  }

  Widget _body() {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Form(
          key: _formKey,
          child: Column(children: <Widget>[
            Container(
                padding: const EdgeInsets.only(top: 5, left: 25, right: 25),
                child: Column(children: [
                  TextFormField(
                      controller: codeController,
                      // use the validator to return an error string (or null) based on the input text
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.numbers),
                        labelText: "Code",
                      )),
                  TextFormField(
                      controller: libelleController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }

                        return null;
                      },
                      // onChanged: (value) => setState(() => _tel = value),
                      decoration: const InputDecoration(
                        icon: Icon(Icons.label),
                        labelText: "Libelle",
                      )),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      controller: quantiteController,
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
                        icon: Icon(Icons.add_box),
                        labelText: "Quantite",
                      )),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(textAlign: TextAlign.right, "Category:"),
                        DropdownButton<String>(
                          value: category,
                          icon: Icon(Icons.arrow_downward,
                              color: (_dropdownError == null
                                  ? Color.fromARGB(255, 3, 47, 84)
                                  : Color.fromARGB(255, 196, 68, 59))),
                          elevation: 16,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 3, 47, 84)),
                          underline: Container(
                              height: 1,
                              color: (_dropdownError == null
                                  ? Color.fromARGB(255, 3, 47, 84)
                                  : Colors.red)),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              category = value!;
                              _dropdownError = null;
                            });
                          },
                          items: form_Categorie.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )
                      ]),
                  _dropdownError == null
                      ? SizedBox.shrink()
                      : Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            _dropdownError ?? "",
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          )),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       Text(textAlign: TextAlign.left, "Type de vente:"),
                  //       DropdownButton<String>(
                  //         value: typeVente,
                  //         icon: const Icon(Icons.arrow_downward,
                  //             color: Color.fromARGB(255, 3, 47, 84)),
                  //         elevation: 16,
                  //         style: const TextStyle(
                  //             color: Color.fromARGB(255, 3, 47, 84)),
                  //         underline: Container(
                  //             height: 2, color: Color.fromARGB(255, 3, 47, 84)),
                  //         onChanged: (String? value) {
                  //           // This is called when the user selects an item.
                  //           setState(() {
                  //             typeVente = value!;
                  //           });
                  //         },
                  //         items: TypesVente.map<DropdownMenuItem<String>>(
                  //             (String value) {
                  //           return DropdownMenuItem<String>(
                  //             value: value,
                  //             child: Text(value),
                  //           );
                  //         }).toList(),
                  //       )
                  //     ]),

                  Container(
                      padding: EdgeInsets.only(top: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Type de vente:",
                        style: TextStyle(
                            color: Color.fromARGB(255, 117, 117, 117),
                            fontSize: 16),
                      )),
                  Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                          children: List.generate(
                              TypesVente.length,
                              (index) => CheckboxListTile(
                                    contentPadding: EdgeInsets.zero,
                                    side: BorderSide(
                                        color: (_typeVenteError == null
                                            ? Colors.black
                                            : Colors.red)),
                                    title: Text(TypesVente[index]),
                                    value: form_TypeVentes[index],
                                    onChanged: ((value) {
                                      setState(() {
                                        form_TypeVentes[index] = value;
                                        _typeVenteError = null;
                                      });
                                    }),
                                  )))),
                  _typeVenteError == null
                      ? SizedBox.shrink()
                      : Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            _typeVenteError ?? "",
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          )),

                  Container(
                      padding: EdgeInsets.only(top: 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Etat d'article:",
                        style: TextStyle(
                            color: Color.fromARGB(255, 117, 117, 117),
                            fontSize: 16),
                      )),
                  Column(
                      children: List.generate(
                          Etats.length,
                          (index) => ListTile(
                              title: Text(Etats[index]),
                              leading: Radio(
                                value: index,
                                groupValue: etat,
                                onChanged: ((value) {
                                  setState(() {
                                    etat = index;
                                  });
                                }),
                              )))),
                ])),
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            var categoryValidation =
                                category != form_Categorie.first;
                            var typeVenteValidation = false;
                            for (var i = 0; i < TypesVente.length; i++) {
                              if (form_TypeVentes[i] == true) {
                                typeVenteValidation = true;
                                break;
                              }
                            }

                            if (_formKey.currentState!.validate() &&
                                categoryValidation &&
                                typeVenteValidation) {
                              // call a server or save the information in a database.
                              // _formKey.currentState!();
                              GlobalVariables.articles.add(Article(
                                  codeController.text,
                                  libelleController.text,
                                  quantiteController.text,
                                  category,
                                  etat,
                                  typeVente));

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Successfully added article.')),
                              );
                            } else {
                              if (!typeVenteValidation) {
                                setState(() => _typeVenteError =
                                    "Veuillez à selectionner un type de vente!");
                              } else if (_typeVenteError != null) {
                                setState(() => _typeVenteError = null);
                              }

                              if (!categoryValidation) {
                                setState(() => _dropdownError =
                                    "Veuillez à selectionner un category!");
                              } else if (_dropdownError != null) {
                                setState(() => _dropdownError = null);
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Failure.')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(224, 158, 158, 158),
                            shape: const StadiumBorder(),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.save),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 3, right: 3)),
                                Text("Ajouter article")
                              ])),
                      ElevatedButton(
                          onPressed: () {
                            _formKey.currentState!.reset();
                            codeController.clear();
                            libelleController.clear();
                            quantiteController.clear();
                            setState(() {
                              category = form_Categorie.first;
                              _dropdownError = null;
                              _typeVenteError = null;
                            });

                            for (var i = 0; i < TypesVente.length; i++) {
                              form_TypeVentes[i] = false;
                              // if (form_TypeVentes[i] == true) {
                              // typeVenteValidation = true;
                              //   break;
                              // }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(224, 158, 158, 158),
                            shape: const StadiumBorder(),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.lock_reset),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 3, right: 3)),
                                Text("Réinitialiser")
                              ]))
                    ]))
          ]))
    ]));
  }
}
