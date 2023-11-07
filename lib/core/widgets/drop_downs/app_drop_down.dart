import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/theme/dimens.dart';
import 'package:flutter_boilerplate/core/utils/sized_context.dart';
import 'package:flutter_boilerplate/core/widgets/buttons/app_outlined_button.dart';

class AppDropDown<T> extends StatefulWidget {
  const AppDropDown({
    super.key,
    required this.child,
    required this.items,
    required this.onChange,
    this.icon,
    this.hideIcon = false,
    this.leadingIcon = false,
  });

  final Widget child;
  final void Function(T, int) onChange;
  final List<DropdownItem<T>> items;
  final Icon? icon;
  final bool hideIcon;

  final bool leadingIcon;

  @override
  // ignore: library_private_types_in_public_api
  _AppDropDownState<T> createState() => _AppDropDownState<T>();
}

class _AppDropDownState<T> extends State<AppDropDown<T>>
    with TickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  late OverlayEntry _overlayEntry;
  bool _isOpen = false;
  int _currentIndex = -1;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _rotateAnimation = Tween(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return CompositedTransformTarget(
      link: this._layerLink,
      child: AppOutlinedButton(
        onPressed: _toggleDropdown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection:
              widget.leadingIcon ? TextDirection.rtl : TextDirection.ltr,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_currentIndex == -1) ...[
              widget.child,
            ] else ...[
              widget.items[_currentIndex],
            ],
            if (!widget.hideIcon)
              RotationTransition(
                turns: _rotateAnimation,
                child: widget.icon ?? const Icon(Icons.arrow_drop_down_rounded),
              ),
          ],
        ),
      ),
    );
  }

  OverlayEntry _createOverlayEntry() {
    final RenderBox? renderBox = context.findRenderObject() as RenderBox?;
    final Size? size = renderBox?.size;

    final Offset? offset = renderBox?.localToGlobal(Offset.zero);
    final double topOffset = offset!.dy + size!.height + 5;
    return OverlayEntry(
      builder: (final BuildContext context) => GestureDetector(
        onTap: () => _toggleDropdown(close: true),
        behavior: HitTestBehavior.translucent,
        child: SizedBox(
          height: context.sizePx.height,
          width: context.sizePx.width,
          child: Stack(
            children: [
              Positioned(
                left: offset.dx,
                top: topOffset,
                width: size.width,
                child: CompositedTransformFollower(
                  offset: Offset(0, size.height + 5),
                  link: this._layerLink,
                  showWhenUnlinked: false,
                  child: Material(
                    borderRadius: BorderRadius.zero,
                    child: SizeTransition(
                      axisAlignment: 1,
                      sizeFactor: _expandAnimation,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: context.sizePx.height - topOffset - 15,
                        ),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          children: widget.items
                              .asMap()
                              .entries
                              .map((final MapEntry<int, DropdownItem<T>> item) {
                            return InkWell(
                              onTap: () {
                                setState(() => _currentIndex = item.key);
                                widget.onChange(item.value.value, item.key);
                                _toggleDropdown();
                              },
                              child: item.value,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _toggleDropdown({final bool close = false}) async {
    if (_isOpen || close) {
      await _animationController.reverse();
      this._overlayEntry.remove();
      setState(() {
        _isOpen = false;
      });
    } else {
      this._overlayEntry = this._createOverlayEntry();
      Overlay.of(context).insert(this._overlayEntry);
      setState(() => _isOpen = true);
      _animationController.forward();
    }
  }
}

class DropdownItem<T> extends StatelessWidget {
  const DropdownItem({
    super.key,
    required this.value,
    required this.child,
  });

  final T value;
  final Widget child;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.padding),
      child: child,
    );
  }
}
