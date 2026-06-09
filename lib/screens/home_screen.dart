import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';
import '../widgets/user_card.dart';
import '../widgets/error_widget.dart';
import '../theme/app_theme.dart';
import 'posts_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _tab = 0;
  late Future<List<UserModel>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  void _loadUsers() {
    _usersFuture = ApiService.fetchUsers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.midBlue, AppColors.lightBlue],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.hub_rounded,
                color: AppColors.cream,
                size: 18,
              ),
            ),
            const SizedBox(width: 10),
            const Text('ConnectHub'),
          ],
        ),
      ),
      body: IndexedStack(
        index: _tab,
        children: [_buildUsersTab(), const PostsScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tab,
        onTap: (i) => setState(() => _tab = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline_rounded),
            activeIcon: Icon(Icons.people_rounded),
            label: 'Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            activeIcon: Icon(Icons.article_rounded),
            label: 'Posts',
          ),
        ],
      ),
    );
  }

  Widget _buildUsersTab() {
    return FutureBuilder<List<UserModel>>(
      future: _usersFuture,
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snap.hasError) {
          return ApiErrorWidget(
            message: snap.error.toString().replaceAll('Exception: ', ''),
            onRetry: _loadUsers,
          );
        }
        final users = snap.data!;
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildBanner(users.length)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, i) => UserCard(user: users[i]),
                childCount: users.length,
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(bottom: 24)),
          ],
        );
      },
    );
  }

  Widget _buildBanner(int count) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1A2255), Color(0xFF2A3465)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        // ignore: deprecated_member_use
        border: Border.all(color: AppColors.midBlue.withOpacity(0.4)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$count Members',
                  style: const TextStyle(
                    color: AppColors.cream,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Tap a user to view their profile & posts',
                  style: TextStyle(color: AppColors.lightBlue, fontSize: 13),
                ),
              ],
            ),
          ),
          const Icon(Icons.group_rounded, color: AppColors.midBlue, size: 48),
        ],
      ),
    );
  }
}
