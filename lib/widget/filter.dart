import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  final Map<String, String> values;
  final String label;
  final ValueChanged<String> onChanged;

  const FilterWidget(
      {super.key,
      required this.values,
      required this.label,
      required this.onChanged});

  @override
  State<FilterWidget> createState() => FilterWidgetState();
}

class FilterWidgetState extends State<FilterWidget> {
  late String _selected;
  late List<String> _values;

  @override
  void initState() {
    super.initState();
    _values = widget.values.keys.toList();
    _selected = _values.first;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 36,
        child: Row(children: [
          Container(
              alignment: Alignment.center,
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(widget.label,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ))),
          Expanded(
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                ..._values.map((key) {
                  var isSelected = _selected == key;
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected = key;
                          widget.onChanged(widget.values[key] ?? '');
                        });
                      },
                      child: Container(
                          margin: const EdgeInsets.only(right: 6),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: isSelected
                                ? const Color.fromRGBO(105, 105, 105, 100)
                                : const Color.fromRGBO(211, 211, 211, 100),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            key,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          )));
                })
              ])),
        ]));
  }
}
