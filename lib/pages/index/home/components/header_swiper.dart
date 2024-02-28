import 'package:card_swiper/card_swiper.dart';
import 'package:e_commerce_app/data/entity/recording_entity.dart';
import 'package:flutter/widgets.dart';

class HeaderSwiper extends StatelessWidget {
  const HeaderSwiper({super.key, required this.swiperList});

  final List<RecordingEntity> swiperList;

  @override
  Widget build(BuildContext context) {
    var container = Container(
      margin: const EdgeInsets.all(10),
      height: 160,
      child: Swiper(
        itemWidth: double.infinity,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Image.network(
              swiperList[index].sonograms.values.first,
              fit: BoxFit.fill,
            ),
          );
        },
        itemCount: swiperList.length,
        autoplay: true,
        onTap: (int index) {
          // _goDetail(context, swiperList[index]);
        },
      ),
    );
    return SliverToBoxAdapter(
      child: (swiperList.isNotEmpty)
          ? container
          : const SizedBox(
              height: 160,
            ),
    );
  }
}
