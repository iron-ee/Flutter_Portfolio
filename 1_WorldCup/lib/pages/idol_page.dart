import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_worldcup_app/item/item.dart';

class IdolPage extends StatefulWidget {
  @override
  _IdolPage createState() => _IdolPage();
}

class _IdolPage extends State<IdolPage> with TickerProviderStateMixin {
  double opacity1 = 1;
  double opacity2 = 1;
  double opacity3 = 0;

  AnimationController? _animationController1;
  AnimationController? _animationController2;

  Animation? _transAnimation1;
  Animation? _transAnimation2;

  Animation? _scaleAnimation1;
  Animation? _scaleAnimation2;

  List idols = [];
  int current = 0;

  String _imgUrl1 = '';
  String _name1 = '';

  String _imgUrl2 = '';
  String _name2 = '';

  int cycle16 = 0;
  int cycle8 = 0;
  int cycle4 = 0;
  int cycle2 = 0;

  int _titleNum = 16;

  String winnerName = '';

  @override
  void initState() {
    super.initState();

    _animationController1 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController2 =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _transAnimation1 = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 150))
        .animate(_animationController1!);
    _transAnimation2 = Tween<Offset>(begin: Offset(0, 0), end: Offset(0, -180))
        .animate(_animationController2!);

    _scaleAnimation1 =
        Tween<double>(begin: 1, end: 1.5).animate(_animationController1!);
    _scaleAnimation2 =
        Tween<double>(begin: 1, end: 1.5).animate(_animationController2!);

    idols.add(Item('블랙핑크 제니', 'assets/entertainer/idol/jenny.jpg'));
    idols.add(Item('소녀시대 태연', 'assets/entertainer/idol/taeyeon.jpg'));
    idols.add(Item('이달의 소녀 츄', 'assets/entertainer/idol/chu.jpg'));
    idols.add(Item('STAYC 윤', 'assets/entertainer/idol/stayc_yoon.jpg'));
    idols.add(Item('에스파 카리나', 'assets/entertainer/idol/karina.jpg'));
    idols.add(Item('브레이브걸스 유정', 'assets/entertainer/idol/brave_yoojung.jpg'));
    idols.add(Item('아이유', 'assets/entertainer/idol/iu.jpg'));
    idols.add(Item('에스파 윈터', 'assets/entertainer/idol/winter.jpg'));
    idols.add(Item('아이즈원 강혜원', 'assets/entertainer/idol/hyewon.jpg'));
    idols.add(Item('오마이걸 효정', 'assets/entertainer/idol/hyojeong.jpg'));
    idols.add(Item('트와이스 지효', 'assets/entertainer/idol/jihyo.jpg'));
    idols.add(Item('블랙핑크 지수', 'assets/entertainer/idol/jisu.jpg'));
    idols.add(Item('레드벨벳 조이', 'assets/entertainer/idol/joy.jpg'));
    idols.add(Item('ITZY 리아', 'assets/entertainer/idol/lia.jpg'));
    idols.add(Item('모모랜드 연우', 'assets/entertainer/idol/yeonwoo.jpg'));
    idols.add(Item('카라 허영지', 'assets/entertainer/idol/youngji.jpg'));
  }

  @override
  void dispose() {
    _animationController1!.dispose();
    _animationController2!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_titleNum == 1
                ? '나의 여자 아이돌 이상형은  '
                : _titleNum == 2
                    ? '대망의 결승 !!!!!'
                    : '여자 아이돌 이상형 $_titleNum강 (${current + 1} / ${_titleNum ~/ 2})'),
            SizedBox(
              width: _titleNum == 1 ? 35 : 0,
              height: _titleNum == 1 ? 35 : 0,
              child: SvgPicture.asset(
                'assets/icon/newlyweds.svg',
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: Stack(
        children: [
          _winnerEnding(),
          Column(
            children: [
              SizedBox(height: 5),
              _topClass(context),
              SizedBox(height: 5),
              _bottomClass(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _winnerEnding() {
    return AnimatedOpacity(
      opacity: opacity3,
      duration: Duration(milliseconds: 500),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: SvgPicture.asset(
                      'assets/icon/thumbs-up.svg',
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    ' 역시 안목이 좋으시군요 ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: SvgPicture.asset(
                      'assets/icon/thumbs-up.svg',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: SvgPicture.asset(
                      'assets/icon/confetti.svg',
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '당신의 이상형은',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Stack(
                    children: [
                      Text(
                        winnerName,
                        style: TextStyle(
                          fontSize: 16,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 4
                            ..color = Colors.deepPurple.shade200,
                        ),
                      ),
                      Text(
                        winnerName,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Text(
                    '입니다',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5),
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: SvgPicture.asset(
                      'assets/icon/fireworks.svg',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topClass(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (cycle16 <= 8) {
          setState(() {
            _animationController1!.forward();
            cycle16++;
            opacity2 = 0;
            print(cycle16);
            if (cycle16 == 8) {
              cycle16++;
              Timer(Duration(milliseconds: 1000), () {
                idols.removeAt(current + 1);
              });
              Timer(Duration(milliseconds: 1300), () {
                setState(() {
                  current = 0;
                  _titleNum = 8;
                  _animationController1!.reset();
                  opacity1 = 1;
                  opacity2 = 1;
                });
              });
            } else {
              Timer(Duration(milliseconds: 1000), () {
                idols.removeAt(current + 1);
              });
              Timer(Duration(milliseconds: 1300), () {
                setState(() {
                  current++;
                  _animationController1!.reset();
                  opacity1 = 1;
                  opacity2 = 1;
                });
              });
            }
          });
        } else if (cycle16 == 9 && cycle8 <= 4) {
          setState(() {
            _animationController1!.forward();
            cycle8++;
            opacity2 = 0;
            print(cycle8);
            if (cycle8 == 4) {
              cycle8++;
              Timer(Duration(milliseconds: 1000), () {
                idols.removeAt(current + 1);
              });
              Timer(Duration(milliseconds: 1300), () {
                setState(() {
                  current = 0;
                  _titleNum = 4;
                  _animationController1!.reset();
                  opacity1 = 1;
                  opacity2 = 1;
                });
              });
            } else {
              Timer(Duration(milliseconds: 1000), () {
                idols.removeAt(current + 1);
              });
              Timer(Duration(milliseconds: 1300), () {
                setState(() {
                  current++;
                  _animationController1!.reset();
                  opacity1 = 1;
                  opacity2 = 1;
                });
              });
            }
          });
        } else if (cycle8 == 5 && cycle4 <= 2) {
          setState(() {
            _animationController1!.forward();
            cycle4++;
            opacity2 = 0;
            print(cycle4);
            if (cycle4 == 2) {
              cycle4++;
              Timer(Duration(milliseconds: 1000), () {
                idols.removeAt(current + 1);
              });
              Timer(Duration(milliseconds: 1300), () {
                setState(() {
                  current = 0;
                  _titleNum = 2;
                  _animationController1!.reset();
                  opacity2 = 1;
                  opacity1 = 1;
                });
              });
            } else {
              Timer(Duration(milliseconds: 1000), () {
                idols.removeAt(current + 1);
              });
              Timer(Duration(milliseconds: 1300), () {
                setState(() {
                  current++;
                  _animationController1!.reset();
                  opacity1 = 1;
                  opacity2 = 1;
                });
              });
            }
          });
        } else if (cycle4 == 3 && cycle2 < 1) {
          setState(() {
            winnerName = idols[current].name;
            _titleNum = 1;
            opacity2 = 0;
            opacity3 = 1;
            _animationController1!.forward();
            cycle2 = 2;
          });
          print('우승');
        }
      },
      child: _topBox(context),
    );
  }

  Widget _topBox(BuildContext context) {
    _imgUrl1 = idols[current].imgUrl;
    _name1 = idols[current].name;

    return AnimatedOpacity(
      opacity: opacity1,
      duration: Duration(milliseconds: 300),
      child: AnimatedBuilder(
        animation: _animationController1!,
        builder: (context, widget) {
          return Transform.translate(
            offset: _transAnimation1!.value,
            child: Transform.scale(
              scale: _scaleAnimation1!.value,
              child: widget,
            ),
          );
        },
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.43,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Image.asset(
                _imgUrl1,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(children: [
                        Text(
                          _name1,
                          style: TextStyle(
                            fontSize: 20,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 4
                              ..color = Colors.black,
                          ),
                        ),
                        Text(
                          _name1,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ]),
                    ],
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomClass(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (cycle16 <= 8) {
          setState(() {
            _animationController2!.forward();
            cycle16++;
            opacity1 = 0;
            print(cycle16);
            if (cycle16 == 8) {
              cycle16++;
              Timer(Duration(milliseconds: 1000), () {
                idols.removeAt(current);
              });
              Timer(Duration(milliseconds: 1300), () {
                setState(() {
                  current = 0;
                  _titleNum = 8;
                  _animationController2!.reset();
                  opacity1 = 1;
                  opacity2 = 1;
                });
              });
            } else {
              Timer(Duration(milliseconds: 1000), () {
                idols.removeAt(current);
              });
              Timer(Duration(milliseconds: 1300), () {
                setState(() {
                  current++;
                  _animationController2!.reset();
                  opacity1 = 1;
                  opacity2 = 1;
                });
              });
            }
          });
        } else if (cycle16 == 9 && cycle8 <= 4) {
          setState(() {
            _animationController2!.forward();
            cycle8++;
            opacity1 = 0;
            print(cycle8);
            if (cycle8 == 4) {
              cycle8++;
              Timer(Duration(milliseconds: 1000), () {
                idols.removeAt(current);
              });
              Timer(Duration(milliseconds: 1300), () {
                setState(() {
                  current = 0;
                  _titleNum = 4;
                  _animationController2!.reset();
                  opacity1 = 1;
                  opacity2 = 1;
                });
              });
            } else {
              Timer(Duration(milliseconds: 1000), () {
                idols.removeAt(current);
              });
              Timer(Duration(milliseconds: 1300), () {
                setState(() {
                  current++;
                  _animationController2!.reset();
                  opacity1 = 1;
                  opacity2 = 1;
                });
              });
            }
          });
        } else if (cycle8 == 5 && cycle4 <= 2) {
          setState(() {
            _animationController2!.forward();
            cycle4++;
            opacity1 = 0;
            print(cycle4);
            if (cycle4 == 2) {
              cycle4++;
              Timer(Duration(milliseconds: 1000), () {
                idols.removeAt(current);
              });
              Timer(Duration(milliseconds: 1300), () {
                setState(() {
                  current = 0;
                  _titleNum = 2;
                  _animationController2!.reset();
                  opacity1 = 1;
                  opacity2 = 1;
                });
              });
            } else {
              Timer(Duration(milliseconds: 1000), () {
                idols.removeAt(current);
              });
              Timer(Duration(milliseconds: 1300), () {
                setState(() {
                  current++;
                  _animationController2!.reset();
                  opacity1 = 1;
                  opacity2 = 1;
                });
              });
            }
          });
        } else if (cycle4 == 3 && cycle2 < 1) {
          setState(() {
            winnerName = idols[current + 1].name;
            _titleNum = 1;
            opacity1 = 0;
            opacity3 = 1;
            _animationController2!.forward();
            cycle2 = 2;
          });
          print('우승');
        }
      },
      child: _bottomBox(context),
    );
  }

  Widget _bottomBox(BuildContext context) {
    _imgUrl2 = idols[current + 1].imgUrl;
    _name2 = idols[current + 1].name;

    return AnimatedOpacity(
      opacity: opacity2,
      duration: Duration(milliseconds: 300),
      child: AnimatedBuilder(
        animation: _animationController2!,
        builder: (context, widget) {
          return Transform.translate(
            offset: _transAnimation2!.value,
            child: Transform.scale(
              scale: _scaleAnimation2!.value,
              child: widget,
            ),
          );
        },
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.43,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Image.asset(
                _imgUrl2,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(children: [
                        Text(
                          _name2,
                          style: TextStyle(
                            fontSize: 20,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 4
                              ..color = Colors.black,
                          ),
                        ),
                        Text(
                          _name2,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ]),
                    ],
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
