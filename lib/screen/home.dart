import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/screen/home_page.dart';
import 'package:flutter_movie_app/util/home_page.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';

import '../page_bloc/page_bloc.dart';
import '../page_bloc/page_event.dart';
import '../page_bloc/page_state.dart';
import '../routes/generated_routes.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final widgetOptions =
      HomePage.values.map((e) => HomePageScreen(page: e)).toList();
  final items = HomePage.values
      .map((e) => BottomNavigationBarItem(
          icon: Transform.scale(
            scaleX: 0.9,
            scaleY: 0.9,
            child: SvgPicture.asset(e.icon),
          ),
          label: e.name,
          activeIcon: Transform.scale(
            scaleX: 1.2,
            scaleY: 1.2,
            child: SvgPicture.asset(e.icon),
          )))
      .toList();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PageBloc(),
      child: BlocConsumer<PageBloc, PageState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: IndexedStack(
                index: state.tabIndex,
                children: widgetOptions,
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: items,
                currentIndex: state.tabIndex,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.black,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                elevation: 4.0,
                onTap: (index) {
                  context.read<PageBloc>().add(TabChange(tabIndex: index));
                },
              ),
              floatingActionButton: SpeedDial(
                animatedIcon: AnimatedIcons.menu_close,
                overlayOpacity: 0.0,
                backgroundColor: Colors.pinkAccent,
                children: [
                  SpeedDialChild(
                      shape: const CircleBorder(),
                      child: const Icon(Icons.history),
                      onTap: () {
                        Navigator.pushNamed(context, RouteGenerator.history);
                      }),
                  SpeedDialChild(
                      shape: const CircleBorder(),
                      child: const Icon(Icons.favorite),
                      onTap: () {
                        Navigator.pushNamed(context, RouteGenerator.favorite);
                      })
                ],
              ));
        },
      ),
    );
  }
}
