import 'package:bluespace/utils/adapt.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:bluespace/style/themeStyle.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:bluespace/components/article_list.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  // if (state.bannerList.length == 0) {
  //   dispatch(HomeActionCreator.getBanner());
  // }

  return Builder(builder: (context) {
    final ThemeData _theme = ThemeStyle.getTheme(context);
    return Scaffold(
        backgroundColor: _theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: _theme.bottomAppBarColor,
          brightness: Brightness.light,
          elevation: 3.0,
          title: _SearchBar(
            onTap: () => dispatch(HomeActionCreator.onSearchBarTapped()),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: Adapt.height(10), bottom: Adapt.height(10)),
                child: state.bannerList.length != 0
                    ? viewService.buildComponent('swiper')
                    : Container(
                        margin: EdgeInsets.all(5),
                        width: Adapt.width(750),
                        height: Adapt.height(400),
                        color: Color.fromRGBO(0, 0, 0, .3),
                      ),
              ),
              ArticleList(articleList: state.articleList)
            ],
          ),
        ));
  });
  // return Container();
}

class _SearchBar extends StatelessWidget {
  final Function onTap;
  const _SearchBar({this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: Adapt.width(30), right: Adapt.width(30)),
        height: Adapt.height(65),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Adapt.radius(40)),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.search,
              color: Colors.grey,
            ),
            SizedBox(width: Adapt.width(20)),
            SizedBox(
              width: Adapt.screenW() - Adapt.width(200),
              child: Text(
                '搜索',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey, fontSize: Adapt.sp(28)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
