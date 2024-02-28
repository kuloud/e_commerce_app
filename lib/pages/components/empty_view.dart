import 'package:e_commerce_app/generated/l10n.dart';
import 'package:e_commerce_app/styles/common_styles.dart';
import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  EmptyView({super.key, this.textColor});

  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -0.35),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('assets/images/common/empty_view.png',
            //     width: 195, height: 137),
            const SizedBox(
              width: 16,
              height: 16,
            ),
            Text(
              S.of(context).noData,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 20,
                  fontFamily: fontFamilyGillSans, // 单独自定义字体
                  color: textColor ?? LightTheme.textColor),
            ),
          ]),
    );
  }
}
