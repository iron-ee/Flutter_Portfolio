import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_worldcup_app/item/item.dart';

class FoodMostPage extends StatefulWidget {
  @override
  _FoodMostPage createState() => _FoodMostPage();
}

class _FoodMostPage extends State<FoodMostPage> with TickerProviderStateMixin {
  double opacity1 = 1;
  double opacity2 = 1;
  double opacity3 = 0;
  AnimationController? _animationController1;
  AnimationController? _animationController2;

  Animation? _transAnimation1;
  Animation? _transAnimation2;

  Animation? _scaleAnimation1;
  Animation? _scaleAnimation2;

  List items = [];
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

    items.add(Item('김치찌개', 'assets/food/most/김치찌개.jpg'));
    items.add(Item('돈까스', 'assets/food/most/돈까스.jpg'));
    items.add(Item('고기', 'assets/food/most/돼지고기.jpg'));
    items.add(Item('초밥', 'assets/food/most/초밥.jpg'));
    items.add(Item('냉면', 'assets/food/most/냉면.jpg'));
    items.add(Item('국밥', 'assets/food/most/국밥.jpg'));
    items.add(Item('떡순튀', 'assets/food/most/떡순튀.jpg'));
    items.add(Item('파스타', 'assets/food/most/파스타.jpg'));
    items.add(Item('피자', 'assets/food/most/피자.jpg'));
    items.add(Item('치킨', 'assets/food/most/치킨.jpg'));
    items.add(Item('햄버거', 'assets/food/most/햄버거.jpg'));
    items.add(Item('마라훠궈', 'assets/food/most/마라훠궈.jpg'));
    items.add(Item('스테이크', 'assets/food/most/스테이크.jpg'));
    items.add(Item('짜장 짬뽕', 'assets/food/most/짬짜면.jpg'));
    items.add(Item('곱창', 'assets/food/most/곱창.jpg'));
    items.add(Item('라면', 'assets/food/most/라면.jpg'));
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
                ? '오늘의 메뉴는 너야!  '
                : _titleNum == 2
                    ? '대망의 결승 !!!!!'
                    : '메뉴는 너로 정했다 $_titleNum강 (${current + 1} / ${_titleNum ~/ 2})'),
            SizedBox(
              width: _titleNum == 1 ? 35 : 0,
              height: _titleNum == 1 ? 35 : 0,
              child: SvgPicture.asset(
                'assets/icon/burger.svg',
              ),
            ),
          ],
        ),
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
                    '오늘의 메뉴는',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Stack(
                    children: [
                      Text(
                        winnerName,
                        style: TextStyle(
                          fontSize: 23,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 4
                            ..color = Colors.deepPurple.shade200,
                        ),
                      ),
                      Text(
                        winnerName,
                        style: TextStyle(fontSize: 23, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Text(
                    '입니다',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                items.removeAt(current + 1);
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
                items.removeAt(current + 1);
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
                items.removeAt(current + 1);
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
                items.removeAt(current + 1);
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
                items.removeAt(current + 1);
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
                items.removeAt(current + 1);
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
            winnerName = items[current].name;
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
    _imgUrl1 = items[current].imgUrl;
    _name1 = items[current].name;

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
                items.removeAt(current);
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
                items.removeAt(current);
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
                items.removeAt(current);
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
                items.removeAt(current);
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
                items.removeAt(current);
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
                items.removeAt(current);
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
            winnerName = items[current + 1].name;
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
    _imgUrl2 = items[current + 1].imgUrl;
    _name2 = items[current + 1].name;

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
