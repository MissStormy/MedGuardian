import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class CustomSmallPlainButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomSmallPlainButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  _CustomSmallPlainButtonState createState() => _CustomSmallPlainButtonState();
}

class _CustomSmallPlainButtonState extends State<CustomSmallPlainButton> {
  bool _isActive = false;

  @override
  Widget build(BuildContext context) {
    final actualTheme = Provider.of<ThemeLoader>(context).actualTheme;
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _isActive = !_isActive;
        });
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      style: OutlinedButton.styleFrom(
        foregroundColor:
            _isActive ? Colors.green : actualTheme.colorScheme.onError,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        fixedSize: const Size(50.0, 50.0),
      ),
      child: Center(
        child: Icon(widget.icon),
      ),
    );
  }
}
