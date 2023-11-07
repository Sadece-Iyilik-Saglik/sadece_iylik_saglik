import 'package:flutter/material.dart';

import '../../core/model/article_model.dart';

class ArticleDetailScreen extends StatefulWidget {
  const ArticleDetailScreen({super.key, required this.article});
  final Article article;

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

//
// class ArticleDetailScreen extends StatefulWidget {
//
//
//   const ArticleDetailScreen(this.article, {super.key});
//
//   @override
//   _ArticleDetailScreenState createState() => _ArticleDetailScreenState();
// }

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  TextEditingController commentController = TextEditingController();
  List<String> comments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF273C66),
        title: Text(
          widget.article.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              widget.article.author,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              widget.article.content,
              style: const TextStyle(fontSize: 19),
            ),
            const SizedBox(height: 24),
            const Text(
              'Yorumlar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return CommentWidget(comments[index], "kullanıcı adı");
              },
            ),
            const SizedBox(height: 12),
            TextField(
              controller: commentController,
              decoration: InputDecoration(
                hintText: 'Yorum yap',
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xFFED8C42), style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xFFED8C42),
                      style: BorderStyle.solid,
                      width: 2.5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
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
          ],
        ),
      ),
    );
  }
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
          username,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            comment,
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
