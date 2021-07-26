import '../controller/dto/cmRespDto.dart';
import '../controller/dto/savaReqDto.dart';
import 'package:flutter_phonebook/domain/item.dart';
import 'package:flutter_phonebook/domain/item_provider.dart';
import 'package:flutter_phonebook/util/conver_utf8.dart';
import 'package:get/get.dart';

class ItemRepository {
  final ItemProvider _itemProvider = ItemProvider();

  Future<Item> save(String name, String tel) async {
    SaveReqDto saveReqDto = SaveReqDto(name, tel: tel);

    Response response = await _itemProvider.save(saveReqDto.toJson());
    print(saveReqDto.toJson());

    dynamic body = response.body;
    print('save 바디 : $body');
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) {
      print('등록 완료');
      Item item = Item.fromJson(cmRespDto.data);
      return item;
    } else {
      print('등록 실패');
      return Item();
    }
  }

  Future<List<Item>> findAll() async {
    Response response = await _itemProvider.findAll();

    dynamic body = response.body;
    print('findAll 바디 : $body');
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) {
      print('전체 찾기 완료');
      List<dynamic> temp = cmRespDto.data;
      // cmRespDto.data 의 데이터를 Item.fromJson 형태로 items 안에 List로 담아버리기
      List<Item> items = temp.map((e) => Item.fromJson(e)).toList();
      return items;
    } else {
      // List<Item> i = [];  똑같이 빈 배열이지만 <Post>[] 가 더 깔끔
      return <Item>[];
    }
  }

  Future<Item> findById(int id) async {
    Response response = await _itemProvider.findById(id);

    dynamic body = response.body;
    print('findById 바디 : $body');
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) {
      Item item = Item.fromJson(cmRespDto.data);
      return item;
    } else {
      return Item();
    }
  }

  Future<int> deleteById(int id) async {
    Response response = await _itemProvider.deleteById(id);

    dynamic body = response.body;
    print('delete 바디 : $body');
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    return cmRespDto.code ?? -1;
  }

  Future<Item> updateById(int id, String name, String tel) async {
    SaveReqDto saveReqDto = SaveReqDto(name, tel: tel);
    Response response = await _itemProvider.updateById(id, saveReqDto.toJson());

    dynamic body = response.body;
    print('update 바디 : $body');
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) {
      print('번호수정 완료');
      Item item = Item.fromJson(cmRespDto.data);
      return item;
    } else {
      print('번호수정 실패');
      return Item();
    }
  }
}
