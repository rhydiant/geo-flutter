import 'dart:async';

import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  enableFlutterDriverExtension();

  group('basic launch test', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('launch', () async {
      // Record the performance timeline of things that happen inside the closure
      final Timeline timeline = await driver.traceAction(() async {
        // Find the scrollable user list
        final SerializableFinder userList = find.byValueKey('user-list');

        // Scroll down 5 times
        for (int i = 0; i < 5; i++) {
          // Scroll 300 pixels down, for 300 millis
          await driver.scroll(
              userList, 0.0, -300.0, const Duration(milliseconds: 300));

          // Emulate a user's finger taking its time to go back to the original
          // position before the next scroll
          await Future<Null>.delayed(const Duration(milliseconds: 500));
        }

        // Scroll up 5 times
        for (int i = 0; i < 5; i++) {
          await driver.scroll(
              userList, 0.0, 300.0, const Duration(milliseconds: 300));
          await Future<Null>.delayed(const Duration(milliseconds: 500));
        }
      });

      // The `timeline` object contains all the performance data recorded during
      // the scrolling session. It can be digested into a handful of useful
      // aggregate numbers, such as "average frame build time".
      final TimelineSummary summary = TimelineSummary.summarize(timeline);

      // The following line saves the timeline summary to a JSON file.
      summary.writeSummaryToFile('scrolling_performance', pretty: true);

      // The following line saves the raw timeline data as JSON.
      summary.writeTimelineToFile('scrolling_performance', pretty: true);
    });
  });
}
