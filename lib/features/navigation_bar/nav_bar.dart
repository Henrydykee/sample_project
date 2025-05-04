import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:new_project/features/account%20/presentation/pages/account_screen.dart';
import 'package:new_project/features/explore/presentation/pages/explore_screen.dart';
import 'package:new_project/features/saved/presentation/pages/saved_screen.dart';
import '../home/presentation/pages/home_screen.dart';

class GrantNavBar extends StatefulWidget {
  @override
  _GrantNavBarState createState() => _GrantNavBarState();
}

class _GrantNavBarState extends State<GrantNavBar> with SingleTickerProviderStateMixin {
  int? selectedTab;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    selectedTab = 0;
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _selectedTab(int? index) {
    if (selectedTab != index) {
      _controller.reset();
      _controller.forward();
      setState(() {
        selectedTab = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GrantBottomAppBar(
        notchedShape: CircularNotchedRectangle(),
        selectedColor: Colors.black,
        color: Colors.grey,
        onTabSelected: _selectedTab,
        items: [
          GrantBottomAppBarItem(image: "assets/svg/home_icon.svg", name: "Home"),
          GrantBottomAppBarItem(image: "assets/svg/explore.svg", name: "Explore"),
          GrantBottomAppBarItem(image: "assets/svg/saved.svg", name: "Saved"),
          GrantBottomAppBarItem(image: "assets/svg/account.svg", name: "Account"),
        ],
      ),
      body: FadeTransition(
        opacity: _animation,
        child: IndexedStack(
          index: selectedTab,
          children: [
            HomeScreen(),
            ExploreScreen(),
            SavedScreen(),
            AccountScreen()
          ],
        ),
      ),
    );
  }
}

class GrantBottomAppBarItem {
  GrantBottomAppBarItem({required this.image, this.name});
  String image;
  String? name;
}

class GrantBottomAppBar extends StatefulWidget {
  GrantBottomAppBar({
    this.items,
    this.height = 80.0,
    this.iconSize = 24.0,
    this.backgroundColor = Colors.white,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  }) {
    assert(this.items!.length == 4);
  }

  final List<GrantBottomAppBarItem>? items;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int?>? onTabSelected;

  @override
  State<StatefulWidget> createState() => GrantBottomAppBarState();
}

class GrantBottomAppBarState extends State<GrantBottomAppBar> with SingleTickerProviderStateMixin {
  int? _selectedIndex;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _animationController.forward();

    _selectedIndex = 0;

    // Trigger initial selection after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.onTabSelected != null) {
        widget.onTabSelected!(0);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _updateIndex(int? index) {
    if (_selectedIndex != index) {
      _animationController.reset();
      _animationController.forward();
      if (widget.onTabSelected != null) {
        widget.onTabSelected!(index);
      }
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items!.length, (int index) {
      return _buildTabItem(
        item: widget.items![index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildTabItem({
    required GrantBottomAppBarItem item,
    int? index,
    ValueChanged<int?>? onPressed,
  }) {
    Color? color = _selectedIndex == index ? widget.selectedColor : widget.color;
    bool isSelected = _selectedIndex == index;

    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            highlightColor: Colors.transparent,
            onTap: () => onPressed!(index),
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xFF333333) : Colors.transparent,
                  borderRadius: isSelected ? BorderRadius.circular(30) : BorderRadius.zero,
                ),
                margin: isSelected
                    ? EdgeInsets.symmetric(vertical: 8, horizontal: 4)
                    : EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        item.image,
                        colorFilter: isSelected ? ColorFilter.mode(Colors.white, BlendMode.srcIn) : ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),
                      Gap(4),
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        transitionBuilder: (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child: SizeTransition(
                              sizeFactor: animation,
                              axis: Axis.horizontal,
                              child: child,
                            ),
                          );
                        },
                        child: isSelected
                            ? Center(
                          child: Text(
                            item.name ?? "",
                            key: ValueKey<String>(item.name ?? ""),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        )
                            : SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
