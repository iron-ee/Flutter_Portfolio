import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

import 'package:flutter_svg/flutter_svg.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> with SingleTickerProviderStateMixin {
  double opacity = 0;
  AnimationController? _animationController;
  Animation? _animation;
  Animation? _transAnimation;
  Animation? _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation =
        Tween<double>(begin: 0, end: pi * 3.9).animate(_animationController!);
    _transAnimation = Tween<Offset>(begin: Offset(0, 200), end: Offset(0, 0))
        .animate(_animationController!);
    _scaleAnimation =
        Tween<double>(begin: 2, end: 1).animate(_animationController!);
    _animationController!.forward();

    Timer(Duration(seconds: 3), () {
      // 페이지 생성 후, 2초 뒤 타이머 시작
      setState(() {
        opacity = 1;
      });
    });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animationController!,
              builder: (context, widget) {
                return Transform.translate(
                  offset: _transAnimation!.value,
                  child: Transform.rotate(
                    angle: _animation!.value,
                    child: Transform.scale(
                      scale: _scaleAnimation!.value,
                      child: widget,
                    ),
                  ),
                );
              },
              child: SvgPicture.asset(
                'assets/logo/logo2.svg',
                width: 100,
                height: 100,
              ),
            ),
            AnimatedOpacity(
              opacity: opacity,
              duration: Duration(seconds: 1),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    '골라잡아',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple.shade200),
                  ),
                  SizedBox(height: 100),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/home');
                    },
                    child: Text(
                      '입장하기',
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.w600),
                    ),
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Colors.black54,
                        minimumSize: Size(150, 50)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
