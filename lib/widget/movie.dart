import 'package:fancy_shimmer_image/defaults.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:fancy_shimmer_image/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/entity/app_movie.dart';
import 'package:shimmer/shimmer.dart';

import '../routes/generated_routes.dart';

class MovieItem extends StatelessWidget {
  final Movie? movie;

  const MovieItem({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: () {
      if (movie != null) {
        Navigator.pushNamed(context, RouteGenerator.detail, arguments: movie);
      }
    }, child: LayoutBuilder(builder: (context, constraints) {
      double imageHeight = (constraints.maxWidth * 3) / 2;
      double textHeight = (constraints.maxHeight - imageHeight);
      double imageWidth = constraints.maxWidth;
      if (movie == null) {
        return Column(
          children: [
            ImageShimmerWidget(
                width: imageWidth,
                height: imageHeight,
                shimmerDirection: ShimmerDirection.ltr,
                shimmerDuration: const Duration(milliseconds: 1500),
                baseColor: defaultShimmerBaseColor,
                highlightColor: defaultShimmerHighlightColor,
                backColor: defaultShimmerBackColor),
            const SizedBox(height: 6),
            ImageShimmerWidget(
                width: imageWidth,
                height: (textHeight - 6) / 2,
                shimmerDirection: ShimmerDirection.ltr,
                shimmerDuration: const Duration(milliseconds: 1500),
                baseColor: defaultShimmerBaseColor,
                highlightColor: defaultShimmerHighlightColor,
                backColor: defaultShimmerBackColor),
            SizedBox(height: (textHeight - 6) / 2),
          ],
        );
      }

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
                    imageUrl: movie!.image,
                    width: imageWidth,
                    height: imageHeight,
                  )),
            ),
            Align(
              alignment: const Alignment(0.88, 0.95),
              child: Text(movie!.content ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Colors.amber, fontWeight: FontWeight.bold)),
            )
          ]),
        ),
        Container(
            padding: const EdgeInsets.only(top: 4, bottom: 4),
            width: constraints.maxWidth,
            height: textHeight,
            child: Text(
              movie!.name,
              maxLines: 2,
              style: const TextStyle(
                height: 1.18,
              ),
              overflow: TextOverflow.ellipsis,
            ))
      ]);
    }));
  }
}
