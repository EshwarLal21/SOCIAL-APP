import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:torogi/data/repositories/profile_repository.dart';
import '../widgets/ad_widgets.dart';

class ContributionPage extends StatefulWidget {
  final String userId;
  const ContributionPage({super.key, required this.userId});

  @override
  State<ContributionPage> createState() => _ContributionPageState();
}

class _ContributionPageState extends State<ContributionPage> {
  final ProfileRepository _repository = ProfileRepository();
  int adClicks = 0;
  int currentCredits = 0;
  String currentBanner = 'guest';

  @override
  void initState() {
    super.initState();
    _loadUserDetails();
  }

  Future<void> _loadUserDetails() async {
    try {
      final user = await _repository.fetchUserProfile(widget.userId);
      if (mounted) {
        setState(() {
          currentCredits = user['credits'] ?? 0;
          currentBanner = user['banner']?.toString() ?? 'guest';
        });
      }
    } catch (e) {
      debugPrint('Error loading user details: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error loading user details')),
        );
      }
    }
  }

  Future<void> _handleAdReward() async {
    try {
      // Increment credits by 1 for each ad click
      await _repository.addCredits(widget.userId, 1);
      await _loadUserDetails();
      if (mounted) {
        setState(() {
          adClicks++;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('🎉 You earned 1 credit!')),
        );
      }
    } catch (e) {
      debugPrint('Error adding credits: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error adding credits')),
        );
      }
    }
  }

  Future<void> _upgradeBanner(String targetBanner, int requiredCredits) async {
    if (currentCredits < requiredCredits) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('❌ Not enough credits. You need $requiredCredits credits')),
        );
      }
      return;
    }

    final allowed = (targetBanner == 'bronze' && currentBanner == 'guest') ||
        (targetBanner == 'silver' && currentBanner == 'bronze') ||
        (targetBanner == 'gold' && currentBanner == 'silver');

    if (!allowed) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('❌ You cannot upgrade from $currentBanner to $targetBanner')),
        );
      }
      return;
    }

    try {
      await Supabase.instance.client.from('users').update({
        'banner': targetBanner,
        'credits': currentCredits - requiredCredits,
      }).eq('id', widget.userId);

      await _loadUserDetails();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('✅ Successfully upgraded to $targetBanner!')),
        );
      }
    } catch (e) {
      debugPrint('Error upgrading banner: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error upgrading banner')),
        );
      }
    }
  }

  Widget _buildUpgradeButton(String targetBanner, int requiredCredits) {
    bool allowed = false;

    if (targetBanner == 'bronze' && currentBanner == 'guest') {
      allowed = true;
    } else if (targetBanner == 'silver' && currentBanner == 'bronze') {
      allowed = true;
    } else if (targetBanner == 'gold' && currentBanner == 'silver') {
      allowed = true;
    }

    return ElevatedButton(
      onPressed: allowed ? () => _upgradeBanner(targetBanner, requiredCredits) : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: allowed ? Colors.teal : Colors.grey,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        'Upgrade to ${targetBanner.toUpperCase()} ($requiredCredits credits)',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Earn & Upgrade'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Your Credits: $currentCredits',
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Your Banner: ${currentBanner.toUpperCase()}',
                style: const TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 24),
              Text(
                'Ads Watched: $adClicks',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              RewardedAdWidget(
                onRewarded: _handleAdReward,
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Watch Rewarded Ad',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 20),
              const Text(
                'Upgrade Requirements:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              _buildUpgradeButton('bronze', 10),
              const SizedBox(height: 12),
              _buildUpgradeButton('silver', 20),
              const SizedBox(height: 12),
              _buildUpgradeButton('gold', 20),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 16),
              const Text(
                '📌 Policy:',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              const Text('• 1 Ad = 1 Credit'),
              const Text('• Guest → Bronze = 10 credits'),
              const Text('• Bronze → Silver = 20 credits'),
              const Text('• Silver → Gold = 20 credits'),
              const Text('• Only Bronze can become Silver, only Silver can become Gold'),
              const SizedBox(height: 30),
              const AdBannerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}