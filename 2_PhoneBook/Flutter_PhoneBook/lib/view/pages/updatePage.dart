import 'package:flutter/material.dart';
import 'package:flutter_phonebook/controller/item_controller.dart';
import 'package:flutter_phonebook/view/components/custom_elevated_button.dart';
import 'package:flutter_phonebook/view/components/custom_text_form_field.dart';
import 'package:flutter_phonebook/view/pages/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UpdatePage extends StatelessWidget {
  final int? id;

  UpdatePage(this.id);

  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _tel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ItemController i = Get.find();

    _name.text = '${i.item.value.name}';
    _tel.text = '${i.item.value.tel}';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '수정 페이지',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        backgroundColor: Colors.indigo.shade300,
        onPressed: () {
          AlertDialog dialog = AlertDialog(
            title: Text(
              '번호 삭제하기',
              style: TextStyle(fontSize: 15),
            ),
            content: Text(
              '정말로 삭제하시겠습니까?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            actions: [
              TextButton(
                  onPressed: () async {
                    await i.deleteById(i.item.value.id!);
                    Get.off(() => Home());
                  },
                  child: Text('예')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('아니요'))
            ],
          );
          showDialog(
              context: context, builder: (BuildContext context) => dialog);
        },
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    child: SvgPicture.asset(
                      'assets/boy.svg',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('이름'),
                  CustomTextFormField(hint: '이름', controller: _name),
                  Text('전화번호'),
                  CustomTextFormField(hint: '번호', controller: _tel),
                  SizedBox(height: 30),
                  CustomElevatedButton('수정하기', funPageRoute: () async {
                    if (_formKey.currentState!.validate()) {
                      await i.updateById(
                          i.item.value.id ?? 0, _name.text, _tel.text);
                      Get.offAll(() => Home());
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
