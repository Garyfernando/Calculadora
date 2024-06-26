import 'package:flutter/material.dart';
import 'package:calupeu/theme/AppTheme.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Function accionx;

  CustomAppBar({Key? key, required this.accionx})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState(accionx);
}

class _CustomAppBarState extends State<CustomAppBar> {
  Function accionx;

  _CustomAppBarState(this.accionx);

  @override
  Widget build(BuildContext context) {
    int coloS = 0;
    return AppBar(
      title: Center(
          child: AppTheme.useMaterial3
              ? const Text("Material 3")
              : const Text("Material 2")),
      actions: [
        IconButton(
          icon: AppTheme.useLightMode
              ? const Icon(Icons.wb_sunny_outlined)
              : const Icon(Icons.wb_sunny),
          onPressed: () {
            setState(() {
              AppTheme.useLightMode = !AppTheme.useLightMode;
              AppTheme.themeData = ThemeData(
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: MaterialColor(0xFF6C807F, <int, Color>{}),
                ).copyWith(
                  secondary: AppTheme.colorOptions[AppTheme.colorSelected],
                ),
                useMaterial3: AppTheme.useMaterial3,
                brightness: AppTheme.useLightMode
                    ? Brightness.light
                    : Brightness.dark,
              );
              accionx();
            });
          },
          tooltip: "Toggle brightness",
        ),
        IconButton(
          icon: AppTheme.useMaterial3
              ? const Icon(Icons.filter_3)
              : const Icon(Icons.filter_2),
          onPressed: () {
            setState(() {
              AppTheme.useMaterial3 = !AppTheme.useMaterial3;
              AppTheme.themeData = ThemeData(
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: MaterialColor(0xFF6C807F, <int, Color>{}),
                ).copyWith(
                  secondary: AppTheme.colorOptions[AppTheme.colorSelected],
                ),
                useMaterial3: AppTheme.useMaterial3,
                brightness: AppTheme.useLightMode
                    ? Brightness.light
                    : Brightness.dark,
              );
            });
            accionx();
          },
          tooltip: "Switch to Material ${AppTheme.useMaterial3 ? 2 : 3}",
        ),
        PopupMenuButton(
          icon: const Icon(Icons.more_vert),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          itemBuilder: (context) {
            return List.generate(AppTheme.colorOptions.length, (index) {
              return PopupMenuItem(
                value: index,
                child: Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(
                        index == AppTheme.colorSelected
                            ? Icons.color_lens
                            : Icons.color_lens_outlined,
                        color: AppTheme.colorOptions[index],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(AppTheme.colorText[index]),
                    ),
                  ],
                ),
                onTap: () {
                  coloS = index;
                  AppTheme.colorSelected = coloS;
                },
              );
            });
          },
          onSelected: (valor) {
            setState(() {
              AppTheme.themeData = ThemeData(
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: MaterialColor(0xFF6C807F, <int, Color>{}),
                ).copyWith(
                  secondary: AppTheme.colorOptions[valor],
                ),
                useMaterial3: AppTheme.useMaterial3,
                brightness: AppTheme.useLightMode
                    ? Brightness.light
                    : Brightness.dark,
              );
            });
            accionx();
          },
        ),
      ],
    );
  }
}
