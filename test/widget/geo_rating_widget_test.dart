import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:geo/widgets/geo_rating_widget.dart';

void main() {
  group('GeoRating', () {
    testWidgets('should render rating give a score of 0',
        (WidgetTester tester) async {
      await tester.pumpWidget(GeoRating(score: 0));
      expect(find.byKey(Key('GeoRating._Circle.Active.Key')), findsNothing);
    });

    testWidgets('should render rating give a score of 1',
        (WidgetTester tester) async {
      await tester.pumpWidget(GeoRating(score: 1));
      expect(find.byKey(Key('GeoRating._Circle.Active.Key')), findsNWidgets(1));
    });

    testWidgets('should render rating give a score of 2',
        (WidgetTester tester) async {
      await tester.pumpWidget(GeoRating(score: 2));
      expect(find.byKey(Key('GeoRating._Circle.Active.Key')), findsNWidgets(2));
    });

    testWidgets('should render rating give a score of 3',
        (WidgetTester tester) async {
      await tester.pumpWidget(GeoRating(score: 3));
      expect(find.byKey(Key('GeoRating._Circle.Active.Key')), findsNWidgets(3));
    });

    testWidgets('should render rating give a score of 4',
        (WidgetTester tester) async {
      await tester.pumpWidget(GeoRating(score: 4));
      expect(find.byKey(Key('GeoRating._Circle.Active.Key')), findsNWidgets(4));
    });

    testWidgets('should render rating give a score of 5',
        (WidgetTester tester) async {
      await tester.pumpWidget(GeoRating(score: 5));
      expect(find.byKey(Key('GeoRating._Circle.Active.Key')), findsNWidgets(5));
    });

    testWidgets('should render rating give a score over 5',
        (WidgetTester tester) async {
      await tester.pumpWidget(GeoRating(score: 6));
      expect(find.byKey(Key('GeoRating._Circle.Active.Key')), findsNWidgets(5));
    });

    testWidgets('should render a rating', (WidgetTester tester) async {
      await tester.pumpWidget(GeoRating(score: 4));

      expect(find.text('4.0/5.0'), findsOneWidget);
    });
  });
}
