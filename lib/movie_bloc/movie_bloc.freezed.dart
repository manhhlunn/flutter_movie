// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MovieEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PageType pageType, String genre, String country, String keyword)
        loadStarted,
    required TResult Function(PageType pageType) loadMoreStarted,
    required TResult Function(String slug) selectChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PageType pageType, String genre, String country, String keyword)?
        loadStarted,
    TResult? Function(PageType pageType)? loadMoreStarted,
    TResult? Function(String slug)? selectChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageType pageType, String genre, String country, String keyword)?
        loadStarted,
    TResult Function(PageType pageType)? loadMoreStarted,
    TResult Function(String slug)? selectChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItemLoadStarted value) loadStarted,
    required TResult Function(ItemLoadMoreStarted value) loadMoreStarted,
    required TResult Function(ItemSelectChanged value) selectChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ItemLoadStarted value)? loadStarted,
    TResult? Function(ItemLoadMoreStarted value)? loadMoreStarted,
    TResult? Function(ItemSelectChanged value)? selectChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemLoadStarted value)? loadStarted,
    TResult Function(ItemLoadMoreStarted value)? loadMoreStarted,
    TResult Function(ItemSelectChanged value)? selectChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieEventCopyWith<$Res> {
  factory $MovieEventCopyWith(
          MovieEvent value, $Res Function(MovieEvent) then) =
      _$MovieEventCopyWithImpl<$Res, MovieEvent>;
}

/// @nodoc
class _$MovieEventCopyWithImpl<$Res, $Val extends MovieEvent>
    implements $MovieEventCopyWith<$Res> {
  _$MovieEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ItemLoadStartedImplCopyWith<$Res> {
  factory _$$ItemLoadStartedImplCopyWith(_$ItemLoadStartedImpl value,
          $Res Function(_$ItemLoadStartedImpl) then) =
      __$$ItemLoadStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PageType pageType, String genre, String country, String keyword});
}

/// @nodoc
class __$$ItemLoadStartedImplCopyWithImpl<$Res>
    extends _$MovieEventCopyWithImpl<$Res, _$ItemLoadStartedImpl>
    implements _$$ItemLoadStartedImplCopyWith<$Res> {
  __$$ItemLoadStartedImplCopyWithImpl(
      _$ItemLoadStartedImpl _value, $Res Function(_$ItemLoadStartedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageType = null,
    Object? genre = null,
    Object? country = null,
    Object? keyword = null,
  }) {
    return _then(_$ItemLoadStartedImpl(
      pageType: null == pageType
          ? _value.pageType
          : pageType // ignore: cast_nullable_to_non_nullable
              as PageType,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      keyword: null == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ItemLoadStartedImpl implements ItemLoadStarted {
  const _$ItemLoadStartedImpl(
      {required this.pageType,
      required this.genre,
      required this.country,
      required this.keyword});

  @override
  final PageType pageType;
  @override
  final String genre;
  @override
  final String country;
  @override
  final String keyword;

  @override
  String toString() {
    return 'MovieEvent.loadStarted(pageType: $pageType, genre: $genre, country: $country, keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemLoadStartedImpl &&
            (identical(other.pageType, pageType) ||
                other.pageType == pageType) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, pageType, genre, country, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemLoadStartedImplCopyWith<_$ItemLoadStartedImpl> get copyWith =>
      __$$ItemLoadStartedImplCopyWithImpl<_$ItemLoadStartedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PageType pageType, String genre, String country, String keyword)
        loadStarted,
    required TResult Function(PageType pageType) loadMoreStarted,
    required TResult Function(String slug) selectChanged,
  }) {
    return loadStarted(pageType, genre, country, keyword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PageType pageType, String genre, String country, String keyword)?
        loadStarted,
    TResult? Function(PageType pageType)? loadMoreStarted,
    TResult? Function(String slug)? selectChanged,
  }) {
    return loadStarted?.call(pageType, genre, country, keyword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageType pageType, String genre, String country, String keyword)?
        loadStarted,
    TResult Function(PageType pageType)? loadMoreStarted,
    TResult Function(String slug)? selectChanged,
    required TResult orElse(),
  }) {
    if (loadStarted != null) {
      return loadStarted(pageType, genre, country, keyword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItemLoadStarted value) loadStarted,
    required TResult Function(ItemLoadMoreStarted value) loadMoreStarted,
    required TResult Function(ItemSelectChanged value) selectChanged,
  }) {
    return loadStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ItemLoadStarted value)? loadStarted,
    TResult? Function(ItemLoadMoreStarted value)? loadMoreStarted,
    TResult? Function(ItemSelectChanged value)? selectChanged,
  }) {
    return loadStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemLoadStarted value)? loadStarted,
    TResult Function(ItemLoadMoreStarted value)? loadMoreStarted,
    TResult Function(ItemSelectChanged value)? selectChanged,
    required TResult orElse(),
  }) {
    if (loadStarted != null) {
      return loadStarted(this);
    }
    return orElse();
  }
}

