import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HomeState> buildReducer() {
  return asReducer(
    <Object, Reducer<HomeState>>{
      HomeAction.action: _onAction,
      HomeAction.initBanner: _onInitBanner,
      HomeAction.initArticle: _onInitArticle
    },
  );
}

HomeState _onAction(HomeState state, Action action) {
  final HomeState newState = state.clone();
  return newState;
}

HomeState _onInitBanner(HomeState state, Action action) {
  final HomeState newState = state.clone();
  newState..bannerList = action.payload;
  return newState;
}

HomeState _onInitArticle(HomeState state, Action action) {
  final HomeState newState = state.clone();
  newState..articleList = action.payload;
  return newState;
}
