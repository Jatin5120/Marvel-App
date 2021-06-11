import 'package:flutter/material.dart';
import 'package:marvel_app/my_icons.dart';

class TypeConstant {
  static const String characters = 'characters';
  static const String comics = 'comics';
  static const String creators = 'creators';
  static const String events = 'events';
  static const String series = 'series';
  static const String stories = 'stories';
}

final Map<String, IconData> myIcons = {
  TypeConstant.characters: MyIcons.    characters,
  TypeConstant.comics: MyIcons.comics,
  TypeConstant.creators: MyIcons.creators,
  TypeConstant.events: MyIcons.events,
  TypeConstant.series: MyIcons.series,
  TypeConstant.stories: MyIcons.stories,
};

final List<String> typeConstants = [
  TypeConstant.characters,
  TypeConstant.comics,
  TypeConstant.creators,
  TypeConstant.events,
  TypeConstant.series,
  TypeConstant.stories,
];
