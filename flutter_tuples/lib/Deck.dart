import "package:flutter_tuples/Card.dart";
import 'dart:math';

import 'Card.dart';

class Deck {
  var availableCards = <TuplesCard>[];
  var visibleCards = <TuplesCard>[];
  var removedCards = <TuplesCard>[];
  var selectedCards = <TuplesCard>[];

  Deck(var type) {
    if (type == "simple")
      generateSimpleDeck();
    else if (type == "complex") generateComplexDeck();
  }

  void generateSimpleDeck() {
    for (var num = 1; num < 4; num++)
      for (var color = 1; color < 4; color++)
        for (var shape = 1; shape < 4; shape++)
          for (var fill = 1; fill < 4; fill++)
            availableCards.add(TuplesCard(num, color, shape, fill));
  }

  void generateComplexDeck() {
    for (var num = 0; num < 4; num++)
      for (var color = 0; color < 4; color++)
        for (var shape = 0; shape < 4; shape++)
          for (var fill = 0; fill < 4; fill++)
            availableCards.add(TuplesCard(num, color, shape, fill));
  }

  TuplesCard dealRandomCard() {
    if (availableCards.length > 0) {
      var index = Random().nextInt(availableCards.length);
      TuplesCard dealtCard = availableCards[index];
      visibleCards.add(dealtCard);
      availableCards.removeAt(index);

      return dealtCard;
    } else {
      throw Exception("no cards remaining");
    }
  }

  List<TuplesCard> getSelectedCards() {
    selectedCards.clear();

    for (TuplesCard card in visibleCards) {
      if (card.selected) {
        selectedCards.add(card);
      }
    }

    return selectedCards;
  }

  bool isValidSet(List<TuplesCard> cards) {
    if (cards.length == 3) {
      return cards[2] == TuplesCard.matchingCard(cards[0], cards[1])
          ? true
          : false;
    } else if (cards.length == 4) {
      return cards[3] == TuplesCard.matchingCard(cards[0], cards[1], cards[2])
          ? true
          : false;
    } else {
      return false;
    }
  }
}
