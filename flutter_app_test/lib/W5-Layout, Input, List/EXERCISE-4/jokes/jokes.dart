class Joke {
  final String title;
  final String description;

  Joke(this.title, this.description);
}

class JokeList {
  final List<Joke> jokeList;
  late Joke? favoriteJoke;

  JokeList(List<Joke> list, [this.favoriteJoke]) : jokeList = list;
}

Joke joke1 = Joke("title1", "description1");
Joke joke2 = Joke("title2", "description2");
Joke joke3 = Joke("title3", "description3");
Joke joke4 = Joke("title4", "description4");
Joke joke5 = Joke("title5", "description5");
Joke joke6 = Joke("title6", "description6");
Joke joke7 = Joke("title7", "description7");
Joke joke8 = Joke("title8", "description8");
Joke joke9 = Joke("title9", "description9");
Joke joke10 = Joke("title10", "description10");
Joke joke11 = Joke("title11", "description11");
Joke joke12 = Joke("title12", "description12");
Joke joke13 = Joke("title13", "description13");
Joke joke14 = Joke("title14", "description14");
Joke joke15 = Joke("title15", "description15");
Joke joke16 = Joke("title16", "description16");
Joke joke17 = Joke("title17", "description17");
Joke joke18 = Joke("title18", "description18");
Joke joke19 = Joke("title19", "description19");
Joke joke20 = Joke("title20", "description20");

JokeList myjokeList = JokeList([
  joke1,
  joke2,
  joke3,
  joke4,
  joke5,
  joke6,
  joke7,
  joke8,
  joke9,
  joke10,
  joke11,
  joke12,
  joke13,
  joke14,
  joke15,
  joke16,
  joke17,
  joke18,
  joke19,
  joke20
], joke2
);
