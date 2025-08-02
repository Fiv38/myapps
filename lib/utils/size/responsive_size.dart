import 'package:flutter/material.dart';
import 'dart:math' as math;

class ResponsiveSize {
  // Screen breakpoints
  static const double largeDesktopWidth = 1920.0;
  static const double desktopWidth = 1024.0;
  static const double tabletWidth = 768.0;
  static const double mobileWidth = 375.0;

  // Scale factors for each device type
  static const double largeDesktopScale = 1.1;
  static const double desktopScale = 1.15;
  static const double tabletScale = 1.05;
  static const double mobileScale = 0.95;

  static double getSize(BuildContext context, double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;

    // Calculate scale factor based on screen width
    double scaleFactor;
    if (screenWidth >= largeDesktopWidth) {
      scaleFactor = (screenWidth / largeDesktopWidth) * largeDesktopScale;
    } else if (screenWidth >= desktopWidth) {
      scaleFactor = (screenWidth / largeDesktopWidth) * desktopScale;
    } else if (screenWidth >= tabletWidth) {
      scaleFactor = (screenWidth / desktopWidth) * tabletScale;
    } else {
      scaleFactor = (screenWidth / mobileWidth) * mobileScale;
    }

    // Apply constraints
    scaleFactor = scaleFactor.clamp(0.75, 1.5);

    // Calculate final size with pixel ratio compensation
    return math.max((baseSize * scaleFactor) / (pixelRatio > 2 ? pixelRatio * 0.7 : 1), 8.0);
  }
}
