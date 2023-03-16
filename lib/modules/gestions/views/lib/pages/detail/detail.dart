import 'package:flutter/material.dart';
import 'package:projet_mars_nan/modules/gestions/views/lib/models/game.dart';
import 'package:projet_mars_nan/modules/gestions/views/lib/pages/detail/widgets/detail_sliver.dart';
import 'package:projet_mars_nan/modules/gestions/views/lib/pages/detail/widgets/info.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(this.game, {super.key});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverPersistentHeader(
          //   delegate: DetailSliverDelegate(
          //     game: game,
          //     expandedHeight: 360,
          //     roundedContainerHeight: 30,
          //   ),
          // ),
          SliverToBoxAdapter(
            child: GameInfo(game),
          )
        ],
      ),
    );
  }
}
