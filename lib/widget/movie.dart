import 'dart:typed_data';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/model/movie.dart';
import 'package:flutter_movie/widget/detail.dart';
import 'package:shimmer/shimmer.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailScreen(slug: movie.slug ?? '')));
    }, child: LayoutBuilder(builder: (context, constraints) {
      double imageHeight = (constraints.maxWidth * 3) / 2;
      double textHeight = (constraints.maxHeight - imageHeight);
      double imageWidth = constraints.maxWidth;
      return Column(children: [
        SizedBox(
          width: imageWidth,
          height: imageHeight,
          child: Stack(children: [
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: FancyShimmerImage(
                    imageUrl:
                        'https://img.ophim10.cc/uploads/movies/${movie.thumbUrl}',
                    width: imageWidth,
                    height: imageHeight,
                  )),
            ),
            Align(
              alignment: const Alignment(0.88, 0.95),
              child: Text(movie.quality ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.amber, fontWeight: FontWeight.bold)),
            )
          ]),
        ),
        SizedBox(
            width: constraints.maxWidth,
            height: textHeight,
            child: Text(
              movie.name ?? "No name",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ))
      ]);
    }));
  }
}

class ShimmerImage extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double height;
  final double width;
  final Color baseColor;
  final Color highlightColor;

  const ShimmerImage({
    super.key,
    required this.image,
    required this.height,
    required this.width,
    this.fit = BoxFit.cover,
    this.baseColor = const Color(0xFFF4F4F4),
    this.highlightColor = const Color(0xFFDADADA),
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: height,
        width: width,
        child: Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: Container(
            height: height,
            width: width,
            color: Colors.white,
          ),
        ),
      ),
      FadeInImage.memoryNetwork(
        image: image,
        fit: fit,
        height: height,
        width: width,
        placeholder: kTransparentImage,
        imageErrorBuilder: (context, error, stackTrace) {
          return Expanded(
              child: Container(
                  alignment: Alignment.center,
                  child: const Icon(Icons.warning)));
        },
      ),
    ]);
  }
}

final Uint8List kTransparentImage = Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);
