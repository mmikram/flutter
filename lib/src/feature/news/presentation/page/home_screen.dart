import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocr_ovd_mobile/src/feature/news/data/pojo/news.dart';
import 'package:ocr_ovd_mobile/src/feature/news/presentation/bloc/news_bloc.dart';
import 'package:ocr_ovd_mobile/src/feature/news/presentation/bloc/news_state.dart';
import 'package:ocr_ovd_mobile/src/feature/news/presentation/widget/news_cell.dart';
import 'package:gap/gap.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Latest News'),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (_, state) {
          if (state is NewsLoading) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state is NewsDone) {
            return ListView.builder(itemBuilder: (context, index) {

              return NewsCell(
                  news: state.newses[index],
                  onNewsPressed: (news) => _onNewsPressed(context, news));
            },
            itemCount: state.newses!.length);
          }

          return const SizedBox();
        },
      ),
    );
  }

  void _onNewsPressed(BuildContext context, News news) {
    // Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }
}
