
part of '../uicomponent.dart';

class GroupChip<T> extends StatefulWidget {
  GroupChip(
      {Key? key,
      required this.titleList,
      required this.selectedIndex,
      this.initialIndex})
      : super(key: key);

  void Function(int) selectedIndex;
  List<T> titleList;
  int? initialIndex;

  @override
  _GroupChipState createState() => _GroupChipState();
}

class _GroupChipState extends State<GroupChip> {
  late int activeIndex;

  @override
  void initState() {
    activeIndex = widget.initialIndex ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.titleList.length,
        itemBuilder: (context, index) {
          return buildChip(index, widget.titleList[index]);
        },
      ),
    );
  }

  Widget buildChip(int val, String title) {
    return GestureDetector(
      onTap: () {
        widget.selectedIndex(val);
        setState(() {
          activeIndex = val;
        });
      },
      child: RoundedContainer(
        margin:
            EdgeInsets.only(right: val == widget.titleList.length - 1 ? 0 : 14),
        padding: EdgeInsets.symmetric(horizontal: 25),
        radius: 50,
        color: val == activeIndex
            ? ColorTheme.primary
            : ColorTheme.backgroundPrimary,
        child: Center(
          child: MyText(
            title,
            fontSize: 14,
            color: val == activeIndex
                ? Colors.white
                : ColorTheme.secondaryTextColor,
            weight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
