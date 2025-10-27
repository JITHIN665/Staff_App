import 'package:flutter/material.dart';
import 'package:staff_app/shared/theme/app_theme.dart';
import '../helpers/ui_helpers.dart';

class DateAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String date;
  final VoidCallback? onRestaurantPressed;
  final VoidCallback? onCalendarPressed;

  const DateAppBar({
    super.key,
    required this.date,
    this.onRestaurantPressed,
    this.onCalendarPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      
      title: Row(
        children: [
          Text(
            date,
            style: AppTheme.title1(fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(horizontal: 12,vertical: 6),
            decoration: BoxDecoration(border: Border.all(color: AppTheme.primaryColor,width: 2),borderRadius: BorderRadius.circular(100)),
            child: Row(
            children: [
              const Icon(Icons.restaurant_outlined, color: Colors.blue),
              SizedBox(width: 4,),
              Text("食数確認",style: AppTheme.bodyMedium(fontWeight: FontWeight.w500),)
            ],
          )),
          IconButton(
            icon: const Icon(Icons.calendar_today, color: Colors.blue),
            onPressed: onCalendarPressed ?? () {},
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

