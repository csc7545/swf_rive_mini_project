import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rive/components.dart';
import 'package:rive/rive.dart';
import 'package:rive_test/flowChart/flutter_flow_chart.dart';
import 'package:rive_test/flowChart/src/elements/action_element.dart';
import 'package:rive_test/flowChart/src/elements/algorithm_flow.dart';
import 'package:rive_test/flowChart/src/elements/data_element.dart';
import 'package:rive_test/flowChart/src/elements/start_element.dart';

import 'flowChart/src/elements/condition_element.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // bool _fire = false;

  Dashboard _dashboard = Dashboard();

  FlowElement start = StartElement(

  );

  FlowElement end = EndElement();

  @override
  void initState(){
    super.initState();
    _dashboard.addElement(start);
    _dashboard.addElement(end);
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  // void _toggle(){
  //   setState(() {
  //     _fire = !_fire;
  //   });
  // }

  SMITrigger? _fire;
  SMIBool? _right;
  Node? _node;
  double _rotation = 0;
  bool _firing = false;

  double _posX = 100;
  double _posY = 100;

  bool _open = false;

  void _tankInit(Artboard board){
    final cont = StateMachineController.fromArtboard(board, 'State Machine 1', onStateChange: _onChange);
    board.addController(cont!);
    board.forEachComponent((p0) {
      // print(p0.name);
      if(p0.name == 'canon'){
        _node = p0 as Node;
        _node!.rotation = 0;
        // print(shape.rotation);
      }
    });
    _fire = cont.findInput<bool>('fire') as SMITrigger;
    _right = cont.findInput<bool>('facingRight') as SMIBool;
  }

  void _onChange(String machineName, String stateName){
    setState((){
      _firing = stateName == 'fire';
    });
  }

  void _setValue(double val){
    _node!.rotation = val;
  }

  void _trigger(){
    _fire?.fire();
  }
  
  void _turn(){
    _right?.value = !_right!.value;
  }

  late SimpleAnimation animController = SimpleAnimation('fire');

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Stack(
          children: [
            // RiveAnimation.asset(
            //   'assets/tank.riv',
            //   stateMachines: ['State Machine 1'],
            //   controllers: [animController],
            //   onInit: _tankInit,
            // ),
            // SizedBox(
            //   width: 300,
            //   child: Column(
            //     children: [
            //       Text(
            //         '${ (_rotation*180/3.14*100).floor()/100 }'
            //       ),
            //       Slider(
            //         min: 0,
            //         max: 3.14,
            //         value: _rotation,
            //         onChanged: (rot){
            //           setState((){
            //             var val = rot;
            //             if(rot>3.14/2){
            //               val = 3.14-rot;
            //               if(!_right!.value){
            //                 _turn();
            //               }
            //             }else if(_right!.value){
            //               _turn();
            //             }
            //             _rotation = rot;
            //
            //             _setValue(val);
            //           });
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            Positioned.fill(
              child: FlowChart(
                dashboard: _dashboard,
              ),
            ),
            Positioned(
              right: 0,
              child: ElevatedButton(
                onPressed: (){
                  setState(() {
                    _open = !_open;
                  });
                },
                child: Icon(Icons.add),
              ),
            ),
            if(_open)
              Positioned(
                right: 0,
                top: 100,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        var ee = ConditionElement(
                          boolFunc: ()=>_open
                        );
                        _dashboard.addElement(ee);
                      },
                      child: const Text('if'),
                    ),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: (){
                        var ee = ActionElement();
                        _dashboard.addElement(ee);
                      },
                      child: const Text('action'),
                    ),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: (){
                        var ee = DataElement();
                        _dashboard.addElement(ee);
                      },
                      child: const Text('data'),
                    ),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: (){
                        var ee = ActionElement(
                          callback: (){
                            setState(() {
                              _posX += 50;
                            });
                          },
                          text: 'Move Right'
                        );
                        _dashboard.addElement(ee);
                      },
                      child: const Text('Move Right'),
                    ),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: (){
                        var ee = ActionElement(
                            callback: (){
                              setState(() {
                                _posX -= 50;
                              });
                            },
                            text: 'Move Left'
                        );
                        _dashboard.addElement(ee);
                      },
                      child: const Text('Move Left'),
                    ),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: (){
                        var ee = ActionElement(
                            callback: (){
                              setState(() {
                                _posY += 50;
                              });
                            },
                            text: 'Move Up'
                        );
                        _dashboard.addElement(ee);
                      },
                      child: const Text('Move Up'),
                    ),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: (){
                        var ee = ActionElement(
                            callback: (){
                              setState(() {
                                _posY -= 50;
                              });
                            },
                            text: 'Move Down'
                        );
                        _dashboard.addElement(ee);
                      },
                      child: const Text('Move Down'),
                    ),
                    const SizedBox(height: 10,),
                    ElevatedButton(
                      onPressed: (){
                        var ee = ActionElement(
                            callback: (){
                              setState(() {
                                _posX = 100;
                                _posY = 100;
                              });
                            },
                            text: 'Reset Position'
                        );
                        _dashboard.addElement(ee);
                      },
                      child: const Text('Reset Position'),
                    ),
                  ],
                ),
              ),
            Positioned(
              bottom: _posY,
              left: _posX,
              child: SizedBox(
                width: 75,
                height: 75,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.circular(5)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _firing ? null : _trigger ,
        onPressed: runFlow,
        tooltip: 'Fire',
        // child: const Icon(Icons.local_fire_department),
        backgroundColor: _firing ? Colors.grey : Colors.blue,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void runFlow(){
    print("====================");
    loop(start as StartElement);
  }

  void loop(AlgorithmFlowElement element){
    print(element.text);
    element.callback?.call();
    Future.delayed(const Duration(milliseconds: 500),(){
      for(var elem in _dashboard.getNextOf(element)){
        loop(elem);
      }
    });

  }
}
