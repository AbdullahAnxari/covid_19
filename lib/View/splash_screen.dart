import 'dart:async';
import 'package:covid_project/View/world_states.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      const Duration(seconds: 3),
      () => Navigator.push(
        context as BuildContext,
        MaterialPageRoute(builder: (context) => const WorldStatsScreen()),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: Container(
                    child: Image.asset(
                        'images/virus.png'), // Use Image.asset instead of AssetImage
                  ),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .08,
            ),
            const Align(
                alignment: Alignment.center,
                child: Text(
                  'Covid 19 Tracker App',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }
}
