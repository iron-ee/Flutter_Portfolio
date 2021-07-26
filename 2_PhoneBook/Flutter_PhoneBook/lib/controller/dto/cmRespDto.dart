class CMRespDto {
  final int? code;
  final String? msg;
  final dynamic data;

  CMRespDto({this.code, this.msg, this.data});

  // 통신을 위해서 json
  CMRespDto.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        msg = json["msg"],
        data = json["data"];
}
