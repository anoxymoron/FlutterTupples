import 'package:flutter/material.dart';
import 'package:flutter_tuples/Card.dart';
import 'dart:math';

class FlipCardPage extends StatefulWidget {
  final String title;
  final TuplesCard card;

  FlipCardPage(this.card, {Key? key, this.title = "page"}) : super(key: key);

  @override
  _FlipCardState createState() => _FlipCardState(card);
}

class _FlipCardState extends State<FlipCardPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _flipAnimationController;
  late Animation _flipAnimation;
  TuplesCard card;

  _FlipCardState(this.card);

  void setCardState(TuplesCard card) {
    setState(() => this.card = card);
  }

  @override
  void initState() {
    super.initState();
    _flipAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _flipAnimation =
        Tween(end: 1.0, begin: 0.0).animate(_flipAnimationController)
          ..addListener(() {
            setState(() {});
          });

    _flipAnimationController.forward();
  }

  @override
  void dispose() {
    _flipAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    this.card = widget.card;

    return Container(
      color: Colors.transparent,
      child: Center(
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateY(pi * _flipAnimation.value),
          child: GestureDetector(
            onTap: () {
              setState(() {
                card.toggleCardSelection();
              });
            },
            child: _flipAnimation.value <= 0.5
                ? buildBlankCardContainer()
                : buildCardContainer(card),
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildBlankCardContainer() {
    return AnimatedContainer(
        duration: Duration(seconds: 1),
        decoration: BoxDecoration(
          color: _generateColor(Colors.blueGrey),
          border: Border.all(
            color: card.selected ? Colors.red : Colors.white,
            width: 4,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        width: 90,
        height: 120);
  }

  AnimatedContainer buildCardContainer(TuplesCard card) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      decoration: BoxDecoration(
        color: _generateColor(card.color),
        border: Border.all(
          color: card.selected ? Colors.red : Colors.white,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      width: 90,
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _createCardIcons(),
      ),
    );
  }

  List<Widget> _createCardIcons() {
    return new List<Widget>.generate(card.number, (int index) {
      return _generateIcon(card.shape, card.fill);
    });
  }

  Color _generateColor(var color) {
    switch (color) {
      case 0:
        return Colors.grey;
      case 1:
        return Colors.deepPurple;
      case 2:
        return Colors.green;
      case 3:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  Icon _generateIcon(var shape, var fill) {
    return Icon(
      _generateIconShape(shape),
      color: _generateIconFill(fill),
      size: 25,
    );
  }

  Color _generateIconFill(var fill) {
    switch (fill) {
      case 0:
        return Colors.black;
      case 1:
        return Colors.black;
      case 2:
        return Colors.white;
      case 3:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _generateIconShape(var shape) {
    switch (shape) {
      case 0:
        return Icons.api_rounded;
      case 1:
        return Icons.waves;
      case 2:
        return Icons.architecture_rounded;
      case 3:
        return Icons.all_inclusive_rounded;
      default:
        return Icons.error_outline_rounded;
    }
  }
}
