import 'package:flutter/material.dart';

Future<bool?> showLogoutConfirmationSheet(BuildContext context) {
  final theme = Theme.of(context);
  final isDark = theme.brightness == Brightness.dark;

  final sheetBg = isDark ? const Color(0xFF141821) : Colors.white;
  final divider = isDark
      ? Colors.white.withOpacity(0.10)
      : Colors.black.withOpacity(0.08);

  final cancelBg = isDark ? const Color(0xFF2A2F3A) : const Color(0xFFEFF2FF);
  final cancelFg = isDark
      ? Colors.white.withOpacity(0.92)
      : const Color(0xFF2F4BFF);

  final confirmBg = const Color(0xFF2F4BFF);
  final confirmFg = Colors.white;

  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: false,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withOpacity(isDark ? 0.55 : 0.35),
    builder: (context) {
      return SafeArea(
        top: false,
        child: Container(
          decoration: BoxDecoration(
            color: sheetBg,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 14),
              Text(
                'Logout',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
              Divider(
                height: 1,
                thickness: 1,
                color: divider,
                indent: 20,
                endIndent: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 18,
                ),
                child: Text(
                  'Are you sure you want to log out?',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    height: 1.25,
                  ),
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
                color: divider,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 18),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: cancelBg,
                            foregroundColor: cancelFg,
                            shape: const StadiumBorder(),
                            textStyle: theme.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('Cancel'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: SizedBox(
                        height: 48,
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: confirmBg,
                            foregroundColor: confirmFg,
                            shape: const StadiumBorder(),
                            textStyle: theme.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text('Yes, Logout'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
