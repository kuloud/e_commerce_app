import 'package:dio/dio.dart';
import 'package:e_commerce_app/data/entity/recording_entity.dart';
import 'package:e_commerce_app/network/http/api.dart';
import 'package:e_commerce_app/pages/index/home/components/home_screen.dart';
import 'package:e_commerce_app/pages/index/home/components/skeleton_loading_screen.dart';
import 'package:e_commerce_app/pages/not_found_page.dart';
import 'package:e_commerce_app/utils/logger.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cancelToken = CancelToken();
  late Future<RecordingsResponse> _future;

  @override
  void initState() {
    super.initState();
    _future = Api.xenoCanto
        .recordings({"query": "cnt:brazil"}, cancelToken: cancelToken);
  }

  @override
  void dispose() {
    Api.cancelRequests(cancelToken);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              logger.d('error---${snapshot.error}');
              // 此处展示EmptyView
              return const NotFoundPage();
            } else {
              logger.d('${snapshot.connectionState}---${snapshot.data}');
              return HomeScreen(snapshot.data!);
            }
          } else {
            return const SkeletonLoadingScreen();
          }
        });
  }
}
