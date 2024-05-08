import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../entity/history_entity.dart';
import '../routes/generated_routes.dart';

class MovieHistoryItem extends StatelessWidget {
  final History history;

  const MovieHistoryItem({
    super.key,
    required this.history,
  });

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours > 0) {
      return "Duration: ${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    } else {
      return "Duration: $twoDigitMinutes:$twoDigitSeconds";
    }
  }

  String _printEpisode(int index) {
    return "Episode: ${index + 1}";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RouteGenerator.detail,
              arguments: history.movie);
        },
        child: Row(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: FancyShimmerImage(
                imageUrl: history.movie.image,
                width: 75,
                height: 112.5,
              )),
          const SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: Text(
                  history.movie.name,
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                )),
            Container(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: Text(
                  _printEpisode(history.episodeIndex),
                  maxLines: 1,
                  style: const TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                )),
            Container(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: Text(
                  printDuration(Duration(milliseconds: history.position)),
                  maxLines: 1,
                  style: const TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ))
          ])
        ]));
  }
}
