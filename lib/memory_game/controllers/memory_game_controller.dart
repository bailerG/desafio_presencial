import 'package:flutter/material.dart';

class MemoryGameProvider with ChangeNotifier {
  bool initialized = false;


  final letterList = <String>[
    'a',
    'b',
    'c',
    'd',
    'a',
    'b',
    'c',
    'd',
  ];

  final shuffledList = <String>[];

  List<String> shuffleList() {
    for (var element in letterList) {
      shuffledList.add(element);
    }
    shuffledList.shuffle();
    return shuffledList;
  }

  void init(){
    shuffledList.clear();
    shuffleList();
    initialized = true;
    notifyListeners();
  }

  List<String> get letters => List.unmodifiable(shuffledList);
}