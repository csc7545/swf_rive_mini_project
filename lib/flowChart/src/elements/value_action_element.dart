import 'package:flutter/material.dart';
import 'package:rive_test/flowChart/flutter_flow_chart.dart';
import 'package:rive_test/flowChart/src/elements/action_element.dart';
import 'package:rive_test/flowChart/src/elements/data_element.dart';

class ValueActionElement extends ActionElement{
  String? valueKey;
  dynamic Function(String valueKey)? valuedCallback;

  ValueActionElement({
    dynamic Function(String valueKey)? callback,
    String? text,
  }):
  valuedCallback = callback,
  super(
    text: text
  );

  @override
  void Function(BuildContext context, Offset offset) get onTap => (context, offset){
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy, offset.dx, offset.dy),
      items: [
        for(final str in DataRepository.storage.keys)
          PopupMenuItem(
            child: Text(str),
            onTap: (){
              valueKey = str;
            },
          )
      ],
    );
  };

  @override
  void Function(Dashboard board) get callback => (board){
    if(valueKey!=null){
      valuedCallback?.call(valueKey!);
    }
  };
}