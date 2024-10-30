import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CacheImage extends StatefulWidget {
  final String? imageUrl;
  final String imageId;
  final double height;
  final double width;
  final BoxShape shape;
  final int cacheDurationDays;
  final Widget placeholder;
  final bool hasBorder;
  final double aspectRatio;
  const CacheImage({
    super.key,
    required this.imageUrl,
    required this.imageId,
    this.height = 30,
    this.width = 30,
    this.cacheDurationDays = 1,
    this.shape = BoxShape.circle,
    this.hasBorder = true,
    this.placeholder = const Icon(CupertinoIcons.refresh_circled_solid),
    this.aspectRatio = 1,
  });

  @override
  State<CacheImage> createState() => _CacheImageState();
}

class _CacheImageState extends State<CacheImage> {
  (double, double) getScreenRatio() {
    return (widget.width, widget.aspectRatio * widget.width);
  }

  @override
  Widget build(BuildContext context) {
    var size = getScreenRatio();
    return ExtendedImage.network(
      widget.imageUrl ?? '',
      width: size.$1,
      height: size.$2,
      filterQuality: FilterQuality.none,
      fit: BoxFit.fitWidth,
      cache: true,
      cacheMaxAge: Duration(days: widget.cacheDurationDays),
      border: widget.hasBorder ? Border.all(color: Colors.red, width: 1.0) : null,
      shape: widget.shape,
      compressionRatio: .5,
      borderRadius: widget.shape == BoxShape.circle
          ? BorderRadius.all(
              Radius.circular(
                widget.width,
              ),
            )
          : null,
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
    );
  }
}
