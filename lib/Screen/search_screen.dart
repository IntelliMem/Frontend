import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagine_cup/Widget/search_header.dart';
import '../Widget/category_widget.dart';

class SearchScreen extends StatelessWidget {
  final String _userId;

  SearchScreen({super.key, required String userId}) : _userId = userId;

  //categoryWidgets가 동적 데이터에 의존하면 build 함수 안으로 넣기
  final List<CategoryWidget> categoryWidgets = [
    CategoryWidget(
      color: const Color(0xffF37676),
      categoryName: "Me",
      categoryImage: 'assets/MeIcon.png',
    ),
    CategoryWidget(
      color: const Color(0xffF9A369),
      categoryName: "Family",
      categoryImage: 'assets/FamilyIcon.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF8F8F8),
      child: Column(
        children: [
          SearchHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: const Color(0xffF8F8F8),
                child: Column(
                  children: categoryWidgets,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
