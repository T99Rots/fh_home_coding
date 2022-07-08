import 'package:fh_home_coding/components/room_card.dart';
import 'package:fh_home_coding/models/area_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<AreaModel>();

    return Scaffold(
      backgroundColor: const Color(0xffe8e8e8),
      appBar: AppBar(
        backgroundColor: const Color(0xff212121),
        title: const Text('Future Home coding assignment'),
      ),
      body: model.loaded? Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: model.areas.map((area) => ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 1160
            ),
            child: RoomCard(
              area: area,
            )
          )).toList()
        ),
      ): const Center(
        child: CircularProgressIndicator(
          color: Color(0xff212121),
        )
      ),
    );
  }
}