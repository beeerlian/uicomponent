
part of '../uicomponent.dart';

class SvgViewer extends StatelessWidget {
  const SvgViewer(
    this.path, {
    Key? key,
    this.onTap,
    this.width,
    this.height,
    this.padding,
    this.color,
    this.fit,
  }) : super(key: key);

  final String? path;
  final Function()? onTap;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final Color? color;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (onTap != null) {
      return GestureDetector(onTap: onTap ?? () {}, child: buildView());
    }

    return buildView();
  }

  Widget buildView() {
    if (path == '') {
      return Container();
    }

    return Container(
      padding: padding ?? EdgeInsets.all(0),
      child: SvgPicture.asset(
        path!,
        width: width,
        height: height,
        color: color,
        fit: fit ?? BoxFit.cover,
      ),
    );
  }
}
