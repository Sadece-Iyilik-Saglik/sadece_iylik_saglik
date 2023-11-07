import 'package:flutter/material.dart';
import '../../core/model/article_model.dart';

class ArticleDetailScreen extends StatefulWidget {
  const ArticleDetailScreen({super.key, required this.article});
  final Article article;

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  TextEditingController commentController = TextEditingController();
  List<String> comments = [];
  bool isCommentsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              card,
              const SizedBox(height: 24),
              commentButtonAndCard,
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget get appBar => AppBar(
        backgroundColor: const Color(0xFF273C66),
        title: Text(
          widget.article.title,
          style: const TextStyle(color: Colors.white),
        ),
      );

  Widget get commentButtonAndCard => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isCommentsExpanded = !isCommentsExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Yorumlar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  isCommentsExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          if (isCommentsExpanded)
            Column(
              children: [
                const SizedBox(height: 12),
                TextField(
                  controller: commentController,
                  decoration: InputDecoration(
                    hintText: 'Yorum yap',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFED8C42),
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFED8C42),
                        style: BorderStyle.solid,
                        width: 2.5,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (commentController.text.isNotEmpty) {
                          setState(() {
                            comments.add(commentController.text);
                            commentController.clear();
                          });
                        }
                      },
                      icon: const Icon(Icons.send),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                if (comments.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      for (var comment in comments)
                        CommentWidget('Kullanıcı Adı', comment),
                    ],
                  ),
              ],
            ),
          const SizedBox(height: 15),
        ],
      );

  Widget get card => Card(
        color: const Color(0xFFED8C42),
        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        elevation: 8,
        shadowColor: const Color(0xFF273C66),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.7,
            maxWidth: MediaQuery.of(context).size.width * 0.97,
          ),
          child: Scrollbar(
            trackVisibility: true,
            thumbVisibility: true,
            thickness: 10,
            interactive: true,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      widget.article.content,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        widget.article.author,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class CommentWidget extends StatelessWidget {
  final String username;
  final String comment;

  const CommentWidget(this.username, this.comment, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 5,
      child: ListTile(
        title: Text(
          comment,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            username,
            style: const TextStyle(fontSize: 14),
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.thumb_up),
          onPressed: () {},
        ),
      ),
    );
  }
}
