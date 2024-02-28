import 'package:e_commerce_app/data/entity/recording_entity.dart';
import 'package:e_commerce_app/pages/index/home/components/header_swiper.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen(this.data, {super.key});

  RecordingsResponse data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // HeaderBar
        Expanded(
            child: CustomScrollView(
          slivers: [
            HeaderSwiper(
              swiperList: data.recordings,
            ),
          ],
        ))
      ],
    );
  }
}
