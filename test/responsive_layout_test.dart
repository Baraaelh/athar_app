import 'package:athar_app/app.dart';
import 'package:athar_app/core/di/injection.dart';
import 'package:athar_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';

/// Pumps every screen on small, medium and large phones (and with a larger
/// text scale) and fails if any RenderFlex overflows.
void main() {
  setUpAll(() async {
    // Load the real bundled font so text widths match a device.
    final loader = FontLoader('Alexandria');
    for (final w in ['Regular', 'Medium', 'SemiBold', 'Bold']) {
      loader.addFont(rootBundle.load('assets/fonts/Alexandria-$w.ttf'));
    }
    await loader.load();
    await initDependencies();
  });

  const sizes = {
    'small 320x568': Size(320, 568),
    'android 360x640': Size(360, 640),
    'iPhone 16 393x852': Size(393, 852),
    'large 430x932': Size(430, 932),
    'tablet 800x1280': Size(800, 1280),
  };

  Future<void> pumpRoute(
      WidgetTester tester, Size size, String route, double textScale) async {
    tester.view
      ..physicalSize = size
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    tester.platformDispatcher.textScaleFactorTestValue = textScale;
    addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);

    await tester.pumpWidget(const AtharApp());
    if (route != Routes.welcome) {
      tester.state<NavigatorState>(find.byType(Navigator)).pushNamed(route);
    }
    await tester.pump(const Duration(seconds: 2));
    await tester.pump(const Duration(seconds: 2));
  }

  for (final textScale in [1.0, 1.3]) {
    for (final entry in sizes.entries) {
      for (final route in [Routes.welcome, Routes.registerDonor, Routes.main]) {
        testWidgets('$route on ${entry.key} @${textScale}x', (tester) async {
          await pumpRoute(tester, entry.value, route, textScale);
          expect(tester.takeException(), isNull);
        });
      }
    }
  }
}
