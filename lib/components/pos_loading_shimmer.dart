import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PosLoadingShimmer extends StatelessWidget {
  const PosLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 120, height: 20, color: Colors.white),
              Container(width: 80, height: 20, color: Colors.white),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          Container(width: double.infinity, height: 56, color: Colors.white),
          const SizedBox(height: 12),
          Container(width: double.infinity, height: 56, color: Colors.white),
          const SizedBox(height: 12),
          Container(width: double.infinity, height: 56, color: Colors.white),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          Container(width: 120, height: 20, color: Colors.white),
          const SizedBox(height: 12),
          Container(width: double.infinity, height: 56, color: Colors.white),
          const SizedBox(height: 12),
          Container(width: double.infinity, height: 56, color: Colors.white),
          const SizedBox(height: 12),
          Container(width: double.infinity, height: 56, color: Colors.white),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
