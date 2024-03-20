import 'package:flutter/material.dart';
import 'package:flutter_movie/model/movie_detail.dart';

class EpisodesWidgetCallback {
  final Episodes episode;
  final int index;

  const EpisodesWidgetCallback({required this.episode, required this.index});
}

class EpisodesWidget extends StatefulWidget {
  final Episodes? episode;
  final int index;
  final List<Episodes> episodes;
  final ValueChanged<EpisodesWidgetCallback> onChanged;

  const EpisodesWidget(
      {super.key,
      required this.episode,
      required this.index,
      required this.episodes,
      required this.onChanged});

  @override
  State<EpisodesWidget> createState() => EpisodesWidgetState();
}

class EpisodesWidgetState extends State<EpisodesWidget> {
  late Episodes? _current;
  late int _selected;

  @override
  void initState() {
    _current = widget.episode;
    _selected = widget.index;
    super.initState();
  }

  void onChanged(Episodes e, int value) {
    setState(() {
      _selected = value;
      _current = e;
      widget.onChanged(EpisodesWidgetCallback(episode: e, index: value));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: widget.episodes
            .map((e) => EpisodeWidget(
                episode: e,
                current: _current,
                currentIdx: _selected,
                onChanged: (value) {
                  onChanged(e, value);
                }))
            .toList());
  }
}

class EpisodeWidget extends StatelessWidget {
  final Episodes episode;
  final Episodes? current;
  final int currentIdx;
  final ValueChanged<int> onChanged;

  const EpisodeWidget(
      {super.key,
      required this.episode,
      required this.current,
      required this.currentIdx,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    var values = episode.serverData ?? [];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(episode.serverName ?? '',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
      ),
      SizedBox(
        height: 36,
        child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: values.map((key) {
              var index = values.indexOf(key);
              var leftSpace = index == 0 ? 16.0 : 0.0;
              var rightSpace = index == values.length - 1 ? 16.0 : 6.0;
              return GestureDetector(
                  onTap: () {
                    onChanged(index);
                  },
                  child: Container(
                      margin:
                          EdgeInsets.only(left: leftSpace, right: rightSpace),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: index == currentIdx && episode == current
                            ? const Color.fromRGBO(105, 105, 105, 100)
                            : const Color.fromRGBO(211, 211, 211, 100),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        key.name ?? '',
                        style: TextStyle(
                          color: index == currentIdx && episode == current
                              ? Colors.white
                              : Colors.black,
                        ),
                      )));
            }).toList()),
      ),
    ]);
  }
}
