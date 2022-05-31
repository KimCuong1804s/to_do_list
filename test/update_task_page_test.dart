
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_list/presentation/update_task_page.dart';

void main() {

  group('UpdateTaskPage: default initialization is add-new-task-page', () {

    testWidgets('Find default title of add-new-task-page', (tester) async {

      await tester.pumpWidget( MaterialApp(
        home: UpdateTaskPage(),
      ));
      expect(find.text("Add New Task"), findsOneWidget);
    });

    testWidgets('Default finish-button text is <Add>', (tester) async {

      await tester.pumpWidget( MaterialApp(
        home: UpdateTaskPage(),
      ));
      expect(find.text("Add"), findsOneWidget);
    });

  });

  group('UpdateTaskPage: become update-task-page if <passedContent> has data', () {

    testWidgets('Title of update-task-page will be change', (tester) async {

      const content = "Write a content";
      await tester.pumpWidget( MaterialApp(
        home: UpdateTaskPage(passedContent: content),
      ));
      expect(find.text("Update Task"), findsOneWidget);
      expect(find.text(content), findsOneWidget);
    });

    testWidgets('Passed content will be show when page was pushed in', (tester) async {

      const content = "Write a content";
      await tester.pumpWidget( MaterialApp(
        home: UpdateTaskPage(passedContent: content),
      ));
      expect(find.text(content), findsOneWidget);
    });

    testWidgets('finish-button text change from <Add> to <Update>', (tester) async {

      const content = "Write a content";
      await tester.pumpWidget( MaterialApp(
        home: UpdateTaskPage(passedContent: content),
      ));
      expect(find.text("Update"), findsOneWidget);
    });

  });


}