abstract class ItemLoadStarted implements MovieEvent {
  const factory ItemLoadStarted(
      {required final PageType pageType,
      required final String genre,
      required final String country,
      required final String keyword}) = _$ItemLoadStartedImpl;

  PageType get pageType;
  String get genre;
  String get country;
  String get keyword;
  @JsonKey(ignore: true)
  _$$ItemLoadStartedImplCopyWith<_$ItemLoadStartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ItemLoadMoreStartedImplCopyWith<$Res> {
  factory _$$ItemLoadMoreStartedImplCopyWith(_$ItemLoadMoreStartedImpl value,
          $Res Function(_$ItemLoadMoreStartedImpl) then) =
      __$$ItemLoadMoreStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PageType pageType});
}

/// @nodoc
class __$$ItemLoadMoreStartedImplCopyWithImpl<$Res>
    extends _$MovieEventCopyWithImpl<$Res, _$ItemLoadMoreStartedImpl>
    implements _$$ItemLoadMoreStartedImplCopyWith<$Res> {
  __$$ItemLoadMoreStartedImplCopyWithImpl(_$ItemLoadMoreStartedImpl _value,
      $Res Function(_$ItemLoadMoreStartedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageType = null,
  }) {
    return _then(_$ItemLoadMoreStartedImpl(
      pageType: null == pageType
          ? _value.pageType
          : pageType // ignore: cast_nullable_to_non_nullable
              as PageType,
    ));
  }
}

/// @nodoc

class _$ItemLoadMoreStartedImpl implements ItemLoadMoreStarted {
  const _$ItemLoadMoreStartedImpl({required this.pageType});

  @override
  final PageType pageType;

  @override
  String toString() {
    return 'MovieEvent.loadMoreStarted(pageType: $pageType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemLoadMoreStartedImpl &&
            (identical(other.pageType, pageType) ||
                other.pageType == pageType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemLoadMoreStartedImplCopyWith<_$ItemLoadMoreStartedImpl> get copyWith =>
      __$$ItemLoadMoreStartedImplCopyWithImpl<_$ItemLoadMoreStartedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PageType pageType, String genre, String country, String keyword)
        loadStarted,
    required TResult Function(PageType pageType) loadMoreStarted,
    required TResult Function(String slug) selectChanged,
  }) {
    return loadMoreStarted(pageType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PageType pageType, String genre, String country, String keyword)?
        loadStarted,
    TResult? Function(PageType pageType)? loadMoreStarted,
    TResult? Function(String slug)? selectChanged,
  }) {
    return loadMoreStarted?.call(pageType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageType pageType, String genre, String country, String keyword)?
        loadStarted,
    TResult Function(PageType pageType)? loadMoreStarted,
    TResult Function(String slug)? selectChanged,
    required TResult orElse(),
  }) {
    if (loadMoreStarted != null) {
      return loadMoreStarted(pageType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItemLoadStarted value) loadStarted,
    required TResult Function(ItemLoadMoreStarted value) loadMoreStarted,
    required TResult Function(ItemSelectChanged value) selectChanged,
  }) {
    return loadMoreStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ItemLoadStarted value)? loadStarted,
    TResult? Function(ItemLoadMoreStarted value)? loadMoreStarted,
    TResult? Function(ItemSelectChanged value)? selectChanged,
  }) {
    return loadMoreStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemLoadStarted value)? loadStarted,
    TResult Function(ItemLoadMoreStarted value)? loadMoreStarted,
    TResult Function(ItemSelectChanged value)? selectChanged,
    required TResult orElse(),
  }) {
    if (loadMoreStarted != null) {
      return loadMoreStarted(this);
    }
    return orElse();
  }
}

