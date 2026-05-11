import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'features/history/history_screen.dart';
import 'features/home/home_screen.dart';
import 'features/medication_form/medication_form_screen.dart';
import 'features/purchase/purchase_screen.dart';
import 'features/settings/settings_screen.dart';
import 'l10n/generated/app_localizations.dart';
import 'providers.dart';

class LekoviApp extends ConsumerWidget {
  const LekoviApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeSetting = ref.watch(localeSettingProvider).valueOrNull;
    final locale = _resolveLocale(localeSetting);
    final router = _buildRouter();
    return MaterialApp.router(
      onGenerateTitle: (ctx) => AppL10n.of(ctx)!.appTitle,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.teal,
      ),
      locale: locale,
      supportedLocales: AppL10n.supportedLocales,
      localizationsDelegates: AppL10n.localizationsDelegates,
      routerConfig: router,
    );
  }

  Locale? _resolveLocale(String? key) {
    switch (key) {
      case 'sr_Latn':
        return const Locale('sr');
      case 'sr_Cyrl':
        return const Locale.fromSubtags(
            languageCode: 'sr', scriptCode: 'Cyrl');
      case 'en':
        return const Locale('en');
      default:
        return null;
    }
  }
}

GoRouter _buildRouter() => GoRouter(
      initialLocation: '/',
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (ctx, state, shell) => RootShell(shell: shell),
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/',
                builder: (ctx, st) => const HomeScreen(),
                routes: [
                  GoRoute(
                    path: 'med/new',
                    builder: (ctx, st) => const MedicationFormScreen(),
                  ),
                  GoRoute(
                    path: 'med/:id',
                    builder: (ctx, st) => MedicationFormScreen(
                      medicationId: int.tryParse(st.pathParameters['id'] ?? ''),
                    ),
                  ),
                  GoRoute(
                    path: 'purchase',
                    builder: (ctx, st) => const PurchaseScreen(),
                  ),
                ],
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/history',
                builder: (ctx, st) => const HistoryScreen(),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/settings',
                builder: (ctx, st) => const SettingsScreen(),
              ),
            ]),
          ],
        ),
      ],
    );

class RootShell extends StatelessWidget {
  final StatefulNavigationShell shell;
  const RootShell({super.key, required this.shell});

  @override
  Widget build(BuildContext context) {
    final l = AppL10n.of(context)!;
    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: (i) => shell.goBranch(i,
            initialLocation: i == shell.currentIndex),
        destinations: [
          NavigationDestination(
              icon: const Icon(Icons.medication_outlined),
              selectedIcon: const Icon(Icons.medication),
              label: l.tabHome),
          NavigationDestination(
              icon: const Icon(Icons.history_outlined),
              selectedIcon: const Icon(Icons.history),
              label: l.tabHistory),
          NavigationDestination(
              icon: const Icon(Icons.settings_outlined),
              selectedIcon: const Icon(Icons.settings),
              label: l.tabSettings),
        ],
      ),
    );
  }
}
