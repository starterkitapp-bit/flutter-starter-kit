import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';

/// Minimal entry screen for validating the shared application foundation.
class HomePage extends StatelessWidget {
  /// Creates the starter kit entry screen.
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => FScaffold(
    child: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Flutter Starter Kit',
                style: context.theme.typography.display.lg,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'The reusable application foundation starts here.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
