import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary({Key? key, this.summary, required this.emptyContentDisplay})
      : super(key: key);

  final String? summary;
  final String emptyContentDisplay;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
          child: Text(
            'Description',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(summary?.replaceAll(RegExp(r'<a.*'), '') ?? emptyContentDisplay)
      ],
    );
  }
}
