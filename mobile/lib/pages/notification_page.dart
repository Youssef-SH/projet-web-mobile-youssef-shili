import 'package:club_hub/models/notification.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key, required this.accountType});

  final String accountType;
  static String routeName = "NotificationPage";

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final List<NotificationItem> studentNotifications = [
    NotificationItem(
      id: '1',
      type: 'Info',
      message: 'IEEE is organizing a 24-hour hackathon. Register now!',
      time: "5 min ago",
      isRead: false,
    ),
    NotificationItem(
      id: '2',
      type: 'Reminder',
      message: 'Web Development workshop starts in 2hours. Don\'t forget!',
      time: "6 min ago",
      isRead: true,
    ),
    NotificationItem(
      id: '3',
      type: 'Info',
      message: 'CPU is organizing an event. Register now!',
      time: " Yesterday",
      isRead: true,
    ),
    NotificationItem(
      id: '4',
      type: 'Info',
      message: 'Microsoft is organizing an event. Register now!',
      time: "2 days ago",
      isRead: true,
    ),
  ];

  final List<NotificationItem> clubNotifications = [
    NotificationItem(
      id: '1',
      type: 'Info',
      message: 'Dhia started following your club!',
      time: "5 min ago",
      isRead: false,
    ),
    NotificationItem(
      id: '2',
      type: 'Approval',
      message:
          'Admin has accepted your event request! Post about the event now!',
      time: "5 hours ago",
      isRead: true,
    ),
    NotificationItem(
      id: '3',
      type: 'Info',
      message: 'Youssef started following your club!',
      time: " Yesterday",
      isRead: true,
    ),
    NotificationItem(
      id: '4',
      type: 'Info',
      message: 'Eya started following your club!',
      time: "2 days ago",
      isRead: true,
    ),
  ];

  late List<NotificationItem> selectedNotifications;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
    selectedNotifications = widget.accountType == "Club"
        ? clubNotifications
        : studentNotifications;
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Color getNotificationColor(String type) {
    switch (type) {
      case "Info":
        return Colors.blue;
      case "Reminder":
        return Colors.orange;
      case "Approval":
        return Colors.green;
    }
    return Colors.black;
  }

  IconData getNotificationIcon(String type) {
    switch (type) {
      case "Info":
        return Icons.campaign_rounded;
      case "Reminder":
        return Icons.notifications_active_rounded;
      case "Approval":
        return Icons.check_circle_rounded;
    }
    return Icons.error;
  }

  @override
  Widget build(BuildContext context) {
    final unreadNotifications = selectedNotifications
        .where((n) => !n.isRead)
        .toList();

    return Scaffold(
      backgroundColor: Color(0xFF011029),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF001799), Color(0xFF011029)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              buildHeader(),
              buildTabBar(),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    buildNotificationList(selectedNotifications),
                    buildNotificationList(unreadNotifications),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    final unreadCount = selectedNotifications.where((n) => !n.isRead).length;

    return Container(
      padding: EdgeInsets.fromLTRB(24, 20, 24, 16),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
            ),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: -0.5,
                      ),
                    ),
                    if (unreadCount > 0) ...[
                      SizedBox(width: 12),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.amber, Colors.orange.shade600],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.amber.withValues(alpha: 0.4),
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Text(
                          '$unreadCount',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  'Stay connected with your clubs',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
            ),
            child: IconButton(
              onPressed: showMarkAllAsReadDialog,
              icon: Icon(Icons.done_all_rounded, color: Colors.white, size: 22),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTabBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
      ),
      child: TabBar(
        controller: tabController,
        indicator: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.amber, Colors.orange.shade600],
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.amber.withValues(alpha: 0.4),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey[400],
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        tabs: [
          Tab(text: 'All'),
          Tab(text: 'Unread'),
        ],
      ),
    );
  }

  Widget buildNotificationList(List<NotificationItem> items) {
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.05),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
              ),
              child: Icon(
                Icons.notifications_off_outlined,
                size: 64,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 24),
            Text(
              'No notifications',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'You\'re all caught up!',
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return buildNotificationCard(items[index]);
      },
    );
  }

  Widget buildNotificationCard(NotificationItem notification) {
    final color = getNotificationColor(notification.type);
    final icon = getNotificationIcon(notification.type);

    return Dismissible(
      key: Key(notification.id),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.red.shade400,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        child: Icon(
          Icons.delete_outline_rounded,
          color: Colors.white,
          size: 28,
        ),
      ),
      onDismissed: (direction) {
        setState(() {
          selectedNotifications.remove(notification);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Notification deleted'),
            backgroundColor: Color(0xFF0A1A3A),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          setState(() {
            final index = selectedNotifications.indexOf(notification);
            if (index != -1) {
              selectedNotifications[index] = NotificationItem(
                id: notification.id,
                type: notification.type,
                message: notification.message,
                time: notification.time,
                isRead: true,
              );
            }
          });
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: notification.isRead
                ? Color(0xFF0A1A3A)
                : Color(0xFF0A1A3A).withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: notification.isRead
                  ? Colors.white.withValues(alpha: 0.1)
                  : color.withValues(alpha: 0.3),
              width: notification.isRead ? 1 : 2,
            ),
            boxShadow: notification.isRead
                ? []
                : [
                    BoxShadow(
                      color: color.withValues(alpha: 0.2),
                      blurRadius: 8,
                      spreadRadius: 0,
                    ),
                  ],
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        color.withValues(alpha: 0.8),
                        color.withValues(alpha: 0.6),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: color.withValues(alpha: 0.3),
                        blurRadius: 8,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Icon(icon, color: Colors.white, size: 24),
                ),

                SizedBox(width: 12),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              notification.message,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[200],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          if (!notification.isRead)
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: color.withValues(alpha: 0.5),
                                    blurRadius: 4,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            size: 14,
                            color: Colors.grey[600],
                          ),
                          SizedBox(width: 4),
                          Text(
                            notification.time,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showMarkAllAsReadDialog() {
    final unreadCount = selectedNotifications.where((n) => !n.isRead).length;

    if (unreadCount == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No unread notifications'),
          backgroundColor: Color(0xFF0A1A3A),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF0A1A3A),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Mark all as read?',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: Text(
          'This will mark $unreadCount notification${unreadCount > 1 ? 's' : ''} as read.',
          style: TextStyle(color: Colors.grey[400]),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: TextStyle(color: Colors.grey[400])),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                for (int i = 0; i < selectedNotifications.length; i++) {
                  selectedNotifications[i] = NotificationItem(
                    id: selectedNotifications[i].id,
                    type: selectedNotifications[i].type,
                    message: selectedNotifications[i].message,
                    time: selectedNotifications[i].time,
                    isRead: true,
                  );
                }
              });
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Mark all',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
