import 'package:flutter/material.dart';
import 'package:rive_test/flowChart/flutter_flow_chart.dart';
import 'package:rive_test/flowChart/src/elements/algorithm_flow.dart';

class ConditionElement extends AlgorithmFlowElement{
  bool Function() boolFunc;
  ConditionElement({
    required this.boolFunc,
  }): super(
    kind: ElementKind.diamond,
    text: 'if',
    backgroundColor: Colors.green[300],
    size: const Size(75, 50),
    handlers: const [
      Handler.topCenter,
      Handler.bottomCenter,
      Handler.rightCenter,
    ]
  );

  @override
  String? get nextFlow {
    if(boolFunc()){
      return super.next.singleWhere((element) => element.arrowParams.startArrowPosition == Alignment.bottomCenter).destElementId;
    } else {
      return super.next.singleWhere((element) => element.arrowParams.startArrowPosition == Alignment.centerRight).destElementId;
    }
  }
}