abstract class ItemLoadMoreStarted implements MovieEvent {
  const factory ItemLoadMoreStarted({required final PageType pageType}) =
      _$ItemLoadMoreStartedImpl;

  PageType get pageType;
  @JsonKey(ignore: true)
  _$$ItemLoadMoreStartedImplCopyWith<_$ItemLoadMoreStartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ItemSelectChangedImplCopyWith<$Res> {
  factory _$$ItemSelectChangedImplCopyWith(_$ItemSelectChangedImpl value,
          $Res Function(_$ItemSelectChangedImpl) then) =
      __$$ItemSelectChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String slug});
}

/// @nodoc
class __$$ItemSelectChangedImplCopyWithImpl<$Res>
    extends _$MovieEventCopyWithImpl<$Res, _$ItemSelectChangedImpl>
    implements _$$ItemSelectChangedImplCopyWith<$Res> {
  __$$ItemSelectChangedImplCopyWithImpl(_$ItemSelectChangedImpl _value,
      $Res Function(_$ItemSelectChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
  }) {
    return _then(_$ItemSelectChangedImpl(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ItemSelectChangedImpl implements ItemSelectChanged {
  const _$ItemSelectChangedImpl({required this.slug});

  @override
  final String slug;

  @override
  String toString() {
    return 'MovieEvent.selectChanged(slug: $slug)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemSelectChangedImpl &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemSelectChangedImplCopyWith<_$ItemSelectChangedImpl> get copyWith =>
      __$$ItemSelectChangedImplCopyWithImpl<_$ItemSelectChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PageType pageType, String genre, String country, String keyword)
        loadStarted,
    required TResult Function(PageType pageType) loadMoreStarted,
    required TResult Function(String slug) selectChanged,
  }) {
    return selectChanged(slug);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PageType pageType, String genre, String country, String keyword)?
        loadStarted,
    TResult? Function(PageType pageType)? loadMoreStarted,
    TResult? Function(String slug)? selectChanged,
  }) {
    return selectChanged?.call(slug);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageType pageType, String genre, String country, String keyword)?
        loadStarted,
    TResult Function(PageType pageType)? loadMoreStarted,
    TResult Function(String slug)? selectChanged,
    required TResult orElse(),
  }) {
    if (selectChanged != null) {
      return selectChanged(slug);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItemLoadStarted value) loadStarted,
    required TResult Function(ItemLoadMoreStarted value) loadMoreStarted,
    required TResult Function(ItemSelectChanged value) selectChanged,
  }) {
    return selectChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ItemLoadStarted value)? loadStarted,
    TResult? Function(ItemLoadMoreStarted value)? loadMoreStarted,
    TResult? Function(ItemSelectChanged value)? selectChanged,
  }) {
    return selectChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemLoadStarted value)? loadStarted,
    TResult Function(ItemLoadMoreStarted value)? loadMoreStarted,
    TResult Function(ItemSelectChanged value)? selectChanged,
    required TResult orElse(),
  }) {
    if (selectChanged != null) {
      return selectChanged(this);
    }
    return orElse();
  }
}

