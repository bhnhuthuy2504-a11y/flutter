import 'package:flutter/material.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _birthdateController;

  String _selectedCountry = 'US';
  String _selectedGender = 'Male';
  DateTime _selectedBirthdate = DateTime(1995, 12, 25);

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(text: 'Andrew Ainsley');
    _emailController = TextEditingController(text: 'andrew.ainsley@yourdomain.com');
    _phoneController = TextEditingController(text: '+1 111 467 378 399');
    _birthdateController = TextEditingController(text: _formatDate(_selectedBirthdate));
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _birthdateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final scaffoldBg = isDark ? const Color(0xFF141821) : const Color(0xFFFFFFFF);
    final fieldBg = isDark ? const Color(0xFF1E2430) : const Color(0xFFF5F6F8);
    final subtleText = isDark
        ? theme.colorScheme.onBackground.withOpacity(0.75)
        : theme.colorScheme.onBackground.withOpacity(0.6);

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
          'My Profile',
          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          children: [
            _ProfileAvatar(
              isDark: isDark,
              onEdit: () {
                // Intentionally UI-only.
              },
            ),
            const SizedBox(height: 24),
            _FieldLabel(text: 'Full Name', color: subtleText),
            const SizedBox(height: 10),
            _InputCard(
              background: fieldBg,
              isDark: isDark,
              child: TextField(
                controller: _fullNameController,
                style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                decoration: _inputDecoration(hintText: 'Full Name', isDark: isDark),
              ),
            ),
            const SizedBox(height: 18),
            _FieldLabel(text: 'Email', color: subtleText),
            const SizedBox(height: 10),
            _InputCard(
              background: fieldBg,
              isDark: isDark,
              child: Row(
                children: [
                  Icon(
                    Icons.mail_outline_rounded,
                    size: 20,
                    color: subtleText,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _emailController,
                      readOnly: true,
                      style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                      decoration: _inputDecoration(hintText: 'Email', isDark: isDark),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            _FieldLabel(text: 'Phone Number', color: subtleText),
            const SizedBox(height: 10),
            _InputCard(
              background: fieldBg,
              isDark: isDark,
              child: Row(
                children: [
                  _CountryChip(
                    isDark: isDark,
                    country: _selectedCountry,
                    onTap: () {
                      setState(() {
                        _selectedCountry = _selectedCountry == 'US' ? 'GB' : 'US';
                      });
                    },
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                      decoration: _inputDecoration(hintText: 'Phone Number', isDark: isDark),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            _FieldLabel(text: 'Gender', color: subtleText),
            const SizedBox(height: 10),
            _InputCard(
              background: fieldBg,
              isDark: isDark,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedGender,
                  isExpanded: true,
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: subtleText,
                  ),
                  dropdownColor: isDark ? const Color(0xFF1E2430) : Colors.white,
                  items: const [
                    DropdownMenuItem(value: 'Male', child: Text('Male')),
                    DropdownMenuItem(value: 'Female', child: Text('Female')),
                    DropdownMenuItem(value: 'Other', child: Text('Other')),
                  ],
                  onChanged: (v) {
                    if (v == null) return;
                    setState(() => _selectedGender = v);
                  },
                ),
              ),
            ),
            const SizedBox(height: 18),
            _FieldLabel(text: 'Birthdate', color: subtleText),
            const SizedBox(height: 10),
            _InputCard(
              background: fieldBg,
              isDark: isDark,
              child: InkWell(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedBirthdate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    builder: (context, child) {
                      final theme = Theme.of(context);
                      return Theme(
                        data: theme.copyWith(
                          colorScheme: theme.colorScheme.copyWith(
                            surface: isDark ? const Color(0xFF1E2430) : Colors.white,
                          ),
                        ),
                        child: child ?? const SizedBox.shrink(),
                      );
                    },
                  );
                  if (picked == null) return;
                  setState(() {
                    _selectedBirthdate = picked;
                    _birthdateController.text = _formatDate(picked);
                  });
                },
                borderRadius: BorderRadius.circular(16),
                child: Row(
                  children: [
                    Expanded(
                      child: IgnorePointer(
                        child: TextField(
                          controller: _birthdateController,
                          readOnly: true,
                          style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                          decoration: _inputDecoration(hintText: 'Birthdate', isDark: isDark),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.calendar_month_rounded,
                      size: 20,
                      color: subtleText,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    String two(int v) => v.toString().padLeft(2, '0');
    return '${two(date.month)}/${two(date.day)}/${date.year}';
  }

  InputDecoration _inputDecoration({required String hintText, required bool isDark}) {
    return InputDecoration(
      isDense: true,
      hintText: hintText,
      border: InputBorder.none,
      contentPadding: EdgeInsets.zero,
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({
    required this.isDark,
    required this.onEdit,
  });

  final bool isDark;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomRight,
        children: [
          const CircleAvatar(
            radius: 44,
            backgroundImage: AssetImage('assets/images/profile_placeholder.png'),
          ),
          Positioned(
            right: -2,
            bottom: -2,
            child: Material(
              color: const Color(0xFF2F80ED),
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: onEdit,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isDark ? const Color(0xFF141821) : Colors.white,
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.edit_rounded,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}

class _InputCard extends StatelessWidget {
  const _InputCard({
    required this.background,
    required this.isDark,
    required this.child,
  });

  final Color background;
  final bool isDark;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isDark
            ? null
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: DefaultTextStyle.merge(
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          child: child,
        ),
      ),
    );
  }
}

class _CountryChip extends StatelessWidget {
  const _CountryChip({
    required this.isDark,
    required this.country,
    required this.onTap,
  });

  final bool isDark;
  final String country;
  final VoidCallback onTap;

  String get _flagEmoji {
    switch (country) {
      case 'GB':
        return '🇬🇧';
      case 'US':
      default:
        return '🇺🇸';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final subtle = isDark
        ? theme.colorScheme.onBackground.withOpacity(0.75)
        : theme.colorScheme.onBackground.withOpacity(0.6);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _flagEmoji,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(width: 6),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 20,
              color: subtle,
            ),
          ],
        ),
      ),
    );
  }
}

