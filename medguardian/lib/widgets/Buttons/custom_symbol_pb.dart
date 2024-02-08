import 'package:flutter/material.dart';
import 'package:medguardian/theme/theme.dart';
import 'package:provider/provider.dart';

class CustomSymbolPlainButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomSymbolPlainButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  _CustomSymbolPlainButtonState createState() =>
      _CustomSymbolPlainButtonState();
}

class _CustomSymbolPlainButtonState extends State<CustomSymbolPlainButton> {
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
        fixedSize: const Size(100.0, 100.0),
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
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
