import 'package:flutter/material.dart';
import '../core/resources/custom_color.dart';

class CustomRadioTile<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String title;
  final VoidCallback onTap;

  const CustomRadioTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? CustomColor.primaryColor
                : Colors.grey.shade400,
            width: 2,
          ),
          color: isSelected
              ? CustomColor.primaryColor.withOpacity(0.10)
              : Colors.white,
        ),
        child: Row(
          children: [
            Radio<T>(
              value: value,
              groupValue: groupValue,
              activeColor: CustomColor.primaryColor,
              onChanged: (_) => onTap(),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
