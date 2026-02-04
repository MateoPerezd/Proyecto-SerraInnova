import 'package:flutter/material.dart';

class _OwnerOptionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final Color activeColor;
  final VoidCallback onTap;

  const _OwnerOptionButton({
    required this.label,
    required this.icon,
    required this.isActive,
    required this.activeColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        backgroundColor:
            isActive ? activeColor.withOpacity(0.12) : Colors.white,
        side: BorderSide(
          color: isActive ? activeColor : Colors.blue,
          width: 1.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // pill shape
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isActive) ...[
            Icon(icon, size: 18, color: activeColor),
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: TextStyle(
              color: isActive ? activeColor : Colors.blue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
