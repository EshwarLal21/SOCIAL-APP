import 'package:flutter/material.dart';
import 'package:torogi/data/repositories/profile_repository.dart';

class BannerUpgradePage extends StatefulWidget {
  final String userId;
  const BannerUpgradePage({super.key, required this.userId});

  @override
  State<BannerUpgradePage> createState() => _BannerUpgradePageState();
}

class _BannerUpgradePageState extends State<BannerUpgradePage> {
  final ProfileRepository _repository = ProfileRepository();
  String currentBanner = '';
  int currentCredits = 0;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final user = await _repository.fetchUserProfile(widget.userId);
    setState(() {
      currentBanner = user['banner'] ?? 'guest';
      currentCredits = user['credits'] ?? 0;
    });
  }

  Future<void> _upgradeTo(String banner) async {
    try {
      await _repository.upgradeBannerTo(widget.userId, banner);
      await _loadProfile();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('🎉 Successfully upgraded to $banner!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ ${e.toString().replaceFirst("Exception: ", "")}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> upgradeButtons = [];

    if (currentBanner == 'bronze') {
      upgradeButtons.add(ElevatedButton(
        onPressed: () => _upgradeTo('silver'),
        child: const Text('Upgrade to Silver (2 credits)'),
      ));
    } else if (currentBanner == 'silver') {
      upgradeButtons.add(ElevatedButton(
        onPressed: () => _upgradeTo('gold'),
        child: const Text('Upgrade to Gold (2 credits)'),
      ));
    } else {
      upgradeButtons.add(const Text('No upgrade options available.'));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Upgrade Banner')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current Banner: $currentBanner', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Credits: $currentCredits', style: const TextStyle(fontSize: 20)),
            const Divider(height: 30),
            const Text(
              'Available Upgrades:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            ...upgradeButtons
          ],
        ),
      ),
    );
  }
}
