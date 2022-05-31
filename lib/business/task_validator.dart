
class TaskValidator {

  static String emptyContentValidator = "The content can not be empty.";
  static String exceededContentValidator = "The content can not exceed 100 characters.";

  static String? validateContent(String content) {
    if (content.isEmpty) {
      return emptyContentValidator;
    } else if (content.length >= 100) {
      return exceededContentValidator;
    }
    return null;
  }
}