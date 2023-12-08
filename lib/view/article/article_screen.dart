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
  List<Article> articles = [];
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  late ArticleViewModel articleViewModel;
  // int itemsPerPage = 8;
  // late final Function(int) onChange;
  // late final List<String> textArray;
  @override
  Widget build(BuildContext context) {
    return BaseView<ArticleViewModel>(
      viewModel: ArticleViewModel(),
      onModelReady: (model) {
        articleViewModel = model;
        Future.delayed(
          Duration.zero,
          () => setState(() {
            articles = articleViewModel.getArticles(articles);
          }),
        );
      },
      onPageBuilder: (context, value) {
        return scaffoldBody;
      },
    );
  }

  Widget get scaffoldBody => Scaffold(
        appBar: appBar,
        body: Column(
          children: [
            tabBarArea,
            buildArticles,
          ],
        ),
      );

  void search(String query) {
    if (query.isEmpty) {
      setState(() {
        isSearching = false;
        articles = articleViewModel.getArticles(articles);
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
        foregroundColor: Colors.white,
        title: const Text(
          "Makaleler",
        ),
        flexibleSpace: const SizedBox(
            height: kToolbarHeight + 50, width: double.maxFinite, child: ColoredBox(color: Colors.orange)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Material(
              borderRadius: BorderRadius.circular(25),
              elevation: 3,
              color: Colors.transparent,
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  search(value);
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.only(left: 16),
                  hintText: "Makale Ara...",
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      isSearching
                          ? InkWell(
                              onTap: () {
                                searchController.clear();
                                isSearching = false;
                                setState(() {
                                  articles = articleViewModel.getArticles(articles);
                                });
                              },
                              child: const Icon(Icons.close))
                          : const Icon(Icons.search),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            //SIRALAMA İŞLEMİ BURADA YAPILACAK.//SIRALAMA MODUNA GÖRE ICON DEĞİŞECEK ÖRN: alfabetik -> ABC iconu
                          },
                          child: const Icon(Icons.sort_rounded)),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  Widget get tabBarArea => SizedBox(
        // width: double.maxFinite,
        child: DefaultTabController(
          length: 3,
          child: TabBar(
            onTap: (value) {
              switch (value) {
                case 0:
                  getAllArticles;
                  break;
                case 1:
                  getHistoryArticles;
                  break;
                case 2:
                  getSavedArticles;
                  break;
                default:
                  break;
              }
            },
            tabs: const [
              Tab(
                icon: Icon(Icons.article_outlined),
              ),
              Tab(
                icon: Icon(Icons.history_rounded),
              ),
              Tab(
                icon: Icon(Icons.bookmark_border_rounded),
              )
            ],
          ),
        ),
      );

  Widget get buildArticles => Expanded(
        child: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (BuildContext context, int i) {
            return Column(
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
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(articles[i].author),
                  ),
                )
              ],
            );
          },
        ),
      );

  void get getAllArticles {
    setState(() {
      articles = articleViewModel.getArticles(articles);
    });
  }

  void get getHistoryArticles {
    setState(() {
      articles = articleViewModel.getArticles(articles);
    });
  }

  void get getSavedArticles {
    setState(() {
      articles = articleViewModel.getArticles(articles);
    });
  }

  // Widget get pageButtons => Padding(
  //       padding: const EdgeInsets.all(15.0),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           CircularArrow(
  //             icon: const Icon(
  //               Icons.keyboard_arrow_left,
  //               color: Colors.white,
  //             ),
  //             onPressed: () {
  //               if (currentPage <= 0) {
  //                 return;
  //               }
  //               setState(() {
  //                 currentPage -= 1;
  //               });
  //             },
  //           ),
  //           Text(
  //             "${currentPage + 1}",
  //             style: const TextStyle(fontWeight: FontWeight.bold),
  //           ),
  //           CircularArrow(
  //             icon: const Icon(
  //               Icons.keyboard_arrow_right,
  //               color: Colors.white,
  //             ),
  //             onPressed: () {
  //               if (currentPage >= (articles.length) / 8 - 1) {
  //                 return;
  //               }
  //               setState(() {
  //                 currentPage += 1;
  //               });
  //             },
  //           ),
  //         ],
  //       ),
  //     );
}

// class CircularArrow extends StatelessWidget {
//   final Icon icon;
//   final Function() onPressed;
//   const CircularArrow({required this.icon, required this.onPressed, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: onPressed,
//       icon: CircleAvatar(backgroundColor: const Color(0xFFED8C42), child: icon),
//       iconSize: 25,
//     );
//   }
// }
