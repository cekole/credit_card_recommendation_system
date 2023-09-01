class Question {
  final int id;
  final String title;
  final List<String> answers;
  int? selectedAnswerIndex = -1;

  Question({
    required this.id,
    required this.title,
    required this.answers,
    required this.selectedAnswerIndex,
  });
}
