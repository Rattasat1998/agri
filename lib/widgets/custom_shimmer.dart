import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer {
  static Widget buildNewsDetailShimmer(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Container(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 20,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Container(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Container(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Container(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Container(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  static Widget buildShimmer(BuildContext context, double height) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: height,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Container(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
  static Widget buildListShimmer(BuildContext context, double height, int itemCount) {
    return ListView.separated(
      itemCount: itemCount,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: height,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Container(
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}