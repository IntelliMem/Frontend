import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imagine_cup/Widget/search_header.dart';
import '../Widget/category_widget.dart';

class SearchScreen extends StatelessWidget {
  final String _userId;

  SearchScreen({super.key, required String userId}) : _userId = userId;

  late TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchHeadWidget(
          label: 'Search',
          controller: controller,
          onSubmitted: () {},
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              color: const Color(0xffF8F8F8),
              constraints: BoxConstraints(
                minHeight:
                    MediaQuery.of(context).size.height, // 최소 높이를 화면 전체로 설정
              ),
              child: Column(
                children: [
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
