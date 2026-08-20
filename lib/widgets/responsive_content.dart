import 'package:flutter/material.dart';

/// Beperkt de breedte van [child] tot [maxWidth] en centreert 'm, zodat
/// content op brede schermen (tablet/desktop) niet over de volle breedte
/// uitrekt. Op smalle schermen (telefoon) gebruikt [child] gewoon de volle
/// beschikbare breedte.
class ResponsiveContent extends StatelessWidget {
  const ResponsiveContent({
    super.key,
    required this.child,
    this.maxWidth = 640,
  });

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
