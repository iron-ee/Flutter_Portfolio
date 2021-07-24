import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 60),
            Text(
              '이상형 월드컵',
              style: TextStyle(
                  color: Colors.deepPurple.shade300,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            SizedBox(
                width: 30,
                height: 30,
                child: SvgPicture.asset('assets/icon/cup.svg')),
          ],
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
              _categoryList1('연예인'),
              _categoryList2('여행'),
              _categoryList3('음식'),
            ],
          )
        ],
      ),
    );
  }

  Widget _categoryList1(String category) {
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

  Widget _categoryList2(String category) {
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
              _worldcupBox('assets/trip/most/일본.jpg', '내가 가고 싶은 나라는 어디?',
                  '#얼른 가고 싶다', '#코로나 딱 대', '/trip_most'),
              _worldcupBox('assets/trip/sty/익스트림.jpg', '지금 당장 끌리는 여행 !',
                  '#번지점프', '#드라이브', '/trip_sty'),
            ],
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }

  Widget _categoryList3(String category) {
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
              _worldcupBox('assets/food/most/스테이크.jpg', '메뉴는 너로 정했다 월드컵',
                  '#국밥충', '#메뉴 선택장애', '/food_most'),
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
