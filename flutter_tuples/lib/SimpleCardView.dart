import 'package:flutter/material.dart';
import 'package:flutter_tuples/Deck.dart';
import 'package:flutter_tuples/Card.dart';
import 'package:flutter_tuples/FlipCardPageDemo.dart';

class SimpleCardView extends StatefulWidget {
  @override
  State createState() => new SimpleCardViewState();
}

class SimpleCardViewState extends State<SimpleCardView> {
  static final deck = new Deck("simple");
  static final numCards = 12;
  late List<FlipCardPageDemo> _cardPages;

  @override
  void initState() {
    super.initState();
    _cardPages = new List<FlipCardPageDemo>.generate(
        numCards, (int index) => FlipCardPageDemo(deck.dealRandomCard()));
  }

  Widget build(BuildContext context) {
    //return new ListView(children: _data.map((item) => new ChildWidget(item)).toList());

    return new Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: new AssetImage("assets/wood-grain-textures.jpg"),
                fit: BoxFit.cover)),
        child: _cardPages[0],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          TuplesCard card = deck.dealRandomCard();
          _cardPages[0] = new FlipCardPageDemo(card);
          print(card.toString());
        }),
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  //static int testCount = 0;

  /*Future<ItemData> loadData() async {
    testCount++;
    return new ItemData("Testing #$testCount");
  }*/
}

class ChildWidget extends StatefulWidget {
  late ItemData _data;

  ChildWidget(ItemData data) {
    _data = data;
  }

  @override
  State<ChildWidget> createState() => new ChildState();
}

class ChildState extends State<ChildWidget> {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () => foo(),
        child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          child: new Card(
            child: new Container(
              padding: const EdgeInsets.all(8.0),
              child: new Text(widget._data.title),
            ),
          ),
        ));
  }

  foo() {
    print("Card Tapped: " + widget._data.toString());
  }
}

class ItemData {
  final String title;

  ItemData(this.title);

  @override
  String toString() {
    return 'ItemData{title: $title}';
  }
}
