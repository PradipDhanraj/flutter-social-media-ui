import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CacheImage extends StatefulWidget {
  final String? imageUrl;
  final String imageId;
  final double? height;
  final double? width;
  final BoxShape shape;
  final int cacheinDays;
  final Widget placeholder;
  const CacheImage(
      {super.key,
      required this.imageUrl,
      required this.imageId,
      required this.height,
      required this.width,
      this.cacheinDays = 1,
      this.shape = BoxShape.circle,
      this.placeholder = const Icon(CupertinoIcons.refresh_circled_solid)});

  @override
  State<CacheImage> createState() => _CacheImageState();
}

class _CacheImageState extends State<CacheImage> {
  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      widget.imageUrl ?? '',
      width: widget.width,
      height: widget.height,
      fit: BoxFit.fill,
      cache: true, cacheMaxAge: Duration(days: widget.cacheinDays),
      border: Border.all(color: Colors.red, width: 1.0),
      shape: widget.shape,
      borderRadius: BorderRadius.all(Radius.circular(widget.width ?? 30)),
      loadStateChanged: (state) {
        if (state.extendedImageLoadState == LoadState.completed) {
          return ExtendedRawImage(
            image: state.extendedImageInfo?.image,
            fit: BoxFit.cover,
            width: widget.width,
            height: widget.height,
          );
        } else if (state.extendedImageLoadState == LoadState.failed) {
          return widget.placeholder;
        }
        return const CupertinoActivityIndicator();
      },
      //cancelToken: cancellationToken,
    );
  }
}
