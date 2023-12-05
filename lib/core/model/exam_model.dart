// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sadece_iylik_saglik/core/constants/enum/komite_enum.dart';
import 'package:sadece_iylik_saglik/core/constants/enum/donem_enum.dart';
import 'package:sadece_iylik_saglik/core/model/question_model.dart';

class Exam {
  final String examName;
  final Donem donemName;
  final Komite komiteName;
  final List<Question> questions;
  Exam({
    required this.examName,
    required this.donemName,
    required this.komiteName,
    required this.questions,
  });
}
