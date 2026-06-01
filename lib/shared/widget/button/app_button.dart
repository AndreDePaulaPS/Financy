import 'package:flutter/widgets.dart';
import 'package:flutter_finance_app/core/theme/app_colors.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  const AppButton({super.key, required this.label, this.onTap });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          boxShadow: [BoxShadow(color: AppColors.textPrimary.withValues(alpha: 0.35), blurRadius: 25, offset: const Offset(0, 12))],
          gradient: const LinearGradient(colors: [
            
            AppColors.greenPrimary, AppColors.greenSecondary
          ],
          begin: AlignmentGeometry.topCenter,
          end: AlignmentGeometry.bottomCenter)
      
        ),
        child: Center(child: Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.white) ,textAlign: TextAlign.center,)),
      ),
    );
  }
}