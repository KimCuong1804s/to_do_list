
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_list/business/task_validator.dart';
import '../lib/data/models/example_data.dart';

void main() {

  test('valid content returns null value', () {
    const content = 'Hello Manabie';
    var result = TaskValidator.validateContent(content);
    expect(result, null);
  });

  test('empty content returns error string', () {
    const content = '';
    var result = TaskValidator.validateContent(content);
    expect(result, TaskValidator.emptyContentValidator);
  });

  test('exceeded characters content returns error string', () {
    var result = TaskValidator.validateContent(benhDauMuaKhi_test);
    expect(result, TaskValidator.exceededContentValidator);
  });
}