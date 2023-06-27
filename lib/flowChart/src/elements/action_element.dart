import 'package:flutter/material.dart';
import 'package:rive_test/flowChart/src/elements/algorithm_flow.dart';

import 'flow_element.dart';

class ActionElement extends AlgorithmFlowElement{
  ActionElement( {
    void Function()? callback,
    String? text
  }) : super(
    kind: ElementKind.rectangle,
    callback: callback,
    backgroundColor: Colors.blue[300],
    size: const Size(75, 50),
    text: text??'Action',
    handlers: [
      Handler.topCenter,
      Handler.bottomCenter,
    ],
  );

  @override
  String? get nextFlow => super.next.singleWhere((element) => element.arrowParams.startArrowPosition == Alignment.bottomCenter).destElementId;
}