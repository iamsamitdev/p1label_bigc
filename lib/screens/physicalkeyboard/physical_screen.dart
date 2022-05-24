// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_print

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhysicalKeyboardScreen extends StatefulWidget {
  PhysicalKeyboardScreen({Key? key}) : super(key: key);

  @override
  State<PhysicalKeyboardScreen> createState() => _PhysicalKeyboardScreenState();
}

class _PhysicalKeyboardScreenState extends State<PhysicalKeyboardScreen> {

  final FocusNode _focusNode = FocusNode();
  List<LogicalKeyboardKey> keys = [];

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: _focusNode,
      onKey: (event){
        final key = event.logicalKey;
        if(event is RawKeyDownEvent){
          if(keys.contains(key)) return;
          // if(event.isKeyPressed(LogicalKeyboardKey.enter)){
            print('You pressed '+key.toString());
            // inspect(keys);
          // }
          setState(() { keys.add(key);});
        }else{
          setState(() {keys.remove(key);});
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Keyboard Event'),
        ),
        body: Container(),
      ),
    );
  }
}