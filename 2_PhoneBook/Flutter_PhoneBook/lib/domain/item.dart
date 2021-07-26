class Item {
  final int? id;
  final String? name;
  final String? tel;

  Item({this.id, this.name, this.tel}); // 선택적 매개변수 {} 안에 넣으면 받아도 되고 안받아도 된다.

  // 통신을 위해서 json 처럼 만들어주기
  Item.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        tel = json["tel"];
}
