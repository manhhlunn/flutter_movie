import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/entity/history_entity.dart';
import 'package:flutter_movie/network/network_request.dart';
import 'package:flutter_movie/routes/generated_routes.dart';

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
      return "Vị trí: ${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    } else {
      return "Vị trí: $twoDigitMinutes:$twoDigitSeconds";
    }
  }

  String _printEpisode(int index) {
    return "Tập: ${index + 1}";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RouteGenerator.detail, arguments: history.id);
        },
        child: Row(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: FancyShimmerImage(
                imageUrl: '${NetworkRequest.imageDomain}${history.image}',
                width: 75,
                height: 112.5,
              )),
          const SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: Text(
                  history.name,
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
