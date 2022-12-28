import 'package:flutter/material.dart';
import 'package:flutter_tuples/Deck.dart';
import 'package:flutter_tuples/Card.dart';
import 'package:flutter_tuples/FlipCardPage.dart';

class FlutterGameView extends StatefulWidget {
  FlutterGameView({Key? key, this.title = "page"}) : super(key: key);
  final String title;

  @override
  _FlutterGameViewState createState() => _FlutterGameViewState();
}

class _FlutterGameViewState extends State<FlutterGameView> {
  static final deck = new Deck("simple");
  static final numCards = 12;
  late List<FlipCardPage> _cardPages;
  var validSet = false;
  var status = "test";

  @override
  void initState() {
    _cardPages = new List<FlipCardPage>.generate(
        numCards, (int index) => FlipCardPage(deck.dealRandomCard()));
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
              children: <Widget>[
                _cardPages[0],
                _cardPages[1],
                _cardPages[2],
                _cardPages[3],
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _cardPages[4],
                _cardPages[5],
                _cardPages[6],
                _cardPages[7],
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _cardPages[8],
                _cardPages[9],
                _cardPages[10],
                _cardPages[11],
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => setState(() {
          List<TuplesCard> selectedCards = deck.getSelectedCards();
          validSet = deck.isValidSet(selectedCards);

          /*for(TuplesCard t in selectedCards) {
            print(t.toString());
          }
          print(validSet.toString());*/
        }),
        label: validSet
            ? Text('EUREKA', style: TextStyle(color: Colors.black))
            : Text('SET?', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellow,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
