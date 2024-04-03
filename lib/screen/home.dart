import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/network/network_request.dart';
import 'package:flutter_movie/page_bloc/page_bloc.dart';
import 'package:flutter_movie/page_bloc/page_event.dart';
import 'package:flutter_movie/page_bloc/page_state.dart';
import 'package:flutter_movie/routes/generated_routes.dart';
import 'package:flutter_movie/screen/home_page.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final widgetOptions = PageType.values.map((e) => PageHome(type: e)).toList();
  final items = PageType.values
      .map((e) => BottomNavigationBarItem(icon: Icon(e.icon), label: e.name))
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
                selectedItemColor: Colors.pinkAccent,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.black,
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
