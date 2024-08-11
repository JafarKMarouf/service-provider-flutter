import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../utils/constant.dart';

class CustomeInfosService extends StatefulWidget {
  final String text;
  final String image;
  final void Function()? onPressed;
  final bool tapped;
  const CustomeInfosService({
    super.key,
    required this.text,
    required this.image,
    this.onPressed,
    this.tapped = false,
  });

  @override
  State<CustomeInfosService> createState() => _CustomeInfosServiceState();
}

class _CustomeInfosServiceState extends State<CustomeInfosService> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: .6,
        color: widget.tapped ? kPrimaryColor : CardTheme.of(context).color,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 6,
            bottom: 6,
            right: 4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                widget.text,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: widget.tapped ? Colors.white : Colors.grey[800],
                ),
                maxLines: 2,
                maxFontSize: 14,
              ),
              const SizedBox(width: 4),
              Image.asset(
                widget.image,
                color: widget.tapped ? Colors.white : Colors.grey[800],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
