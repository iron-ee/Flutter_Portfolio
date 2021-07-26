import 'package:flutter_phonebook/domain/item.dart';
import 'package:flutter_phonebook/domain/item_repository.dart';
import 'package:get/get.dart';

class ItemController extends GetxController {
  final ItemRepository _itemRepository = ItemRepository();
  final RxList<Item> items =
      <Item>[].obs; // RxList<Item> 생략가능   ex) items = <Item>[].obs;
  final item = Item().obs; // Rx<Item> 생략가능   ex) item = Item().obs;

  Future<void> save(String name, String tel) async {
    Item item = await _itemRepository.save(name, tel);
    if (item.id != null) {
      this.items.add(item);
      print('save 실행');
    }
  }

  Future<void> findAll() async {
    List<Item> items = await _itemRepository.findAll();
    this.items.value = items;
  }

  @override
  void onInit() {
    super.onInit();
    findAll();
    print('findAll 실행');
  }

  Future<void> findById(int id) async {
    Item item = await _itemRepository.findById(id);
    this.item.value = item;
  }

  Future<void> deleteById(int id) async {
    int result = await _itemRepository.deleteById(id);

    if (result == 1) {
      print('서버에서 삭제 성공');
      List<Item> deleteResult = items.where((item) => item.id != id).toList();
      items.value = deleteResult;
    }
  }

  Future<void> updateById(int id, String name, String tel) async {
    Item item = await _itemRepository.updateById(id, name, tel);

    if (item.id != null) {
      this.item.value = item;

      // 스프레드 연산자 (전개 연산자) 공부하기 !
      this.items.value = this.items.map((e) => e.id == id ? item : e).toList();
    }
  }
}
