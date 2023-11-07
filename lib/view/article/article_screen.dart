import 'package:flutter/material.dart';
import 'package:sadece_iylik_saglik/core/viewmodel/article_view_model.dart';

import '../../core/base/view/base_view.dart';
import '../../core/model/article_model.dart';
import 'article_detail_screen.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  State<ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  List<Article> articles = ArticleViewModel.allArticles;
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  int currentPage = 0;
  int itemsPerPage = 8;
  late final Function(int) onChange;
  late final List<String> textArray;
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: "",
      onModelReady: (model) {},
      onPageBuilder: (context, value) {
        return scaffoldBody;
      },
    );
  }

  Widget get scaffoldBody => Scaffold(
        appBar: appBar,
        body: SafeArea(
          child: Column(
            children: [
              allArticles,
              pageButtons,
            ],
          ),
        ),
      );

  void search(String query) {
    if (query.isEmpty) {
      setState(() {
        isSearching = false;
        articles = ArticleViewModel.allArticles;
      });
    } else {
      List<Article> searchResults = ArticleViewModel.allArticles
          .where((article) =>
              article.title.toLowerCase().contains(query.toLowerCase()) ||
              article.author.toLowerCase().contains(query.toLowerCase()))
          .toList();
      setState(() {
        isSearching = true;
        articles = searchResults;
      });
    }
  }

  PreferredSizeWidget get appBar => AppBar(
        centerTitle: true,
        title: const Text(
          "Sadece İyilik Sağlık",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF273C66),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              controller: searchController,
              onChanged: (value) {
                search(value);
              },
              decoration: InputDecoration(
                helperText: "Makale yazarı veya içerik aratabilirsin",
                helperStyle: const TextStyle(color: Colors.white70),
                hintText: "Makale Ara...",
                hintStyle: const TextStyle(color: Colors.white70),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                suffixIcon: isSearching
                    ? IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          searchController.clear();
                          isSearching = false;
                          setState(() {
                            articles = ArticleViewModel.allArticles;
                          });
                        },
                      )
                    : null,
              ),
            ),
          ),
        ),
      );

  Widget get allArticles => Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = currentPage * itemsPerPage;
                  i < (currentPage + 1) * itemsPerPage && i < articles.length;
                  i++)
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Makale detay sayfasına yönlendirme yapılacak.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ArticleDetailScreen(article: articles[i]);
                            },
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(
                          articles[i].title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(articles[i].author),
                      ),
                    )
                  ],
                ),
            ],
          ),
        ),
      );

  Widget get pageButtons => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularArrow(
              icon: const Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
              ),
              onPressed: () {
                if (currentPage <= 0) {
                  return;
                }
                setState(() {
                  currentPage -= 1;
                });
              },
            ),
            Text(
              "${currentPage + 1}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            CircularArrow(
              icon: const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
              onPressed: () {
                if (currentPage >= (articles.length) / 8 - 1) {
                  return;
                }
                setState(() {
                  currentPage += 1;
                });
              },
            ),
          ],
        ),
      );
}

class CircularArrow extends StatelessWidget {
  final Icon icon;
  final Function() onPressed;
  const CircularArrow({required this.icon, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: CircleAvatar(backgroundColor: Color(0xFFED8C42), child: icon),
      iconSize: 25,
    );
  }
}
