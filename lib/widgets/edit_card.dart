import 'package:flutter/material.dart';

Future<void> showCardEditDialog(
  BuildContext context,
  String text,
  Function(String) onResult,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return EditCard(
        text: text,
        onResult: onResult,
        onClosed: () {},
      );
    },
  );
}

class EditCard extends StatefulWidget {
  final Function(String) onResult;
  final Function() onClosed;
  final String text;

  const EditCard({
    Key? key,
    required this.text,
    required this.onResult,
    required this.onClosed,
  }) : super(key: key);

  @override
  State<EditCard> createState() => _EditCardState();
}

class _EditCardState extends State<EditCard> {
  var _value = '';

  @override
  void initState() {
    _value = widget.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit card'),
      content: TextFormField(
        initialValue: widget.text,
        keyboardType: TextInputType.multiline,
        maxLines: 3,
        onChanged: (value) => _value = value,
        style: const TextStyle(fontSize: 14.0),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Approve'),
          onPressed: () {
            widget.onResult(_value);
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            widget.onClosed();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
