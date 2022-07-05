/*import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'dart:math';

class SpeedometerContainer extends StatefulWidget {
  @override
  _SpeedometerContainerState createState() => _SpeedometerContainerState();
}

class _SpeedometerContainerState extends State<SpeedometerContainer> {
  double velocity = 0;
  double highestVelocity = 0.0;

  @override
  void initState() {
    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      _onAccelerate(event);
    });
    super.initState();
  }

  void _onAccelerate(UserAccelerometerEvent event) {
    double newVelocity = sqrt(
        event.x * event.x + event.y * event.y + event.z * event.z
    );

    if ((newVelocity - velocity).abs() < 1) {
      return;
    }

    setState(() {
      velocity = newVelocity;

      if (velocity > highestVelocity) {
        highestVelocity = velocity;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 64),
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Highest speed:\n${highestVelocity.toStringAsFixed(2)} km/h',
                    style: TextStyle(
                        color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  )
              ),
              Center(
                  child: Speedometer(
                    speed: velocity,
                    speedRecord: highestVelocity,
                  )
              )
            ]
        )
    );
  }
}

class Speedometer extends StatelessWidget {
  Speedometer({
    required this.speed,
    required this.speedRecord,
    this.size = 300
  });

  final double speed;
  final double speedRecord;
  final double size;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}


*/




