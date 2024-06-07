import 'package:flutter/material.dart';
import 'package:pregnancy_guide/core/style/app_colors.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final double? width;
  final double? height;
  final double? switchHeight;
  final double? switchWidth;
  final ValueChanged<bool> onChanged;

  const CustomSwitch(
      {Key? key,
      required this.value,
      this.width,
      this.height,
      this.switchHeight,
      this.switchWidth,
      required this.onChanged})
      : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 40));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: widget.width ?? 80,
            height: widget.height ?? 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: const Color.fromARGB(255, 138, 135, 135),
            ),
            child: Padding(
              padding: const EdgeInsets.only(),
              child: Container(
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: widget.switchWidth ?? 40,
                  height: widget.switchHeight ?? 24.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: AppColors.secondaryColor,
                  ),
                  child: const Text(""),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
