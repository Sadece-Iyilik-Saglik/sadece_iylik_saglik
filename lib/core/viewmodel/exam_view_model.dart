import '../constants/enum/question_enum.dart';
import '../model/exam_model.dart';
import '../model/question_model.dart';

class ExamViewModel {
  static List<Exam> allExams = [
    Exam(name: "Test 1", questions: [
      Question(
          content:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur suscipit posuere nisl nec efficitur. Quisque aliquet arcu sed velit cursus venenatis ac non ligula. Pellentesque ac ullamcorper turpis, sed fringilla tellus. Sed et tellus odio. Vivamus quis suscipit urna. Proin sed rhoncus velit, vitae condimentum leo. Maecenas pulvinar turpis vitae tempus sagittis.",
          questionType: QuestionType.COKTAN_SECMELI,
          options: [
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "Vivamus sit amet lobortis erat. Vestibulum at iaculis magna, id imperdiet sem.",
            "Donec feugiat tincidunt diam ac fermentum. Ut semper eros ac rhoncus vestibulum.",
            "Nulla facilisi. Nunc finibus vel augue in luctus.",
            "Ut semper dignissim dignissim. Integer eget eros tellus."
          ],
          trueOptionIndex: 2),
      Question(
          content:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur suscipit posuere nisl nec efficitur. Quisque aliquet arcu sed velit cursus venenatis ac non ligula. Pellentesque ac ullamcorper turpis, sed fringilla tellus. Sed et tellus odio. Vivamus quis suscipit urna. Proin sed rhoncus velit, vitae condimentum leo. Maecenas pulvinar turpis vitae tempus sagittis.",
          questionType: QuestionType.COKTAN_SECMELI,
          options: [
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "Vivamus sit amet lobortis erat. Vestibulum at iaculis magna, id imperdiet sem.",
            "Donec feugiat tincidunt diam ac fermentum. Ut semper eros ac rhoncus vestibulum.",
            "Nulla facilisi. Nunc finibus vel augue in luctus.",
            "Ut semper dignissim dignissim. Integer eget eros tellus."
          ],
          trueOptionIndex: 2),
      Question(
          content:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur suscipit posuere nisl nec efficitur. Quisque aliquet arcu sed velit cursus venenatis ac non ligula. Pellentesque ac ullamcorper turpis, sed fringilla tellus. Sed et tellus odio. Vivamus quis suscipit urna. Proin sed rhoncus velit, vitae condimentum leo. Maecenas pulvinar turpis vitae tempus sagittis.",
          questionType: QuestionType.COKTAN_SECMELI,
          options: [
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "Vivamus sit amet lobortis erat. Vestibulum at iaculis magna, id imperdiet sem.",
            "Donec feugiat tincidunt diam ac fermentum. Ut semper eros ac rhoncus vestibulum.",
            "Nulla facilisi. Nunc finibus vel augue in luctus.",
            "Ut semper dignissim dignissim. Integer eget eros tellus."
          ],
          trueOptionIndex: 2),
      Question(
          content:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur suscipit posuere nisl nec efficitur. Quisque aliquet arcu sed velit cursus venenatis ac non ligula. Pellentesque ac ullamcorper turpis, sed fringilla tellus. Sed et tellus odio. Vivamus quis suscipit urna. Proin sed rhoncus velit, vitae condimentum leo. Maecenas pulvinar turpis vitae tempus sagittis.",
          questionType: QuestionType.COKTAN_SECMELI,
          options: [
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "Vivamus sit amet lobortis erat. Vestibulum at iaculis magna, id imperdiet sem.",
            "Donec feugiat tincidunt diam ac fermentum. Ut semper eros ac rhoncus vestibulum.",
            "Nulla facilisi. Nunc finibus vel augue in luctus.",
            "Ut semper dignissim dignissim. Integer eget eros tellus."
          ],
          trueOptionIndex: 2),
      Question(
          content:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur suscipit posuere nisl nec efficitur. Quisque aliquet arcu sed velit cursus venenatis ac non ligula. Pellentesque ac ullamcorper turpis, sed fringilla tellus. Sed et tellus odio. Vivamus quis suscipit urna. Proin sed rhoncus velit, vitae condimentum leo. Maecenas pulvinar turpis vitae tempus sagittis.",
          questionType: QuestionType.COKTAN_SECMELI,
          options: [
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            "Vivamus sit amet lobortis erat. Vestibulum at iaculis magna, id imperdiet sem.",
            "Donec feugiat tincidunt diam ac fermentum. Ut semper eros ac rhoncus vestibulum.",
            "Nulla facilisi. Nunc finibus vel augue in luctus.",
            "Ut semper dignissim dignissim. Integer eget eros tellus."
          ],
          trueOptionIndex: 2)
    ])
  ];
}
