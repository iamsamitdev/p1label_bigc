import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:p1label/components/elevated_full_button.dart';
import 'package:p1label/screens/tabbarprint/data_print_quick.dart';
import 'package:p1label/themes/colors.dart';
import 'package:p1label/utils/constants.dart';

class PrintQuickScreen extends StatefulWidget {
  const PrintQuickScreen({Key? key}) : super(key: key);

  @override
  State<PrintQuickScreen> createState() => _PrintQuickScreenState();
}

class _PrintQuickScreenState extends State<PrintQuickScreen> {
  
  bool ckSF = false;
  bool ckBS = true;

  final FocusNode _focusNode = FocusNode();
  String? _message;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleKeyEvent(RawKeyEvent event) {
    setState(() {
      if (event.physicalKey == PhysicalKeyboardKey.keyA) {
        _message = 'Pressed the key next to CAPS LOCK!';
      } else {
        _message = 'Wrong key.';
      }
      print(_message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {          
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top:10.0, left: 10, right: 10),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.60,
                  child: dataPrintQuick(
                    ckSF: ckSF,
                    onChangedSF: (val) {
                      setState(() {
                        ckSF = val!;
                        if (kDebugMode) {
                          print('Check SF: $ckSF');
                        }
                      });
                    },
                    ckBS: ckBS,
                    onChangedBS: (val) {
                      setState(() {
                        ckBS = val!;
                        if (kDebugMode) {
                          print('Check BS: $ckBS');
                        }
                      });
                    },
                  ),
                ),
      
                // Button
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
                  child: ElevatedFullButton(
                    icon: Icons.settings_outlined,
                    iconColor: white_color,
                    iconSize: TEXT_SIZE_Normal,
                    name: '??????????????????????????????????????????????????? ???????????????????????????',
                    fontSize: TEXT_SIZE_SMedium,
                    height: 35,
                    textColor: white_color,
                    btnColor: primaryColor,
                    onPressed: (){
                      if (kDebugMode) {
                        print('Setting');
                        // _handleKeyEvent();
                      }
                    },
                  ),
                ),
      
                // Button Group
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: ElevatedFullButton(
                          name: '???????????????',
                          icon: Icons.print_outlined,
                          iconColor: white_color,
                          iconSize: TEXT_SIZE_Medium,
                          textColor: white_color,
                          btnColor: greenColor,
                          onPressed: (){},
                          height: 30,
                          fontSize: TEXT_SIZE_SMedium,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ElevatedFullButton(
                        name: '?????????????????????',
                        icon: Icons.save_outlined,
                        iconColor: white_color,
                        iconSize: TEXT_SIZE_Medium,
                        textColor: white_color,
                        btnColor: Colors.purple,
                        onPressed: (){},
                        height: 30,
                        fontSize: TEXT_SIZE_SMedium,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: ElevatedFullButton(
                          name: '?????????',
                          icon: Icons.exit_to_app,
                          iconColor: white_color,
                          iconSize: TEXT_SIZE_Medium,
                          textColor: white_color,
                          btnColor: Colors.grey,
                          onPressed: (){
                            Navigator.popAndPushNamed(context, '/home');
                          },
                          height: 30,
                          fontSize: TEXT_SIZE_SMedium,
                        ),
                      ),
                    ),
                  ],
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}