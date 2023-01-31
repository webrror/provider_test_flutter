import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/movie_provider.dart';
import 'package:provider_test/screens/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    var movies = context.watch<MovieProvider>().movies;
    var myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Wishlist(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 20)),
              child: Text(
                "Go to wishlist (${myList.length})",
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (_, index) {
                    final currentMovie = movies[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                      key: ValueKey(currentMovie.title),
                      color: Colors.red[50],
                      elevation: 0.5,
                      child: ListTile(
                        leading: ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.network(currentMovie.imageUrl)),
                        title: Text(currentMovie.title),
                        subtitle: Text(currentMovie.runtime ?? 'No information'),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.favorite,
                            color: myList.contains(currentMovie)
                                ? Colors.red
                                : Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            if (!myList.contains(currentMovie)) {
                              context.read<MovieProvider>().addToList(currentMovie);
                            } else {
                              context.read<MovieProvider>().removeFromList(currentMovie);
                            }
                          },
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}