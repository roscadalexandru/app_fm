import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageHandled extends StatelessWidget {
  const CachedImageHandled({Key? key, this.url}) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) {
    if (url?.isNotEmpty == true) {
      return CachedNetworkImage(imageUrl: url!);
    }
    return Container();
  }
}
