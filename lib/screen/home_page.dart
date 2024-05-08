import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/entity/app_movie.dart';
import 'package:flutter_movie_app/util/home_page.dart';
import 'package:flutter_movie_app/vieon_bloc/vieon_movie_bloc.dart';

import '../network/network_util.dart';
import '../o_movie_bloc/o_movie_bloc.dart';
import '../widget/filter.dart';
import '../widget/movie.dart';

class HomePageScreen extends StatefulWidget {
  final HomePage page;

  const HomePageScreen({super.key, required this.page});

  @override
  State<HomePageScreen> createState() {
    return _HomePageScreenState();
  }
}

class _HomePageScreenState extends State<HomePageScreen> {
  late ScrollController _controller;
  late TextEditingController _searchController;
  late OMovieBloc _oMovieBloc;
  late VieOnMovieBloc _vieOnMovieBloc;

  @override
  void initState() {
    _oMovieBloc = OMovieBloc();
    _vieOnMovieBloc = VieOnMovieBloc();
    _controller = ScrollController();
    _searchController = TextEditingController();
    switch (widget.page) {
      case HomePage.ophim:
        _oMovieBloc.add(const MovieFetchEvent(page: 1));
        break;
      case HomePage.vieon:
        _vieOnMovieBloc.add(const GetMoreMenuItems(page: 1));
        break;
    }
    _controller.addListener(() {
      if (_controller.hasClients) {
        if (_controller.position.maxScrollExtent == _controller.offset) {
          switch (widget.page) {
            case HomePage.ophim:
              _oMovieBloc
                  .add(MovieFetchEvent(page: _oMovieBloc.state.page + 1));
              break;
            case HomePage.vieon:
              _vieOnMovieBloc
                  .add(GetMoreMenuItems(page: _vieOnMovieBloc.state.page + 1));
              break;
          }
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
    switch (widget.page) {
      case HomePage.ophim:
        return BlocProvider(
          create: (context) => _oMovieBloc,
          child: BlocConsumer<OMovieBloc, OPhimMovieState>(
            builder: (context, state) {
              return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: makeChildren(state, query));
            },
            listener: (BuildContext context, OPhimMovieState state) {
              _searchController.text = state.keyword;
            },
          ),
        );
      case HomePage.vieon:
        return BlocProvider(
          create: (context) => _vieOnMovieBloc,
          child: BlocConsumer<VieOnMovieBloc, VieOnMovieState>(
            builder: (context, state) {
              return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: makeChildrenVieOn(state, query));
            },
            listener: (BuildContext context, VieOnMovieState state) {
              _searchController.text = state.keyword;
            },
          ),
        );
    }
  }

  List<Widget> makeChildren(OPhimMovieState state, MediaQueryData query) {
    List<Widget> children = [];
    children.add(SizedBox(height: query.padding.top));
    children.add(const SizedBox(height: 12));

    children.add(Container(
      alignment: Alignment.center,
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: _searchController,
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
          hintText: "Search...",
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: Colors.black,
        ),
      ),
    ));
    children.add(const SizedBox(height: 10));
    children.add(FilterWidget(
        values: state.pageTypes,
        label: PageTypeExt.labelName,
        value: state.keyword.isNotEmpty ? "" : state.pageType,
        onChanged: (String value) {
          _handleChangePageType(value);
        }));
    children.add(const SizedBox(height: 10));
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
      MovieStateStatus.failure => _buildError(state.failure)
    };
    children.add(const SizedBox(height: 12));
    children.add(content);

    return children;
  }

  List<Widget> makeChildrenVieOn(VieOnMovieState state, MediaQueryData query) {
    List<Widget> children = [];
    children.add(SizedBox(height: query.padding.top));
    children.add(const SizedBox(height: 12));

    children.add(Container(
      alignment: Alignment.center,
      height: 48,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: _searchController,
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
          hintText: "Search...",
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: Colors.black,
        ),
      ),
    ));
    children.add(const SizedBox(height: 10));
    children.add(FilterWidget(
        values: state.menuItems ?? {},
        label: PageTypeExt.labelName,
        value: state.keyword.isNotEmpty ? "" : state.menu ?? '',
        onChanged: (String value) {
          _handleChangeMenu(value);
        }));

    var content = switch (state.status) {
      MovieStateStatus.initial => const CircularProgressIndicator(),
      MovieStateStatus.loading => const CircularProgressIndicator(),
      MovieStateStatus.success => Expanded(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: _contentGridViewVieOn(state, false))),
      MovieStateStatus.loadingMore => Expanded(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: _contentGridViewVieOn(state, true))),
      MovieStateStatus.failure => _buildError(state.failure)
    };
    children.add(const SizedBox(height: 12));
    children.add(content);

    return children;
  }

  Widget _contentGridView(OPhimMovieState state, bool isLoadMore) {
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
                  movie: Movie.fromOMovie(state.items[index]),
                );
              }
            }));
  }

  Widget _contentGridViewVieOn(VieOnMovieState state, bool isLoadMore) {
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
                  movie: Movie.fromVieOnItem(state.items[index]),
                );
              }
            }));
  }

  Future _onRefresh() async {
    switch (widget.page) {
      case HomePage.ophim:
        _oMovieBloc.add(const MovieFetchEvent(page: 1));
        break;
      case HomePage.vieon:
        _vieOnMovieBloc.add(const GetMoreMenuItems(page: 1));
        break;
    }
  }

  Widget _buildError(Exception? exception) {
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
                Text(exception != null ? exception.toString() : "Failed"),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _handleSearch(String input) {
    switch (widget.page) {
      case HomePage.ophim:
        _oMovieBloc.add(FilterEvent(filter: Filters.keyword, value: input));
        break;
      case HomePage.vieon:
        _vieOnMovieBloc.add(SearchEvent(keyword: input));
        break;
    }
  }

  void _handleChangeCountry(String input) {
    _oMovieBloc.add(FilterEvent(filter: Filters.country, value: input));
  }

  void _handleChangeCategory(String input) {
    _oMovieBloc.add(FilterEvent(filter: Filters.category, value: input));
  }

  void _handleChangePageType(String input) {
    _oMovieBloc.add(FilterEvent(filter: Filters.pageType, value: input));
  }

  void _handleChangeMenu(String input) {
    _vieOnMovieBloc.add(ChangeMenuEvent(value: input));
  }
}
