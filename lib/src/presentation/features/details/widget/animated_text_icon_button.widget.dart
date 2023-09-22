import 'package:flutter/material.dart';

class AnimatedTextIconButton extends StatefulWidget {
  const AnimatedTextIconButton({
    super.key,
    this.onPressed,
    required this.text,
    required this.icon,
    required this.selectedIcon,
    required this.initState,
  });

  final String text;
  final IconData icon;
  final IconData selectedIcon;
  final bool initState;
  final void Function()? onPressed;

  @override
  State<AnimatedTextIconButton> createState() => _AnimatedTextIconButtonState();
}

class _AnimatedTextIconButtonState extends State<AnimatedTextIconButton>
    with SingleTickerProviderStateMixin {
  late bool isSelected;
  @override
  void initState() {
    isSelected = widget.initState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed?.call();
        isSelected = !isSelected;
        setState(() {});
      },
      child: Chip(
        elevation: 5,
        label: Row(
          children: [
            Text(widget.text),
            const SizedBox(width: 10),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              transitionBuilder: (child, anim) => RotationTransition(
                turns: child.key == const ValueKey('icon1')
                    ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                    : Tween<double>(begin: 0.75, end: 1).animate(anim),
                child: FadeTransition(opacity: anim, child: child),
              ),
              child: isSelected
                  ? Icon(
                      widget.selectedIcon,
                      key: const ValueKey('icon2'),
                      color: Colors.green,
                    )
                  : Icon(widget.icon, key: const ValueKey('icon1')),
            ),
          ],
        ),
      ),
    );
  }
}
