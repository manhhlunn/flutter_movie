import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/const/string.dart';
import 'package:flutter_movie/movie_bloc/movie_bloc.dart';
import 'package:flutter_movie/movie_bloc/movie_event.dart';
import 'package:flutter_movie/movie_bloc/movie_state.dart';
import 'package:flutter_movie/network/network_request.dart';

import '../widget/filter.dart';
import '../widget/movie.dart';

class PageHome extends StatefulWidget {
  final PageType type;

  const PageHome({super.key, required this.type});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  late ScrollController _controller;
  late MovieBloc _movieBloc;

  @override
  void initState() {
    _movieBloc = MovieBloc(pageType: widget.type);
    _movieBloc.add(const MovieFetchEvent(page: 1));
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.hasClients) {
        if (_controller.position.maxScrollExtent == _controller.offset) {
          _movieBloc.add(MovieFetchEvent(page: _movieBloc.state.page + 1));
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    return BlocProvider(
      create: (context) => _movieBloc,
      child: BlocBuilder<MovieBloc, MovieState>(builder: (context, state) {
        return Column(
            mainAxisSize: MainAxisSize.max,
            children: makeChildren(state, query));
      }),
    );
  }

  List<Widget> makeChildren(MovieState state, MediaQueryData query) {
    List<Widget> children = [];
    children.add(SizedBox(height: query.padding.top));
    children.add(const SizedBox(height: 12));
    if (widget.type == PageType.search) {
      children.add(Container(
        alignment: Alignment.center,
        height: 48,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          initialValue: state.keyword,
          textAlignVertical: TextAlignVertical.center,
          onChanged: _handleSearch,
          decoration: InputDecoration(
            isCollapsed: true,
            filled: true,
            fillColor: const Color(0xfff1f1f1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            hintText: StringValue.searchHint,
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: Colors.black,
          ),
        ),
      ));
    } else {
      children.add(FilterWidget(
          values: state.categories,
          label: CategoryItemExtension.labelName,
          value: state.category,
          onChanged: (String value) {
            _handleChangeCategory(value);
          }));
      children.add(const SizedBox(height: 10));
      children.add(FilterWidget(
          values: state.countries,
          label: CountryItemExtension.labelName,
          value: state.country,
          onChanged: (String value) {
            _handleChangeCountry(value);
          }));
    }
    var content = switch (state.status) {
      MovieStateStatus.initial => const CircularProgressIndicator(),
      MovieStateStatus.loading => const CircularProgressIndicator(),
      MovieStateStatus.success => Expanded(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: _contentGridView(state, false))),
      MovieStateStatus.loadingMore => Expanded(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: _contentGridView(state, true))),
      MovieStateStatus.failure => _buildError(state)
    };
    children.add(const SizedBox(height: 12));
    children.add(content);

    return children;
  }

  Widget _contentGridView(MovieState state, bool isLoadMore) {
    return RefreshIndicator(
        onRefresh: _onRefresh,
        child: GridView.builder(
            controller: _controller,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            itemCount: isLoadMore ? state.items.length + 3 : state.items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              childAspectRatio: 0.54,
            ),
            itemBuilder: (context, index) {
              if (index > state.items.length - 1) {
                return const MovieItem(movie: null);
              } else {
                return MovieItem(
                  movie: state.items[index],
                );
              }
            }));
  }

  Future _onRefresh() async {
    return _movieBloc.add(const MovieFetchEvent(page: 1));
  }

  Widget _buildError(MovieState state) {
    return CustomScrollView(
      slivers: [
        RefreshIndicator(
          onRefresh: _onRefresh,
          child: SliverFillRemaining(
            child: Column(
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  size: 60,
                  color: Colors.black26,
                ),
                const SizedBox(height: 20),
                Text(state.failure != null ? "${state.failure}" : "Failed"),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _handleSearch(String input) {
    _movieBloc.add(FilterEvent(filter: Filters.keyword, value: input));
  }

  void _handleChangeCountry(String input) {
    _movieBloc.add(FilterEvent(filter: Filters.country, value: input));
  }

  void _handleChangeCategory(String input) {
    _movieBloc.add(FilterEvent(filter: Filters.category, value: input));
  }
}
