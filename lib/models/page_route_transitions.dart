part of "../persistent_bottom_nav_bar_v2_style_4_upgraded.dart";

enum PageTransitionAnimation {
  platform,
  cupertino,
  slideRight,
  scale,
  rotate,
  sizeUp,
  fade,
  scaleRotate,
  slideUp
}

Widget _slideRightRoute(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget? child,
) =>
    SlideTransition(
      position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
          .animate(animation),
      child: child,
    );

Widget _slideUp(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget? child,
) =>
    SlideTransition(
      position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
          .animate(animation),
      child: child,
    );

Widget _scaleRoute(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget? child,
) =>
    ScaleTransition(
      scale: Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
      ),
      child: child,
    );

Widget _rotationRoute(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget? child,
) =>
    RotationTransition(
      turns: Tween<double>(begin: 0, end: 1)
          .animate(CurvedAnimation(parent: animation, curve: Curves.linear)),
      child: child,
    );

Widget _sizeRoute(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget? child,
) =>
    Align(
      child: SizeTransition(sizeFactor: animation, child: child),
    );

Widget _fadeRoute(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget? child,
) =>
    FadeTransition(opacity: animation, child: child);

Widget _scaleRotate(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget? child,
) =>
    ScaleTransition(
      scale: Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
      ),
      child: RotationTransition(
        turns: Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(parent: animation, curve: Curves.linear),
        ),
        child: child,
      ),
    );

class _AnimatedPageRoute extends PageRouteBuilder {
  _AnimatedPageRoute({
    this.exitPage,
    this.enterPage,
    this.transitionAnimation,
    this.routeSettings,
  }) : super(
          settings: routeSettings,
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              enterPage!,
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              Stack(
            children: <Widget>[
              _getAnimation(
                context,
                animation,
                secondaryAnimation,
                exitPage,
                transitionAnimation!,
              ),
              _getAnimation(
                context,
                animation,
                secondaryAnimation,
                enterPage,
                transitionAnimation,
              ),
            ],
          ),
        );

  final Widget? enterPage;
  final Widget? exitPage;
  final PageTransitionAnimation? transitionAnimation;
  final RouteSettings? routeSettings;
}

class _SinglePageRoute extends PageRouteBuilder {
  _SinglePageRoute({this.page, this.transitionAnimation, this.routeSettings})
      : super(
          settings: routeSettings,
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              page!,
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              _getAnimation(
            context,
            animation,
            secondaryAnimation,
            child,
            transitionAnimation!,
          ),
        );

  final Widget? page;
  final PageTransitionAnimation? transitionAnimation;
  final RouteSettings? routeSettings;
}

Widget _getAnimation(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget? child,
  PageTransitionAnimation transitionAnimation,
) {
  switch (transitionAnimation) {
    case PageTransitionAnimation.cupertino:
    case PageTransitionAnimation.platform:
      break;
    case PageTransitionAnimation.slideRight:
      return _slideRightRoute(context, animation, secondaryAnimation, child);
    case PageTransitionAnimation.scale:
      return _scaleRoute(context, animation, secondaryAnimation, child);
    case PageTransitionAnimation.rotate:
      return _rotationRoute(context, animation, secondaryAnimation, child);
    case PageTransitionAnimation.sizeUp:
      return _sizeRoute(context, animation, secondaryAnimation, child);
    case PageTransitionAnimation.fade:
      return _fadeRoute(context, animation, secondaryAnimation, child);
    case PageTransitionAnimation.scaleRotate:
      return _scaleRotate(context, animation, secondaryAnimation, child);
    case PageTransitionAnimation.slideUp:
      return _slideUp(context, animation, secondaryAnimation, child);
  }
  return Container();
}

dynamic getPageRoute(
  PageTransitionAnimation transitionAnimation, {
  RouteSettings? settings,
  Widget? enterPage,
  Widget? exitPage,
}) {
  switch (transitionAnimation) {
    case PageTransitionAnimation.cupertino:
      return settings == null
          ? CupertinoPageRoute(builder: (context) => enterPage!)
          : CupertinoPageRoute(
              settings: settings,
              builder: (context) => enterPage!,
            );
    case PageTransitionAnimation.platform:
      return settings == null
          ? MaterialPageRoute(builder: (context) => enterPage!)
          : MaterialPageRoute(
              settings: settings,
              builder: (context) => enterPage!,
            );
    default:
      return exitPage == null
          ? _SinglePageRoute(
              page: enterPage,
              transitionAnimation: transitionAnimation,
              routeSettings: settings,
            )
          : _AnimatedPageRoute(
              enterPage: enterPage,
              exitPage: exitPage,
              transitionAnimation: transitionAnimation,
              routeSettings: settings,
            );
  }
}
