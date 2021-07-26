import 'package:flutter/material.dart';
import 'package:flutter_phonebook/controller/item_controller.dart';
import 'package:flutter_phonebook/view/components/custom_elevated_button.dart';
import 'package:flutter_phonebook/view/components/custom_text_form_field.dart';
import 'package:flutter_phonebook/view/pages/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SavePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _tel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ItemController i = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '번호등록 페이지',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: 30),
            SvgPicture.asset(
              'assets/boy.svg',
              height: 100,
              width: 100,
            ),
            SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('이름'),
                  CustomTextFormField(
                    hint: 'Enter Name',
                    controller: _name,
                  ),
                  SizedBox(height: 5),
                  Text('전화번호'),
                  CustomTextFormField(
                    hint: 'Enter Phone Number',
                    controller: _tel,
                  ),
                  SizedBox(height: 30),
                  CustomElevatedButton(
                    '저장하기',
                    funPageRoute: () async {
                      if (_formKey.currentState!.validate()) {
                        await i.save(_name.text, _tel.text);
                        Get.offAll(() => Home());
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
