import 'package:flutter/material.dart';
import 'package:flutter_phonebook/controller/item_controller.dart';
import 'package:flutter_phonebook/view/pages/savePage.dart';
import 'package:flutter_phonebook/view/pages/updatePage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get.put() => 없으면 만들고, 있으면 찾기 !
    // 객체 생성(create), onInit 함수생성 (initialized)
    ItemController i = Get.put(ItemController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PhoneBook',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => SavePage());
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: i.items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () async {
                await i.findById(i.items[index].id!);
                Get.to(() => UpdatePage(i.items[index].id));
              },
              child: Card(
                child: Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 10, bottom: 10),
                      child: SvgPicture.asset(
                        'assets/boy.svg',
                        height: 80,
                        width: 80,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${i.items[index].name}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '${i.items[index].tel}',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
