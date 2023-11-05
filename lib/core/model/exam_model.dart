// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sadece_iylik_saglik/core/model/question_model.dart';

class Exam {
  final String name;
  final List<Question> questions;
  Exam({
    required this.name,
    required this.questions,
  });
}
