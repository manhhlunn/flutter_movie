import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final Map<String, String> values;
  final String label;
  final String value;
  final ValueChanged<String> onChanged;

  const FilterWidget(
      {super.key,
      required this.values,
      required this.label,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 36,
        child: Row(children: [
          Container(
              alignment: Alignment.center,
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(label,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ))),
          Expanded(
              child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: values.keys.toList().map((key) {
                    var isSelected = key == value;
                    return GestureDetector(
                        onTap: () {
                          onChanged(key);
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
                              values[key] ?? '',
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            )));
                  }).toList())),
        ]));
  }
}
