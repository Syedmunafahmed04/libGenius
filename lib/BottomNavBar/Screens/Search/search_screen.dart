import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libgenius/BottomNavBar/Screens/Home/book_detail.dart';
import 'package:libgenius/Models/books_model.dart';
import 'package:libgenius/Controllers/book_controller.dart';
import 'package:libgenius/Global/colors.dart';
import 'package:libgenius/Global/global.dart';
import 'package:libgenius/Widgets/my_home_card.dart';
import 'package:libgenius/Widgets/my_textfield.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  final bookController = Get.put(BookController());
  String searchQuery = '';
  bool sortByHighestRating = false;

  Future<void> myInit() async {
    await bookController.getBooks();
  }

  @override
  void initState() {
    super.initState();
    myInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height(0.02),
          Padding(
            padding: myPaddingTop,
            child: Row(
              children: [
                Expanded(
                  child: MyTextField(
                    leading: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Icon(Icons.search, color: whiteColor),
                    ),

                    hintText: 'Search your book',
                    controller: searchController,
                    onChanged: (val) {
                      setState(() {
                        searchQuery = val;
                      });
                    },
                  ),
                ),
                width(0.02),

                PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  onSelected: (value) {
                    setState(() {
                      if (value == 'sort') {
                        sortByHighestRating = true;
                      } else if (value == 'reset') {
                        sortByHighestRating = false;
                      }
                    });
                  },
                  color: Color(0XFF313B3A),
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: 'sort',
                          child: Text(
                            'Sort by Highest Rating',
                            style: TextStyle(color: whiteColor),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'reset',
                          child: Text(
                            'Reset Sorting',
                            style: TextStyle(color: whiteColor),
                          ),
                        ),
                      ],
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: whiteColor.withValues(alpha: 0.2),
                      border: Border.all(
                        color: whiteColor.withValues(alpha: 0.3),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.tune_outlined, color: whiteColor),
                  ),
                ),
              ],
            ),
          ),

          Obx(() {
            final data = bookController.booksModel.value.books;

            if (data == null) {
              return Center(
                child: CircularProgressIndicator(color: mainThemeColor),
              );
            }

            if (data.isEmpty) {
              return Center(child: Text('No Data Found'));
            }

            // Filter books by search query
            final query = searchQuery.trim().toLowerCase();
            List<Book> filteredBooks = [];
            if (query.isNotEmpty) {
              filteredBooks = data.where((book) {
                final titleMatch =
                    book.title?.toLowerCase().contains(query) ?? false;
                final authorMatch =
                    book.author?.toLowerCase().contains(query) ?? false;
                final publisherMatch =
                    book.publisherName?.toLowerCase().contains(query) ?? false;
                return titleMatch || authorMatch || publisherMatch;
              }).toList();
            } else {
              filteredBooks = List<Book>.from(data);
            }

            // Sort books if option is selected
            if (sortByHighestRating) {
              filteredBooks.sort(
                (a, b) => b.averageRating.compareTo(a.averageRating),
              );
            }

            if (filteredBooks.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'No Data Found',
                    style: TextStyle(color: whiteColor),
                  ),
                ),
              );
            }

            return Expanded(
              child: GridView.builder(
                itemCount: filteredBooks.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: Get.height * 0.0011,

                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  final book = filteredBooks[index];

                  return MyHomeCard(
                    bookData: book,
                    onTap: () {
                      Get.to(() => BookDetail(bookData: book));
                    },
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
