import 'package:flutter/material.dart';
import 'package:movies/movie-list.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: Icon(Icons.handshake),
              title: Text('Hello',
              style: TextStyle(color: Colors.black),),
              backgroundColor: Colors.white,
              titleSpacing: 0,
              actions: [
                Icon(Icons.person, color: Colors.blue),
                SizedBox(width: 10),
                SizedBox(width: 10),
              ],
    
            ),


            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Millions of movies, TV shows to explore now. ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),

              ),

            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'What is popular',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        blurRadius: 20,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),


            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 220,
                child: MovieList(),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Trending Now',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: Colors.white,
                        blurRadius: 20,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 300,
                child: MovieList(),
              ),

            ),

          ],
        ),
      ),
    );
  }
}
