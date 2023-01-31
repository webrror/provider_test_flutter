import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider/movie_provider.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {

    final _myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(
        title: Text("My Wishlist (${_myList.length})"),
      ),
      body: ListView.builder(
          itemCount: _myList.length,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemBuilder: (_, index) {
            final currentMovie = _myList[index];
            return Card(
              color: Colors.white,
              key: ValueKey(currentMovie.title),
              elevation: 0.5,
              child: ListTile(
                leading: ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.network(currentMovie.imageUrl)),
                title: Text(currentMovie.title),
                subtitle: Text(currentMovie.runtime ?? ''),
                trailing: TextButton(
                  child: const Text(
                    'Remove',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    context.read<MovieProvider>().removeFromList(currentMovie);
                  },
                ),
              ),
            );
          }),
    );
  }
}