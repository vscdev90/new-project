import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:millionaire_mindset/widgets/responsive_content.dart';

void main() {
  const childKey = Key('content');

  testWidgets('beperkt de breedte tot maxWidth op brede schermen', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SizedBox(
          width: 1200,
          height: 800,
          child: ResponsiveContent(
            maxWidth: 640,
            child: Container(key: childKey, color: Colors.red),
          ),
        ),
      ),
    );

    final size = tester.getSize(find.byKey(childKey));
    expect(size.width, 640);
  });

  testWidgets('gebruikt de volledige breedte op smalle schermen', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SizedBox(
          width: 300,
          height: 800,
          child: ResponsiveContent(
            maxWidth: 640,
            child: Container(key: childKey, color: Colors.red),
          ),
        ),
      ),
    );

    final size = tester.getSize(find.byKey(childKey));
    expect(size.width, 300);
  });
}
