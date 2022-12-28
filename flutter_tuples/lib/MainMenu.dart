import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  MainMenu({Key? key, this.title = "page"}) : super(key: key);
  final String title;

  @override
  _MainMenuViewState createState() => _MainMenuViewState();
}

class _MainMenuViewState extends State<MainMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(color: Colors.white30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[Text("datax")],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[Text("data2")],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[Text("data5")],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => setState(() {
          // List<TuplesCard> selectedCards = deck.getSelectedCards();
          // validSet = deck.isValidSet(selectedCards);

          /*for(TuplesCard t in selectedCards) {
            print(t.toString());
          }
          print(validSet.toString());*/
        }),
        label: Text('SET?', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
