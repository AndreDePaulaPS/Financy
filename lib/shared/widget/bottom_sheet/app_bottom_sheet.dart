import 'package:flutter/material.dart';

void appShowBottomSheet({
  required BuildContext context,
  required String text,
  required String textButton,
  required VoidCallback onClick,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Theme.of(context).colorScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(28),
      ),
    ),
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    onClick();
                  },
                  child: Text(textButton),
                ),
              ),

              SizedBox(height: 30,)

            ],
          ),
        ),
      );
    },
  );
}