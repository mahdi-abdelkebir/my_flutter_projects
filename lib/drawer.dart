import 'package:flutter/material.dart'; // biblioteque pour les interfaces graphique

class MyDrawer extends StatelessWidget {
  final routeTitle;
  const MyDrawer({super.key, this.routeTitle});

  // Root
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
              height: 100.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(routeTitle, style: TextStyle(fontSize: 20)),
              )),
          ListTile(
            title: const Text('Puzzle Page'),
            onTap: () {
              Navigator.pushNamed(context, '/puzzle');
            },
          ),
          ListTile(
            title: const Text('Carte Visite'),
            onTap: () {
              Navigator.pushNamed(context, '/cartevisite');
            },
          ),
          ListTile(
            title: const Text('Image/Icon Randomizer'),
            onTap: () {
              Navigator.pushNamed(context, '/randomizer');
            },
          ),
          ListTile(
              title: const Text('Article Form'),
              onTap: () {
                Navigator.pushNamed(context, '/form_article');
              }),
          ListTile(
              title: const Text('Smart Calculator'),
              onTap: () {
                Navigator.pushNamed(context, '/smart_calculator');
              }),
          ListTile(
              title: const Text('Alert Dialogs'),
              onTap: () {
                Navigator.pushNamed(context, '/alert_dialog');
              }),
        ],
      ),
    );
  }
}
