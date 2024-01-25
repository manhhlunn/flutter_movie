
import 'package:flutter/material.dart';
import 'package:flutter_movie/const/string.dart';
import 'package:flutter_movie/model/movie.dart';
import 'package:flutter_movie/network/network_request.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'filter.dart';
import 'movie.dart';

class PageHome extends StatefulWidget {
  final PageType type;

  const PageHome({super.key, required this.type});

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  late Future<MovieResponse> futureMovie;
  final PagingController<int, Movie> _pagingController =
  PagingController(firstPageKey: 1);

  String _keyword = '';
  String _genre = '';
  String _country = '';

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await NetworkRequest.fetchList(
          widget.type, pageKey, _genre, _country, _keyword);
      final totalItems =
          newItems.props?.data?.params?.pagination?.totalItems ?? 0;
      final totalItemsPerPage =
          newItems.props?.data?.params?.pagination?.totalItemsPerPage ?? 0;
      final maxPage = totalItems ~/ totalItemsPerPage;
      final isLastPage = pageKey >= maxPage;
      final items = newItems.props?.data?.items ?? [];
      if (isLastPage) {
        _pagingController.appendLastPage(items);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(items, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    double width = query.size.width;
    double height = query.size.height;
    int count;
    if (width > height) {
      double posterHeight = height / 3;
      double posterWidth = (posterHeight * 2) / 3;
      count = width ~/ posterWidth;
    } else {
      double posterHeight = height / 5;
      double posterWidth = (posterHeight * 2) / 3;
      count = width ~/ posterWidth;
    }

    List<Widget> children = [];
    children.add(SizedBox(height: query.padding.top));
    children.add(const SizedBox(height: 10));
    if (widget.type == PageType.search) {
      children.add(Container(
        alignment: Alignment.center,
        height: 48,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
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
          values: {for (var v in CategoryItem.values) v.name: v.param},
          label: CategoryItemExtension.labelName,
          onChanged: (String value) {
            _handleChangeGenre(value);
          }));
      children.add(const SizedBox(height: 10));
      children.add(FilterWidget(
          values: {for (var v in CountryItem.values) v.name: v.param},
          label: CountryItemExtension.labelName,
          onChanged: (String value) {
            _handleChangeCountry(value);
          }));
    }

    children.add(const SizedBox(height: 10));
    children.add(Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: RefreshIndicator(
            onRefresh: () => Future.sync(
                  () => _pagingController.refresh(),
            ),
            child: PagedGridView<int, Movie>(
              pagingController: _pagingController,
              showNewPageProgressIndicatorAsGridChild: true,
              showNewPageErrorIndicatorAsGridChild: true,
              showNoMoreItemsIndicatorAsGridChild: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: count,
                  childAspectRatio: 2 / 3.5,
                  crossAxisSpacing: 10),
              builderDelegate: PagedChildBuilderDelegate<Movie>(
                itemBuilder: (context, item, index) => MovieItem(
                  movie: item,
                ),
              ),
            )),
      ),
    ));

    return Column(mainAxisSize: MainAxisSize.max, children: children);
  }

  void _handleSearch(String input) {
    _keyword = input;
    Future.sync(
          () => _pagingController.refresh(),
    );
  }

  void _handleChangeCountry(String input) {
    _country = input;
    Future.sync(
          () => _pagingController.refresh(),
    );
  }

  void _handleChangeGenre(String input) {
    _genre = input;
    Future.sync(
          () => _pagingController.refresh(),
    );
  }
}