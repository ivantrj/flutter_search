import 'package:flutter/material.dart';
import 'package:flutter_search/style.dart';
import 'tile.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String>? _results = [
    'Adam',
    'Audrey',
    'Ivan',
    'Ahmed',
    'Thomas',
    'Ioannu',
    'David',
    'Marko',
  ];
  String _input = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Users'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              style: Theme.of(context).textTheme.bodyText1,
              onChanged: _onSearchFieldChanged,
              autocorrect: false,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: placeholderTextFieldStyle,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          Expanded(
            child: (_results ?? []).isNotEmpty
                ? GridView.count(
                    childAspectRatio: 1,
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(2.0),
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    children: _results!.map((r) => Tile(r)).toList())
                : Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: _results == null
                        ? Container()
                        : Text(
                            "No results for '$_input'",
                            style: Theme.of(context).textTheme.caption,
                          ),
                  ),
          ),
        ],
      ),
    );
  }

  _onSearchFieldChanged(String value) async {}
}
