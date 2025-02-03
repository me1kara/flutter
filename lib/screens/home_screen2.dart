import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

import '../widgets/webtoon_widget.dart';

class Homescreen2 extends StatelessWidget {
  Homescreen2({super.key});

  final Future<List<WebtoonModel>> webtoons =
      ApiService.getTodaysToons(); // 오늘의 웹툰 목록 api

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //격자 무늬 레이아웃
      appBar: AppBar(
        // 앱 헤더
        elevation: 2,
        title: const Text(
          'Today\'s 툰',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: makeList(snapshot),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      //배열 형태의 위젯
      scrollDirection: Axis.horizontal, // 스크롤 방향성
      itemCount: snapshot.data!.length, // item 카운트는 배열의 길이
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), //패딩
      itemBuilder: (context, index) {
        //위젯화 할 배열
        var webtoon = snapshot.data![index];
        return WebToon(
            title: webtoon.title, id: webtoon.id, thumb: webtoon.thumb);
      },
      separatorBuilder: (context, index) =>
          const SizedBox(width: 40), // 각 배열 사이의 간격
    );
  }
}
