/*
 * @Author: your name
 * @Date: 2020-10-14 10:59:53
 * @LastEditTime: 2020-11-12 15:42:06
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: \bluespace\lib\net\base_entity.dart
 */
import 'package:bluespace/models/entity_factory.dart';
import 'package:bluespace/utils/common.dart';


class BaseEntity<T>{

  int code;
  String message;
  T data;
  List<T> listData = [];

  BaseEntity(this.code, this.message, this.data);

  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json[Constant.code];
    message = json[Constant.message];
    if (json.containsKey(Constant.data)) {
      if (json[Constant.data] is List) {
        (json[Constant.data] as List).forEach((item) {
          listData.add(_generateOBJ<T>(item));
        });
      } else {
        data = _generateOBJ(json[Constant.data]);
      }
    }
  }

  S _generateOBJ<S>(json) {
    if (S.toString() == "String") {
      return json.toString() as S;
    } else if (T.toString() == "Map<dynamic, dynamic>") {
      return json as S;
    } else {
      return EntityFactory.generateOBJ(json);
    }
  }
}