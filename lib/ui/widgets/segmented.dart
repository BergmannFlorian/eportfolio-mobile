import 'package:material_ui/material_ui.dart';

import '../theme/app_theme.dart';
import 'common.dart';

/// Joined mono buttons; the selected one uses the inverse palette.
class SegmentedFilter<T> extends StatelessWidget {
  const SegmentedFilter({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
    this.semanticLabel,
  });

  final List<(T, String)> options;
  final T selected;
  final ValueChanged<T> onChanged;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    return Semantics(
      label: semanticLabel,
      container: true,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: c.borderStrong)),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final (i, (value, label)) in options.indexed) ...[
                if (i > 0) Container(width: 1, color: c.borderStrong),
                Expanded(
                  child: Semantics(
                    selected: value == selected,
                    inMutuallyExclusiveGroup: true,
                    child: Pressable(
                      onTap: () => onChanged(value),
                      builder: (context, pressed) {
                        final on = value == selected;
                        return Container(
                          height: 44,
                          alignment: Alignment.center,
                          color: on ? c.inverse : (pressed ? c.border : null),
                          child: Text(
                            label,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppText.mono(
                              on ? c.inverseFg : c.fgStrong,
                              letterSpacing: 0.5,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
