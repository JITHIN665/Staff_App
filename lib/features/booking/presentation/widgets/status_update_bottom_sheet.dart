import 'package:flutter/material.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/theme/app_theme.dart';
import '../../../../shared/helpers/app_icons.dart';
import '../../domain/entities/booking.dart';

class StatusUpdateBottomSheet extends StatefulWidget {
  final BookingStatus currentStatus;
  final Function(BookingStatus) onStatusSelected;

  const StatusUpdateBottomSheet({
    super.key,
    required this.currentStatus,
    required this.onStatusSelected,
  });

  @override
  State<StatusUpdateBottomSheet> createState() => _StatusUpdateBottomSheetState();
}

class _StatusUpdateBottomSheetState extends State<StatusUpdateBottomSheet> {
  late BookingStatus _selectedStatus;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.currentStatus;
  }

  void _handleUpdate() {
    widget.onStatusSelected(_selectedStatus);
    Navigator.pop(context);
  }

  void _handleCancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIcons.pencilIcon(size: 20, color: AppTheme.primaryColor),
                  const SizedBox(width: 8),
                  Text(
                    '客室ステータス更新',
                    style: AppTheme.heading3(),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Divider(),
              const SizedBox(height: 12),
              StatusOption(
                label: '予約済み',
                isSelected: _selectedStatus == BookingStatus.reserved,
                onTap: () => setState(() => _selectedStatus = BookingStatus.reserved),
              ),
              const SizedBox(height: 8),
              StatusOption(
                label: 'チェックイン済み',
                isSelected: _selectedStatus == BookingStatus.checkedIn,
                onTap: () => setState(() => _selectedStatus = BookingStatus.checkedIn),
              ),
              
              const SizedBox(height: 8),
              
              StatusOption(
                label: 'チェックアウト済み',
                isSelected: _selectedStatus == BookingStatus.checkedOut,
                onTap: () => setState(() => _selectedStatus = BookingStatus.checkedOut),
              ),
              
              const SizedBox(height: 32),
              
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: '閉じる',
                      onPressed: _handleCancel,
                      backgroundColor: Colors.white,
                      textColor: const Color(0xFF00338D),
                      borderColor: const Color(0xFF00338D),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomButton(
                      text: '更新',
                      onPressed: _handleUpdate,
                      backgroundColor: const Color(0xFF00338D),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class StatusOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const StatusOption({super.key, 
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected 
                      ? AppTheme.primaryColor
                      : Colors.grey[400]!,
                  width: 2,
                ),
                color: Colors.white,
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: AppTheme.bodyLarge(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
