import 'dart:math';

/* last modified - 10/21/2020


 */
class TuplesCard {
  var number;
  var color;
  var shape;
  var fill;
  var selected = false;

  TuplesCard(this.number, this.color, this.shape, this.fill);

  // construct random standard card (no params)
  TuplesCard.randomCard(String type) {
    // parameter values are a random number 0-3 (if complex) or 1-3 (if not complex)
    if (type == "complex") {
      this.number = Random().nextInt(4);
      this.color = Random().nextInt(4);
      this.shape = Random().nextInt(4);
      this.fill = Random().nextInt(4);
    } else {
      this.number = Random().nextInt(3) + 1;
      this.color = Random().nextInt(3) + 1;
      this.shape = Random().nextInt(3) + 1;
      this.fill = Random().nextInt(3) + 1;
    }
  }

  // construct final card in a set (first, second, and optionally third (in four card sets) cards are known)
  TuplesCard.matchingCard(TuplesCard first, TuplesCard second,
      [TuplesCard? third]) {
    // if the first, second, and third values are the same, the fourth will be the same
    // otherwise (slightly fancy), xor the first/second/third to find the fourth
    if (third == null) {
      this.number = findLastValue(first.number, second.number);
      this.color = findLastValue(first.color, second.color);
      this.shape = findLastValue(first.shape, second.shape);
      this.fill = findLastValue(first.fill, second.fill);
    } else {
      this.number = findLastValue(first.number, second.number, third.number);
      this.color = findLastValue(first.color, second.color, third.color);
      this.shape = findLastValue(first.shape, second.shape, third.shape);
      this.fill = findLastValue(first.fill, second.fill, third.fill);
    }
  }

  int findLastValue(var first, var second, [var third]) {
    // being slightly fancy - if the known two (or three) values are the same, the last value will match.
    // if not, xor-ing the known values will produce the correct last value
    if (third == null) {
      return first == second ? first : first ^ second;
    } else {
      return (first == second) && (first == third)
          ? first
          : (first ^ second ^ third);
    }
  }

  void toggleCardSelection() {
    selected = !selected;
  }

  @override
  toString() =>
      "number: $number, \ncolor: $color, \nshape: $shape, \nfill: $fill\n\n";

  @override
  int get hashCode =>
      this.number * 1000 + this.color * 100 + this.shape * 10 + this.fill;

  @override
  bool operator ==(o) => o is TuplesCard && o.hashCode == this.hashCode;
}
