import 'package:better_stepper/better_stepper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int? _currentStep = 0;

  final steps = <BetterStep>[
    for (var i = 10; i >= 0; i--)
      BetterStep(
          title: Text('Step $i'),
          content: SizedBox(
              height: 100 * i.toDouble(), child: Text('Step $i content')),
          isActive: true,
          state: BetterStepState.indexed),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: 100,
              color: Colors.grey,
              alignment: Alignment.center,
              child: const Text('Hello World')),
          BetterStepper(
            steps: steps,
            currentStep: _currentStep,
            onStepTapped: (value) {
              setState(() {
                _currentStep = value;
              });
            },
          ),
        ],
      ),
    ));
  }
}
