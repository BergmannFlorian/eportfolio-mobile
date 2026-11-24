import 'package:material_ui/material_ui.dart';

import '../../l10n/generated/app_localizations.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

/// Shown when a detail screen's id is not in the loaded data.
class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(20, 48, 20, 20),
      children: [
        Kicker(l10n.errorKicker),
        const SizedBox(height: 14),
        Text(
          l10n.errorNotFound,
          style: AppText.heading(context.colors.fgStrong, size: 22),
        ),
      ],
    );
  }
}
