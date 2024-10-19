


import 'package:flutter/material.dart';

import 'core/widgets/adaptive_layout_widget.dart';
import 'core/widgets/desktop_root_layout.dart';

class AdminMealTimeApp extends StatelessWidget
{
  const AdminMealTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayoutWidget(
        mobileLayout: (context) => SizedBox(),
        tabletLayout: (context) => SizedBox(),
        desktopLayout: (context) => DesktopRootLayout(),);
  }
}
