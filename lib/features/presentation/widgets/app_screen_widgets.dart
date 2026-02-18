import 'package:flutter/material.dart';
import 'package:personal_ia/core/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return AppBar(
      title: Text(
        'Frogames-GPTN',
      ), //aqui se puede cambiar el encabezado de mi app
      actions: [
        IconButton(
          onPressed: () => themeProvider.toggleTheme(),
          icon:
              themeProvider.themeMode == ThemeMode.dark
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
