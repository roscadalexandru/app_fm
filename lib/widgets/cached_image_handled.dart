import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageHandled extends StatelessWidget {
  const CachedImageHandled({Key? key, this.url, this.borderRadius})
      : super(key: key);

  final String? url;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    if (url?.isNotEmpty == true) {
      var child = CachedNetworkImage(imageUrl: url!);
      if (borderRadius != null) {
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: child,
        );
      }
      return child;
    }
    return Container();
  }
}
