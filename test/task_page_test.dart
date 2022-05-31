
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_list/presentation/task_page.dart';

void main() {

  group('3 types of TaskPage initialization, changed by filter', () {

    testWidgets('filter == null ===> All Tasks Page', (tester) async {
      const filter = null;
      const title = 'All Tasks';
      await tester.pumpWidget( MaterialApp(
        home: TaskPage(filter, key: const Key('0')),
      ));
      expect(find.text(title), findsOneWidget);
    });

    testWidgets('filter == false ===> Incomplete Tasks Page', (tester) async {
      const filter = false;
      const title = 'Incomplete Tasks';
      await tester.pumpWidget( MaterialApp(
        home: TaskPage(filter, key: const Key('1')),
      ));
      expect(find.text(title), findsOneWidget);
    });

    testWidgets('filter == true ===> Completed Tasks Page', (tester) async {
      const filter = true;
      const title = 'Completed Tasks';
      await tester.pumpWidget( MaterialApp(
        home: TaskPage(filter, key: const Key('2')),
      ));
      expect(find.text(title), findsOneWidget);
    });

  });

}