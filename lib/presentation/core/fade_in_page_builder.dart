import 'package:flutter/material.dart';

class FadeInPagebuilder extends StatefulWidget {
  final Widget child;
  const FadeInPagebuilder({Key? key, required this.child}) : super(key: key);

  @override
  _FadeInPagebuilderState createState() => _FadeInPagebuilderState();
}

class _FadeInPagebuilderState extends State<FadeInPagebuilder> with SingleTickerProviderStateMixin {
  late Animation<double> _fadeAnim;
  late AnimationController _fadeController;

  @override
  void initState() {
    _fadeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _fadeAnim = CurvedAnimation(parent: _fadeController, curve: Curves.easeIn);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _fadeController.forward();
    return FadeTransition(opacity: _fadeAnim, child: widget.child);
  }
}
