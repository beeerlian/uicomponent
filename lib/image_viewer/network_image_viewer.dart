
part of '../uicomponent.dart';

class NetworkImageViewer extends StatelessWidget {
  const NetworkImageViewer({
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
      child: CachedNetworkImage(
        imageUrl: '$imageUrl',
        fit: fit ?? BoxFit.cover,
        width: width,
        height: height,
        placeholder: (context, url) => SizedBox(
          height: height,
          width: width,
          child: const Center(
            child: CircularProgressIndicator(
              color: ColorTheme.primary,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Icon(
          Icons.image,
          size: height,
          color: ColorTheme.backgroundPrimary,
        ),
      ),
    );
  }
}
