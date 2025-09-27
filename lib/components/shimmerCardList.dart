import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildCardShimmer({
  int itemCount = 10,
  double titleWidth = 150,
  double subtitleWidth = 100,
  double height = 50,
}) {
  return ListView.builder(
    padding: const EdgeInsets.symmetric(vertical: 8),
    itemCount: itemCount,
    itemBuilder: (_, __) => Card(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 16,
                width: titleWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 14,
                width: subtitleWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
