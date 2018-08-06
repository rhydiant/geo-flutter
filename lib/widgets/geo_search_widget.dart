import 'package:flutter/material.dart';

///
/// Renders a search form
///

class GeoSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: const Text('Filters'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FlatButton(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  bottom: 16.0,
                ),
                child: const Text(
                  'Apply',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
