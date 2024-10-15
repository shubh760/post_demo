import 'package:flutter/material.dart';
import 'package:mock_app_post/utils/post_card_tile.dart';
import 'package:mock_app_post/view/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Provider.of<HomeViewmodel>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewmodel>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: ListView.builder(
            itemCount: model.dataList.length,
            itemBuilder: (context, index) {
              return PostCardTile(
                data: model.dataList[index],
              );
            }),
      );
    });
  }
}
