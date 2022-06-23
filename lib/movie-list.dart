import 'package:flutter/material.dart';
import 'api.dart';
import 'movie-detail.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final String icnBase = 'https://image.tmdb.org/t/p/w500/';
  final String defaultImage =
      'https//image.freeimages.com/images/large-previews/5eb/moview-clapboard-1184339.jpg';
  late HttpHelper helper;
  late int moviesCount = -1;
  late List movies;
  Icon visibleIcon = Icon(Icons.search);
  Widget searchBar = Text('search');
  bool autoFocus = false;
  bool _isLoading = false;

  get pageController => null;

  Future search(text) async {
    movies = await helper.findMovies(text);
    setState(() {
      moviesCount = movies.length;
    });
  }

  Future initialize() async {
    movies = [];
    setState(() {
      _isLoading = true;
    });
    await helper.getUpcoming().then((value) {
      setState(() {
        movies = value;
        moviesCount = movies.length;
        _isLoading = false;
        print(movies);
      });
    });
  }

  @override
  void initState() {
    helper = HttpHelper();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NetworkImage image;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
    child: PageView.builder(
    scrollDirection: Axis.horizontal,
    controller: pageController,
    itemCount: movies.length,
    itemBuilder: (ctx, i) {
      return Stack(
          alignment: Alignment.center,
          children: [Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      height: 180,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      image: DecorationImage(
      fit: BoxFit.cover,
      image: NetworkImage(icnBase + movies[i].posterPath),
      colorFilter: const ColorFilter.mode(
      Colors.black26,
      BlendMode.darken,
      ),
      ),
      ),
            ),
            Positioned(
              left: 20,
              top: 10,
              child: Text(
                movies[i].title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.black,
                    ),
                    Shadow(
                      blurRadius: 30,
                      color: Colors.black,
                    ),
                    Shadow(
                      blurRadius: 30,
                      color: Colors.orange,
                    ),
                    Shadow(
                      blurRadius: 30,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              right: 20,
              top: 20,
              child: Icon(
                Icons.heart_broken,
                color: Colors.white,
              ),
            ),
            const Positioned(
              right: 20,
              top: 20,
              child: Icon(
                Icons.heart_broken,
                color: Colors.white,
              ),
            ),


            Card(
      color: Colors.transparent,
      elevation: 1,
      child: ListTile(
      onTap: () {
      Navigator.push(
      context,
      MaterialPageRoute(
      builder: (_) => MovieDetail(movies[i])));
      },
      title: Text(movies[i].title),
      subtitle: Text(
      'Released: ${movies[i].releaseDate} -Vote: ${movies[i].voteAverage}'),

      ),
      )
      ]
      );

    },
    )
    );

  }
}