abstract class ItemSelectChanged implements MovieEvent {
  const factory ItemSelectChanged({required final String slug}) =
      _$ItemSelectChangedImpl;

  String get slug;
  @JsonKey(ignore: true)
  _$$ItemSelectChangedImplCopyWith<_$ItemSelectChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MovieState {
  ItemStateStatus get status => throw _privateConstructorUsedError;
  List<Movie> get items => throw _privateConstructorUsedError;
  int get selectedItemIndex => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieStateCopyWith<MovieState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieStateCopyWith<$Res> {
  factory $MovieStateCopyWith(
          MovieState value, $Res Function(MovieState) then) =
      _$MovieStateCopyWithImpl<$Res, MovieState>;
  @useResult
  $Res call(
      {ItemStateStatus status,
      List<Movie> items,
      int selectedItemIndex,
      int page,
      bool canLoadMore,
      Exception? error});
}

/// @nodoc
class _$MovieStateCopyWithImpl<$Res, $Val extends MovieState>
    implements $MovieStateCopyWith<$Res> {
  _$MovieStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? items = null,
    Object? selectedItemIndex = null,
    Object? page = null,
    Object? canLoadMore = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ItemStateStatus,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      selectedItemIndex: null == selectedItemIndex
          ? _value.selectedItemIndex
          : selectedItemIndex // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieStateImplCopyWith<$Res>
    implements $MovieStateCopyWith<$Res> {
  factory _$$MovieStateImplCopyWith(
          _$MovieStateImpl value, $Res Function(_$MovieStateImpl) then) =
      __$$MovieStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ItemStateStatus status,
      List<Movie> items,
      int selectedItemIndex,
      int page,
      bool canLoadMore,
      Exception? error});
}

/// @nodoc
class __$$MovieStateImplCopyWithImpl<$Res>
    extends _$MovieStateCopyWithImpl<$Res, _$MovieStateImpl>
    implements _$$MovieStateImplCopyWith<$Res> {
  __$$MovieStateImplCopyWithImpl(
      _$MovieStateImpl _value, $Res Function(_$MovieStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? items = null,
    Object? selectedItemIndex = null,
    Object? page = null,
    Object? canLoadMore = null,
    Object? error = freezed,
  }) {
    return _then(_$MovieStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ItemStateStatus,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      selectedItemIndex: null == selectedItemIndex
          ? _value.selectedItemIndex
          : selectedItemIndex // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$MovieStateImpl implements _MovieState {
  const _$MovieStateImpl(
      {this.status = ItemStateStatus.initial,
      final List<Movie> items = const [],
      this.selectedItemIndex = 0,
      this.page = 1,
      this.canLoadMore = true,
      this.error})
      : _items = items;

  @override
  @JsonKey()
  final ItemStateStatus status;
  final List<Movie> _items;
  @override
  @JsonKey()
  List<Movie> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int selectedItemIndex;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool canLoadMore;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'MovieState(status: $status, items: $items, selectedItemIndex: $selectedItemIndex, page: $page, canLoadMore: $canLoadMore, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.selectedItemIndex, selectedItemIndex) ||
                other.selectedItemIndex == selectedItemIndex) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_items),
      selectedItemIndex,
      page,
      canLoadMore,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieStateImplCopyWith<_$MovieStateImpl> get copyWith =>
      __$$MovieStateImplCopyWithImpl<_$MovieStateImpl>(this, _$identity);
}

abstract class _MovieState implements MovieState {
  const factory _MovieState(
      {final ItemStateStatus status,
      final List<Movie> items,
      final int selectedItemIndex,
      final int page,
      final bool canLoadMore,
      final Exception? error}) = _$MovieStateImpl;

  @override
  ItemStateStatus get status;
  @override
  List<Movie> get items;
  @override
  int get selectedItemIndex;
  @override
  int get page;
  @override
  bool get canLoadMore;
  @override
  Exception? get error;
  @override
  @JsonKey(ignore: true)
  _$$MovieStateImplCopyWith<_$MovieStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
