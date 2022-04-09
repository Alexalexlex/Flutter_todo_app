import 'package:flutter/material.dart';

import 'card.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _index = 0;
  List<CardWidget> _cards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: _cards,
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Add card'),
        onPressed: () {
          CardWidget? card;
          _index++;
          card = CardWidget(
            key: ValueKey('card-$_index'),
            onDelete: () {
              _cards.remove(card);
              _cards = [..._cards];
              setState(() {});
            },
          );
          _cards = [..._cards, card];
          setState(() {});
        },
      ),
    );
  }
}
