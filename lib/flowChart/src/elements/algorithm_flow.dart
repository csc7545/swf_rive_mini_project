import 'package:flutter/material.dart';
import 'package:rive_test/flowChart/flutter_flow_chart.dart';

abstract class AlgorithmFlowElement extends FlowElement{
  String? get nextFlow;

  AlgorithmFlowElement({
    Offset? position,
    Size? size,
    String? text,
    double? textSize,
    ElementKind? kind,
    List<Handler>? handlers,
    Color? backgroundColor,
    this.callback,
  }): super(
    handlerSize: 10,
    position: position ?? Offset.zero,
    size: size ?? Size.zero,
    text: text ?? '',
    textSize: textSize ?? 12,
    kind: kind ?? ElementKind.rectangle,
    handlers: handlers ?? const [
      Handler.topCenter,
      Handler.bottomCenter,
      Handler.rightCenter,
      Handler.leftCenter,
    ],
    backgroundColor: backgroundColor ?? Colors.white,
    borderColor: Colors.transparent,
    elevation: 0.5
  );

  dynamic Function()? callback;
}