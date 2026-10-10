import 'package:flutter/material.dart';

class Brand extends StatelessWidget {
  const Brand({super.key, required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BrandMark(size: 34),
          SizedBox(width: 12),
          Text(
            'MUSIC ASSISTANT',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFFF1F4EA),
            ),
          ),
        ],
      );
    }

    return Container(
      color: const Color(0xFF192526),
      padding: const EdgeInsets.all(36),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BrandMark(size: 58),
          SizedBox(height: 26),
          Text(
            'MUSIC\nASSISTANT',
            style: TextStyle(
              fontSize: 30,
              height: 1.04,
              fontWeight: FontWeight.w800,
              color: Color(0xFFF1F4EA),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'LIVING ROOM PLAYER',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Color(0xFFB6E36A),
            ),
          ),
        ],
      ),
    );
  }
}

class BrandMark extends StatelessWidget {
  const BrandMark({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0xFFB6E36A),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        Icons.graphic_eq_rounded,
        color: const Color(0xFF101819),
        size: size * .62,
      ),
    );
  }
}
