import 'package:MoviesApp/contants.dart';
import 'package:MoviesApp/screens/details_page.dart';
import 'package:flutter/material.dart';

class Topratedmovies extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const Topratedmovies({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(movie: snapshot.data[index])));
              },
              child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 300,
                width: 200,
                child: Image.network(
                  "${Constants.imagePath}${snapshot.data[index].posterPath}",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
                      ),
            ),
          );
        },
      ),
    );
  }
}
