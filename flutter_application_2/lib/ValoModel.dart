import 'package:flutter/material.dart';

class Agent {
  final String displayName;
  final String description;
  var fullPortraitV2;
  final String displayIconSmall;
  Agent({
    required this.fullPortraitV2,
    required this.displayIconSmall,
    required this.description,
    required this.displayName,
  });
}
