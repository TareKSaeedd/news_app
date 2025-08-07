import 'package:flutter/material.dart';
import 'package:news_app/model/source_response.dart';

class SourceName extends StatelessWidget {
  final Sources source;
  bool isSelected;
  SourceName({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(
      source.name ?? '',
      style:
          isSelected
              ? Theme.of(context).textTheme.labelLarge
              : Theme.of(context).textTheme.labelMedium,
    );
  }
}
