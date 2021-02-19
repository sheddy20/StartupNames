import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _mySuggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFonts = TextStyle(
    fontSize: 16.0,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) {
          final tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFonts,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            tiles: tiles,
            context: context,
          ).toList();
          return Scaffold(
            appBar: AppBar(
              title: Text("My Suggestions"),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("StartUp-Names"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.list),
              onPressed: _pushSaved,
            ),
          ],
        ),
        body: _buildSuggestion(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text(
            "SignOut",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          icon: Icon(Icons.person),
          backgroundColor: Colors.deepOrange,
        ),
      ),
    );
  }

  Widget _buildSuggestion() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        if (index.isOdd) return Divider();

        final myIndex = index ~/ 2;
        if (myIndex <= _mySuggestions.length) {
          _mySuggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_mySuggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFonts,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
