part of '../uicomponent.dart';

class AssetImageViewer extends StatelessWidget {
  const AssetImageViewer({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.borderRadius,
  }) : super(key: key);

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.asset(
        '$imageUrl',
        fit: fit ?? BoxFit.cover,
        width: width,
        height: height,
      ),
    );
  }
}
