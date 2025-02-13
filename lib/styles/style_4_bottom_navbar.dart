part of "../persistent_bottom_nav_bar_v2_style_4_upgraded.dart";

class Style4BottomNavBar extends StatelessWidget {
  const Style4BottomNavBar({
    required this.navBarConfig,
    this.navBarDecoration = const NavBarDecoration(),
    this.itemAnimationProperties = const ItemAnimation(),
    this.centerWidget,
    this.animatedBorderRadius,
    this.activeForegroundColor,
    this.inactiveForegroundColor,
    this.textStyle,
    super.key,
  });

  final NavBarConfig navBarConfig;
  final NavBarDecoration navBarDecoration;
  final Widget? centerWidget;
  final ItemAnimation itemAnimationProperties;
  final BorderRadiusGeometry? animatedBorderRadius;
  final Color? activeForegroundColor;
  final Color? inactiveForegroundColor;
  final TextStyle? textStyle;

  Widget _buildItem(ItemConfig item, bool isSelected) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: IconTheme(
              data: IconThemeData(
                size: item.iconSize,
                color: isSelected
                    ? activeForegroundColor ?? item.activeForegroundColor
                    : inactiveForegroundColor ?? item.inactiveForegroundColor,
              ),
              child: isSelected ? item.icon : item.inactiveIcon,
            ),
          ),
          if (item.title != null)
            FittedBox(
              child: Text(
                item.title!,
                style: (textStyle ?? item.textStyle).apply(
                  color: isSelected
                      ? activeForegroundColor ?? item.activeForegroundColor
                      : inactiveForegroundColor ?? item.inactiveForegroundColor,
                ),
              ),
            ),
        ],
      );

  List<Widget> _buildItems(BuildContext context, double itemWidth) {
    final List<Widget> items = [];
    final int middleIndex = (navBarConfig.items.length / 2).floor();

    for (int i = 0; i < navBarConfig.items.length; i++) {
      final item = navBarConfig.items[i];

      // Add item
      items.add(
        Flexible(
          child: InkWell(
            onTap: () {
              navBarConfig.onItemSelected(i);
            },
            child: Center(
              child: _buildItem(
                item,
                navBarConfig.selectedIndex == i,
              ),
            ),
          ),
        ),
      );

      // Add FAB in the middle
      if (i == middleIndex - 1 && centerWidget != null) {
        items.add(
          SizedBox(
            width: itemWidth,
            child: Center(
              child: centerWidget,
            ),
          ),
        );
      }
    }

    return items;
  }

  Widget _buildAnimatedBorder(double itemWidth) {
    final int middleIndex = (navBarConfig.items.length / 2).floor();
    final double selectedPosition = itemWidth * navBarConfig.selectedIndex;

    final double adjustedPosition =
        centerWidget != null && navBarConfig.selectedIndex >= middleIndex
            ? selectedPosition + itemWidth
            : selectedPosition;

    return Row(
      children: <Widget>[
        AnimatedContainer(
          duration: itemAnimationProperties.duration,
          curve: itemAnimationProperties.curve,
          width: adjustedPosition,
          height: 4,
        ),
        AnimatedContainer(
          duration: itemAnimationProperties.duration,
          curve: itemAnimationProperties.curve,
          width: itemWidth,
          height: 4,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: activeForegroundColor ??
                  navBarConfig.selectedItem.activeForegroundColor,
              borderRadius: animatedBorderRadius),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double itemWidth = (MediaQuery.of(context).size.width -
            navBarDecoration.padding.horizontal) /
        (navBarConfig.items.length + (centerWidget != null ? 1 : 0));

    return DecoratedNavBar(
      decoration: navBarDecoration,
      filter: navBarConfig.selectedItem.filter,
      opacity: navBarConfig.selectedItem.opacity,
      height: navBarConfig.navBarHeight,
      child: Column(
        children: <Widget>[
          _buildAnimatedBorder(itemWidth),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _buildItems(context, itemWidth),
            ),
          ),
        ],
      ),
    );
  }
}
