import 'package:get/get.dart';

const host = 'http://192.168.0.2:8080';

class ItemProvider extends GetConnect {
  // Promise (데이터 약속)
  Future<Response> findAll() => get('$host/item');

  Future<Response> findById(int id) => get('$host/item/$id');

  Future<Response> deleteById(int id) => delete('$host/item/$id');

  Future<Response> updateById(int id, Map data) => put('$host/item/$id', data);

  Future<Response> save(Map data) => post('$host/item', data);
}
