import 'package:flutter/material.dart';
import 'package:tp/drawer.dart';
import 'package:tp/services/globalvars.dart';
import 'dart:math' as math;

class AlertDialogPage extends StatefulWidget {
  const AlertDialogPage({super.key});

  @override
  State<AlertDialogPage> createState() => _AlertDialogPageStruct();
}

class _AlertDialogPageStruct extends State<AlertDialogPage> {
  final String _title = "Sixth Page - Alert Dialogs";
  Color clr = Colors.red;
  final rnd = math.Random();

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
                Navigator.pushNamed(context, '/puzzle');
              },
              backgroundColor: const Color.fromARGB(223, 139, 139, 139),
              // child: const Icon(Icons.star),
              label: const Text('Retourner'),
              icon: const Icon(Icons.arrow_forward)),
          const Padding(padding: EdgeInsets.only(left: 5, right: 5)),
          // FloatingActionButton.extended(
          //     heroTag: "btn2",
          //     onPressed: () {
          //       // Navigator.push(
          //       //   context,
          //       //   MaterialPageRoute(builder: (context) => const HomePage()),
          //       // );
          //       Navigator.pushNamed(context, '/puzzle');
          //     },
          //     backgroundColor: const Color.fromARGB(223, 139, 139, 139),
          //     // child: const Icon(Icons.star),
          //     label: const Text('Next Page'),
          //     icon: const Icon(Icons.arrow_forward)),
        ]));
  }

  Widget _body() {
    return Center(
        child: Column(children: <Widget>[
      ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(monSnack("Main"));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(224, 158, 158, 158),
            shape: const StadiumBorder(),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Icon(Icons.lock_reset),
            Padding(padding: EdgeInsets.only(left: 3, right: 3)),
            Text("Show Snackbar")
          ])),
      ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => monAlert(context));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(224, 158, 158, 158),
            shape: const StadiumBorder(),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Icon(Icons.lock_reset),
            Padding(padding: EdgeInsets.only(left: 3, right: 3)),
            Text("Show AlertDialog")
          ]))
    ]));
  }

  SnackBar monSnack(message) {
    return SnackBar(
        elevation: 6.0,
        behavior: SnackBarBehavior.floating,
        content: Text(message),
        duration: const Duration(seconds: 5),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        backgroundColor: clr,
        action: SnackBarAction(
            label: "Close",
            onPressed: () =>
                {ScaffoldMessenger.of(context).hideCurrentSnackBar()}));
  }

  Color getRandomColor() => Color(rnd.nextInt(0xffffffff));

  AlertDialog monAlert(context) {
    return AlertDialog(
      title: Text("Alert"),
      content: Text("Changer SnackBar Color?"),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(monSnack("Annuler"));
            },
            child: Text("Annuler")),
        ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(monSnack("Supprimer"));
            },
            child: Text("Supprimer")),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              this.setState(() {
                clr = getRandomColor();
              });
              ScaffoldMessenger.of(context)
                  .showSnackBar(monSnack("Color successfuly changed!"));
            },
            child: Text("Confirmer"))
      ],
    );
  }
}
