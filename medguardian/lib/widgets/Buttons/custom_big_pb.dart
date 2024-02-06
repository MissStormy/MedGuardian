import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:medguardian/theme/theme.dart';

class CustomBigPlainButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomBigPlainButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  _CustomBigPlainButtonState createState() => _CustomBigPlainButtonState();
}

class _CustomBigPlainButtonState extends State<CustomBigPlainButton> {
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
        fixedSize: const Size(150.0, 150.0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icon),
            const SizedBox(height: 5.0),
            Text(
              widget.label,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
