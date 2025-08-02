import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class GlobalBackButton extends StatelessWidget {
  const GlobalBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 10,
      child: Visibility(
        visible: context.router.canPop(), // ✅ Show only when navigation is possible
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 24),
          onPressed: () {
            if (context.router.canPop()) {
              context.router.pop();
            }
          },
        ),
      ),
    );
  }
}
