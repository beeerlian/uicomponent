part of '../uicomponent.dart';

class SliderViewer extends StatefulWidget {
  List<String> imageUrlList;
  SliderViewer(
      {Key? key,
      required this.imageUrlList,
      this.isImageFromNetwork = true,
      this.height,
      this.onClick,
      this.width})
      : super(key: key);

  bool isImageFromNetwork;
  double? width;
  double? height;
  Function(int)? onClick;
  @override
  _SliderViewerState createState() => _SliderViewerState();
}

class _SliderViewerState extends State<SliderViewer> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (widget.onClick != null) {
              widget.onClick!(currentIndex);
            }
          },
          child: CarouselSlider.builder(
            options: CarouselOptions(
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              viewportFraction: 1,
              enlargeCenterPage: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            itemCount: widget.imageUrlList.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              if (widget.imageUrlList.isNotEmpty) {
                return _buildContent(widget.imageUrlList[itemIndex]);
              }
              return Icon(Icons.image);
            },
          ),
        ),
        const Divide(height: 15),
        _buildIndicator()
      ],
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.imageUrlList.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          margin: EdgeInsets.only(right: 5),
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? ColorTheme.primary
                : ColorTheme.backgroundPrimary,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(String imagePath) {
    return RoundedContainer(
      padding: EdgeInsets.all(20),
      radius: 22,
      width: widget.width,
      height: widget.height,
      color: ColorTheme.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    "June",
                    color: Colors.white,
                    fontSize: 36,
                    weight: FontWeight.w600,
                  ),
                  MyText(
                    "20 % OFF",
                    color: Colors.white,
                    fontSize: 24,
                    weight: FontWeight.w300,
                  )
                ],
              ),
              NetworkImageViewer(
                borderRadius: BorderRadius.circular(22),
                width: 100,
                height: 100,
                imageUrl: imagePath,
              )
            ],
          ),
          MyText(
            'Get discount for upgrade VIP',
            color: Colors.white,
            fontSize: 14,
            weight: FontWeight.w500,
          )
        ],
      ),
    );
  }
}
