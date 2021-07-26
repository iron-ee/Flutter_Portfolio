class SaveReqDto {
  final String name;
  final String? tel;

  SaveReqDto(this.name, {this.tel}); // 선택적 매개변수 {} 넣어도 되고 안넣어도 됨.

  Map<String, dynamic> toJson() => {
        "name": name,
        "tel": tel,
      };
}
