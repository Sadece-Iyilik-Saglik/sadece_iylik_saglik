import 'package:sadece_iylik_saglik/core/constants/enum/komite_enum.dart';
import 'package:sadece_iylik_saglik/core/constants/enum/donem_enum.dart';

import '../constants/enum/question_enum.dart';
import '../model/exam_model.dart';
import '../model/question_model.dart';

class ExamViewModel {
  static List<Exam> allExams = [
    Exam(examName: "Anatomi Testi", komiteName: Komite.Komite_1, donemName: Donem.Donem_1, questions: [
      Question(
          content: "İnsan vücudundaki en büyük organ hangisidir?",
          questionType: QuestionType.COKTAN_SECMELI,
          options: [
            "Karaciğer",
            "Kalp",
            "Cilt",
            "Beyin",
            "Akciğer",
          ],
          trueOptionIndex: 2),
      Question(
          content: "Aşağıdaki iskelet sistemi organlarından hangisi hareketi sağlar?",
          questionType: QuestionType.COKTAN_SECMELI,
          options: [
            "Kas",
            "Kemik",
            "Kalp",
            "Cilt",
            "Böbrek",
          ],
          trueOptionIndex: 0),
      // ... Diğer sorular buraya eklenebilir
    ]),
    Exam(examName: "Fizyoloji Sınavı", komiteName: Komite.Komite_1, donemName: Donem.Donem_1, questions: [
      Question(
          content: "İnsan vücudu hangi sistemle oksijen alır ve karbon dioksit atar?",
          questionType: QuestionType.COKTAN_SECMELI,
          options: [
            "Solunum Sistemi",
            "Dolaşım Sistemi",
            "Sindirim Sistemi",
            "Üreme Sistemi",
            "Endokrin Sistemi",
          ],
          trueOptionIndex: 0),
      Question(
          content: "Kanın ana bileşeni nedir?",
          questionType: QuestionType.COKTAN_SECMELI,
          options: [
            "Su",
            "Şeker",
            "Protein",
            "Yağ",
            "Vitamin",
          ],
          trueOptionIndex: 2),
      // ... Diğer sorular buraya eklenebilir
    ]),
  ];
}
