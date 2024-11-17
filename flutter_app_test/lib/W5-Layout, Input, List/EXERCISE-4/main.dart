import 'package:flutter/material.dart';
import 'package:flutter_app_test/W5-Layout,%20Input,%20List/EXERCISE-4/jokes/jokes.dart';

Color appColor = Colors.green[300]!;


void main() => runApp(MaterialApp(
      home: FavApp(
        list: myjokeList,
      ),
    ));

class FavApp extends StatefulWidget {
  const FavApp({
    super.key,
    required this.list,
  });

  final JokeList list;

  @override
  State<FavApp> createState() => _FavAppState();
}

class _FavAppState extends State<FavApp> {
  Joke? favJoke;

  @override
  void initState() {
    super.initState();
    favJoke = widget.list.favoriteJoke;
  }
  
  void setFavorite(Joke? joke) {
    setState(() {
      favJoke = joke;
      widget.list.favoriteJoke = joke; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: getFavCardList(widget.list, favJoke, setFavorite),
        ),
      ),
    );
  }

  List<FavoriteCard> getFavCardList(JokeList jokeList, Joke? favorite, void Function(Joke?) onFavoriteClick) {
    return jokeList.jokeList.map((e) {
      return FavoriteCard(
        inputJoke: e,
        inputFav: favorite,
        onFavoriteClick: onFavoriteClick,
      );
    }).toList();
  }
}

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.inputJoke,
    required this.inputFav,
    required this.onFavoriteClick,
  });

  final Joke inputJoke;
  final Joke? inputFav;
  final void Function(Joke?) onFavoriteClick;

  String get jokeTitle => inputJoke.title;
  String get jokeDescription => inputJoke.description;

  @override
  Widget build(BuildContext context) {
    
    // ignore: no_leading_underscores_for_local_identifiers
    bool _isCurrentFavorite = inputFav == inputJoke;

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jokeTitle,
                  style:
                      TextStyle(color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(jokeDescription),
              ],
            ),
          ),
          IconButton(
            onPressed: () => onFavoriteClick(_isCurrentFavorite ? null : inputJoke),
            icon: Icon(
              _isCurrentFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isCurrentFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
