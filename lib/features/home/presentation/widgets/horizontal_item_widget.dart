import 'package:artifitia_test/core/shared/widget/each_item_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/service_locator.dart';
import '../../domain/usecase/home_usecases.dart';

class HorizontalItemWidget extends StatelessWidget {
  const HorizontalItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getIt<HomeUsecases>().getItems(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final data = snapshot.data?[index];
                return EachItemCardWidget(data: data);
              },
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Row(
              children: List.generate(
            2,
            (index) => Container(
              width: MediaQuery.sizeOf(context).width * 0.2,
              height: 60,
              decoration: BoxDecoration(color: Colors.white12),
            ),
          ).animate().shimmer(color: Colors.white));
        } else {
          return SizedBox();
        }
      },
    );
  }
}
