import 'package:flutter/material.dart';
import 'package:ihun_commerce/utility/helpers/color_seed.dart';
import 'package:ihun_commerce/utility/helpers/components.dart';
import 'package:ihun_commerce/views/cart/cart_page.dart';
import 'package:ihun_commerce/views/favorite/favorite_page.dart';
import 'package:ihun_commerce/views/home/home_page.dart';
import 'package:ihun_commerce/views/settings/setting_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    required this.useLightMode,
    required this.useMaterial3,
    required this.colorSelected,
    required this.handleBrightnessChange,
    required this.handleColorSelect,
  });

  final bool useLightMode;
  final bool useMaterial3;
  final ColorSeed colorSelected;
  final void Function(bool useLightMode) handleBrightnessChange;

  final void Function(int value) handleColorSelect;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int navDrawerIndex = 0;
  var pageWidget = [];
  @override
  void initState() {
    super.initState();
    pageWidget = [
      const HomePage(),
      const FavoritePage(),
      const CartPage(),
      SettingPage(
        brightnessButton: _BrightnessButton(
          handleBrightnessChange: widget.handleBrightnessChange,
        ),
        colorSeedButton: _ColorSeedButton(
          handleColorSelect: widget.handleColorSelect,
          colorSelected: widget.colorSelected,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageWidget[navDrawerIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (selectedIndex) {
          setState(() {
            navDrawerIndex = selectedIndex;
          });
        },
        selectedIndex: navDrawerIndex,
        destinations: appBarDestinations,
      ),
    );
  }
}

class _BrightnessButton extends StatelessWidget {
  const _BrightnessButton({
    required this.handleBrightnessChange,
  });

  final Function handleBrightnessChange;
  final bool showTooltipBelow = true;

  @override
  Widget build(BuildContext context) {
    final isBright = Theme.of(context).brightness == Brightness.light;
    return Tooltip(
      preferBelow: showTooltipBelow,
      message: 'Toggle brightness',
      child: IconButton(
        icon: isBright
            ? const Icon(Icons.dark_mode_outlined)
            : const Icon(Icons.light_mode_outlined),
        onPressed: () => handleBrightnessChange(!isBright),
      ),
    );
  }
}

class _ColorSeedButton extends StatelessWidget {
  const _ColorSeedButton({
    required this.handleColorSelect,
    required this.colorSelected,
  });

  final void Function(int) handleColorSelect;
  final ColorSeed colorSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.palette_outlined,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      tooltip: 'Select a seed color',
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) {
        return List.generate(ColorSeed.values.length, (index) {
          ColorSeed currentColor = ColorSeed.values[index];

          return PopupMenuItem(
            value: index,
            enabled: currentColor != colorSelected,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    currentColor == colorSelected
                        ? Icons.color_lens
                        : Icons.color_lens_outlined,
                    color: currentColor.color,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(currentColor.label),
                ),
              ],
            ),
          );
        });
      },
      onSelected: handleColorSelect,
    );
  }
}
