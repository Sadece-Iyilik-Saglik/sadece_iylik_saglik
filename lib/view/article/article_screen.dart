import 'package:flutter/material.dart';
import 'package:sadece_iylik_saglik/core/viewmodel/article_view_model.dart';

import '../../core/base/view/base_view.dart';
import '../../core/model/article_model.dart';

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
  int itemsPerPage = 9;

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = currentPage * itemsPerPage;
                    i < (currentPage + 1) * itemsPerPage && i < articles.length;
                    i++)
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: ListTile(
                          title: Text(
                            articles[i].title,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(articles[i].author),
                        ),
                      ),
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          if (currentPage > 0) {
                            setState(() {
                              currentPage--;
                            });
                          }
                        },
                        child: const Text("Önceki"),
                      ),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () {
                          if ((currentPage + 1) * itemsPerPage <
                              articles.length) {
                            setState(() {
                              currentPage++;
                            });
                          }
                        },
                        child: const Text("Sonraki"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
          preferredSize: const Size.fromHeight(56.0),
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
}
