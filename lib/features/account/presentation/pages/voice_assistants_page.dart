import 'package:flutter/material.dart';

class VoiceAssistantsPage extends StatelessWidget {
  const VoiceAssistantsPage({super.key});

  static const _assistants = <_VoiceAssistantUiModel>[
    _VoiceAssistantUiModel(
      name: 'Google Assistant',
      isLinked: false,
      fallbackLogo: _AssistantLogo.googleAssistant,
    ),
    _VoiceAssistantUiModel(
      name: 'Amazon Alexa',
      isLinked: true,
      fallbackLogo: _AssistantLogo.amazonAlexa,
    ),
    _VoiceAssistantUiModel(
      name: 'Microsoft Cortana',
      isLinked: true,
      fallbackLogo: _AssistantLogo.microsoftCortana,
    ),
    _VoiceAssistantUiModel(
      name: 'Samsung Bixby',
      isLinked: false,
      fallbackLogo: _AssistantLogo.samsungBixby,
    ),
    _VoiceAssistantUiModel(
      name: 'Naver Clova',
      isLinked: false,
      fallbackLogo: _AssistantLogo.naverClova,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final scaffoldBg = isDark ? const Color(0xFF141821) : const Color(0xFFF6F7F9);
    final cardBg = isDark ? const Color(0xFF1E2430) : Colors.white;

    return Scaffold(
      backgroundColor: scaffoldBg,
      appBar: AppBar(
        backgroundColor: scaffoldBg,
        surfaceTintColor: scaffoldBg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'Voice Assistants',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: () {
              // Intentionally left blank (UI-only).
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: GridView.builder(
            itemCount: _assistants.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 18,
              crossAxisSpacing: 18,
              childAspectRatio: 0.92,
            ),
            itemBuilder: (context, index) {
              final item = _assistants[index];
              return _VoiceAssistantCard(
                name: item.name,
                isLinked: item.isLinked,
                cardColor: cardBg,
                logo: _AssistantLogoWidget(
                  kind: item.fallbackLogo,
                ),
                onTap: () {
                  // Intentionally left blank (UI-only).
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class _VoiceAssistantCard extends StatelessWidget {
  const _VoiceAssistantCard({
    required this.name,
    required this.isLinked,
    required this.cardColor,
    required this.logo,
    required this.onTap,
  });

  final String name;
  final bool isLinked;
  final Color cardColor;
  final Widget logo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final statusColor = isDark
        ? theme.colorScheme.onSurface.withOpacity(0.65)
        : theme.colorScheme.onSurface.withOpacity(0.55);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: isDark
                ? null
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 76, width: 76, child: Center(child: logo)),
                const SizedBox(height: 14),
                Text(
                  name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  isLinked ? 'Linked' : 'Unlinked',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum _AssistantLogo {
  googleAssistant,
  amazonAlexa,
  microsoftCortana,
  samsungBixby,
  naverClova,
}

class _AssistantLogoWidget extends StatelessWidget {
  const _AssistantLogoWidget({
    required this.kind,
  });

  final _AssistantLogo kind;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: _bgColorFor(kind, isDark),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Center(
        child: Image.asset(
          _iconFor(kind),
          width: 100,
          height: 100,
        ),
      ),
    );
  }

  Color _bgColorFor(_AssistantLogo kind, bool isDark) {
    switch (kind) {
      case _AssistantLogo.googleAssistant:
        return isDark ? const Color(0xFF2A3854) : const Color(0xFFEAF2FF);
      case _AssistantLogo.amazonAlexa:
        return isDark ? const Color(0xFF1D3B45) : const Color(0xFFE6F7FF);
      case _AssistantLogo.microsoftCortana:
        return isDark ? const Color(0xFF1F3A4A) : const Color(0xFFEAF7FF);
      case _AssistantLogo.samsungBixby:
        return isDark ? const Color(0xFF24325A) : const Color(0xFFEFF2FF);
      case _AssistantLogo.naverClova:
        return isDark ? const Color(0xFF163D33) : const Color(0xFFE7FFF6);
    }
  }

  Color _fgColorFor(_AssistantLogo kind) {
    switch (kind) {
      case _AssistantLogo.googleAssistant:
        return const Color(0xFF3B82F6);
      case _AssistantLogo.amazonAlexa:
        return const Color(0xFF38BDF8);
      case _AssistantLogo.microsoftCortana:
        return const Color(0xFF0EA5E9);
      case _AssistantLogo.samsungBixby:
        return const Color(0xFF2563EB);
      case _AssistantLogo.naverClova:
        return const Color(0xFF10B981);
    }
  }

  String _iconFor(_AssistantLogo kind) {
    switch (kind) {
      case _AssistantLogo.googleAssistant:
        return 'assets/images/google_assistant_logo.png';
      case _AssistantLogo.amazonAlexa:
        return 'assets/images/amazon_alexa_logo.png';
      case _AssistantLogo.microsoftCortana:
        return 'assets/images/microsoft_cortana_logo.png';
      case _AssistantLogo.samsungBixby:
        return 'assets/images/samsung_bixby_logo.png';
      case _AssistantLogo.naverClova:
        return 'assets/images/naver_clova_logo.png';
    }
  }
}

class _VoiceAssistantUiModel {
  const _VoiceAssistantUiModel({
    required this.name,
    required this.isLinked,
    required this.fallbackLogo,
  });

  final String name;
  final bool isLinked;
  final _AssistantLogo fallbackLogo;
}

