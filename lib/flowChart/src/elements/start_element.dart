import 'package:flutter/material.dart';
import 'package:rive_test/flowChart/src/elements/algorithm_flow.dart';

import 'flow_element.dart';

class StartElement extends AlgorithmFlowElement{
  StartElement({Offset position = const Offset(100,100)}):super(
      text: 'Start',
      size: const Size(50, 50),
      position: position,
      kind: ElementKind.oval,
      backgroundColor: Colors.red[300],
      handlers: [
        Handler.bottomCenter,
      ]
  );

  @override
  String? get nextFlow => super.next.singleWhere((element) => element.arrowParams.startArrowPosition == Alignment.bottomCenter).destElementId;
}

class EndElement extends AlgorithmFlowElement{
  EndElement():super(
      text: 'End',
      size: const Size(100, 75),
      kind: ElementKind.rectangle,
      position: const Offset(100, 500),
      backgroundColor: Colors.white,
      handlers: [
        Handler.topCenter,
      ]
  );

  @override
  String? get nextFlow => null;
}