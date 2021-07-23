import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '이상형 월드컵',
          style: TextStyle(
              color: Colors.deepPurple.shade300, fontWeight: FontWeight.bold),
        ),
        //leading:
        //Icon(Icons.arrow_back_ios_new, color: Colors.deepPurple.shade300),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              _categoryList('연예인'),
              _categoryList('음식'),
              _categoryList('게임'),
            ],
          )
        ],
      ),
    );
  }

  Widget _categoryList(String category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            category,
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black54),
          ),
        ),
        Container(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _worldcupBox('assets/entertainer/idol/jenny.jpg', '여자 아이돌 월드컵',
                  '#블랙핑크', '#이달의 소녀', '/idol'),
              _worldcupBox('assets/entertainer/actor/박민영.jpg', '여자 배우 월드컵',
                  '#드라마', '#영화배우', '/actor'),
              _worldcupBox('assets/entertainer/idol/youngji.jpg', '여자 연예인 월드컵',
                  '#고민중', '#생각중', '/actor'),
            ],
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }

  Widget _worldcupBox(
      String imgUrl, String title, String tag1, String tag2, String page) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(page);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imgUrl,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 5),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  Text(
                    tag1,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    tag2,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
