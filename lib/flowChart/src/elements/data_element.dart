import 'package:flutter/material.dart';
import 'package:rive_test/flowChart/flutter_flow_chart.dart';
import 'package:rive_test/flowChart/src/elements/algorithm_flow.dart';

class DataElement extends AlgorithmFlowElement{
  DataElement({
    dynamic Function()? callback
  }): super(
    callback: callback,
    text: 'Data',
    kind: ElementKind.parallelogram,
    backgroundColor: Colors.yellow[300],
    size: const Size(75, 50),
    handlers: [
      Handler.topCenter,
      Handler.bottomCenter,
      Handler.rightCenter
    ]
  );

  @override
  String? get nextFlow => super.next.singleWhere((element) => element.arrowParams.startArrowPosition == Alignment.bottomCenter).destElementId;
}