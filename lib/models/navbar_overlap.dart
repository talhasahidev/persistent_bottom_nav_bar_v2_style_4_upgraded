part of "../persistent_bottom_nav_bar_v2_style_4_upgraded.dart";

class NavBarOverlap {
  const NavBarOverlap.full()
      : overlap = double
            .infinity, // This is the placeholder so [PersistentTabScaffold] uses the navBarHeight instead
        fullOverlapWhenNotOpaque = true;

  const NavBarOverlap.none({
    this.fullOverlapWhenNotOpaque = true,
  }) : overlap = 0.0;

  const NavBarOverlap.custom({
    this.overlap = 0.0,
    this.fullOverlapWhenNotOpaque = true,
  });

  final double overlap;
  final bool fullOverlapWhenNotOpaque;
}
