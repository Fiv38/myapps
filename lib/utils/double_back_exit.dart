import 'package:flutter/material.dart';
import '../utils/toast_utils.dart';

class DoubleBackExit extends StatefulWidget {
  final Widget child;
  final int duration;
  final String message;

  const DoubleBackExit({
    super.key,
    required this.child,
    this.duration = 1500,
    this.message = "Press again to exit",
  });

  @override
  State<DoubleBackExit> createState() => _DoubleBackExitState();
}

class _DoubleBackExitState extends State<DoubleBackExit> {
  DateTime? _lastBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {

        final now = DateTime.now();
        if (_lastBackPressTime == null ||
            now.difference(_lastBackPressTime!) >
                Duration(milliseconds: widget.duration)) {
          _lastBackPressTime = now;
          // ← use your ToastUtils instead of Fluttertoast
          ToastUtils.showFailure(context, message: widget.message);
          return false;
        }
        return true;
      },
      child: widget.child,
    );
  }
}
