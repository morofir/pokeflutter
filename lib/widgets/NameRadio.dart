import 'package:flutter/material.dart';

enum options { Name, Nickname }

class NameRadio extends StatefulWidget {
  const NameRadio({Key? key}) : super(key: key);

  @override
  _NameRadioState createState() => _NameRadioState();
}

class _NameRadioState extends State<NameRadio> {
  options _chosenOption = options.Name;

  get textChosen => _chosenOption == options.Name ? 'Name' : 'Nickname';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Name'),
          leading: Radio(
            value: options.Name,
            groupValue: _chosenOption,
            onChanged: (value) {
              setState(() {
                _chosenOption = value as options;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Nickname'),
          leading: Radio(
            value: options.Nickname,
            groupValue: _chosenOption,
            onChanged: (value) {
              setState(() {
                _chosenOption = value as options;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 15, 20, 25),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter Pokemon $textChosen',
            ),
          ),
        ),
      ],
    );
  }
}
