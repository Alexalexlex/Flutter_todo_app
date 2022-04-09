import 'package:flutter/material.dart';

import 'edit_card.dart';

class CardWidget extends StatefulWidget {
  final Function() onDelete;

  const CardWidget({Key? key, required this.onDelete}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  var _text = 'A card that can be tapped';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            showCardEditDialog(context, _text, (text) {
              setState(() {
                _text = text;
              });
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child: Row(
              children: [
                Text(
                  _text,
                  // textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const Expanded(child: SizedBox()),
                IconButton(
                  onPressed: () {
                    widget.onDelete();
                  },
                  icon: const Icon(Icons.delete),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
