import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _supabase = Supabase.instance.client;
  List<Map<String, dynamic>> _featuredUsers = [];
  List<Map<String, dynamic>> _featuredServices = [];
  List<Map<String, dynamic>> _blogs = [];
  bool _isLoading = true;

  // AdMob IDs
  static const String _bannerAdUnitId = 'ca-app-pub-4286938835169204/2358063815';
  static const String _rewardedAdUnitId = 'ca-app-pub-4286938835169204/9915562586';
  static const String _nativeAdUnitId = 'ca-app-pub-4286938835169204/3469573734';

  // Ad controllers
  BannerAd? _bannerAd;
  RewardedAd? _rewardedAd;
  NativeAd? _nativeAd;
  bool _isRewardedAdLoaded = false;

  @override
  void initState() {
    super.initState();
    MobileAds.instance.initialize().then((_) {
      _loadFeaturedUsers();
      _loadFeaturedServices();
      _loadBlogs();
      _loadAds();
    });
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _rewardedAd?.dispose();
    _nativeAd?.dispose();
    super.dispose();
  }

  Future<void> _loadAds() async {
    try {
      // Load banner ad
      await _loadBannerAd();
      
      // Load rewarded ad
      await _loadRewardedAd();
      
      // Load native ad
      await _loadNativeAd();
    } catch (e) {
      debugPrint('Error loading ads: $e');
    }
  }

  Future<void> _loadBannerAd() async {
    if (_bannerAd != null) {
      _bannerAd!.dispose();
    }
    
    _bannerAd = BannerAd(
      adUnitId: _bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          debugPrint('Banner ad loaded successfully');
          if (mounted) setState(() {});
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('Banner ad failed to load: $error');
          ad.dispose();
          _bannerAd = null;
        },
      ),
    );

    try {
      await _bannerAd?.load();
    } catch (e) {
      debugPrint('Error loading banner ad: $e');
      _bannerAd?.dispose();
      _bannerAd = null;
    }
  }

  Future<void> _loadRewardedAd() async {
    if (_rewardedAd != null) {
      _rewardedAd!.dispose();
    }

    try {
      await RewardedAd.load(
        adUnitId: _rewardedAdUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            debugPrint('Rewarded ad loaded successfully');
            _rewardedAd = ad;
            if (mounted) {
              setState(() {
                _isRewardedAdLoaded = true;
              });
            }
          },
          onAdFailedToLoad: (error) {
            debugPrint('Rewarded ad failed to load: $error');
            _rewardedAd = null;
            if (mounted) {
              setState(() {
                _isRewardedAdLoaded = false;
              });
            }
          },
        ),
      );
    } catch (e) {
      debugPrint('Error loading rewarded ad: $e');
      _rewardedAd = null;
      if (mounted) {
        setState(() {
          _isRewardedAdLoaded = false;
        });
      }
    }
  }

  Future<void> _loadNativeAd() async {
    if (_nativeAd != null) {
      _nativeAd!.dispose();
    }

    _nativeAd = NativeAd(
      adUnitId: _nativeAdUnitId,
      factoryId: 'listTile',
      listener: NativeAdListener(
        onAdLoaded: (_) {
          debugPrint('Native ad loaded successfully');
          if (mounted) setState(() {});
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint('Native ad failed to load: $error');
          ad.dispose();
          _nativeAd = null;
        },
      ),
      request: const AdRequest(),
    );

    try {
      await _nativeAd?.load();
    } catch (e) {
      debugPrint('Error loading native ad: $e');
      _nativeAd?.dispose();
      _nativeAd = null;
    }
  }

  Future<void> _loadBlogs() async {
    try {
      final response = await _supabase
          .from('blogs')
          .select()
          .order('created_at', ascending: false);

      setState(() {
        _blogs = List<Map<String, dynamic>>.from(response);
        _isLoading = false;
      });
    } catch (e) {
      debugPrint('Error loading blogs: $e');
    }
  }

  Future<void> _loadFeaturedUsers() async {
    try {
      final response = await _supabase
          .from('users')
          .select()
          .order('created_at', ascending: false)
          .limit(5);

      setState(() {
        _featuredUsers = List<Map<String, dynamic>>.from(response);
      });
    } catch (e) {
      debugPrint('Error loading featured users: $e');
    }
  }

  Future<void> _loadFeaturedServices() async {
    try {
      final response = await _supabase
          .from('services')
          .select()
          .order('created_at', ascending: false)
          .limit(5);

      setState(() {
        _featuredServices = List<Map<String, dynamic>>.from(response);
      });
    } catch (e) {
      debugPrint('Error loading featured services: $e');
    }
  }

  void _showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _loadRewardedAd(); // Reload the ad
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          debugPrint('Failed to show rewarded ad: $error');
          ad.dispose();
          _loadRewardedAd(); // Reload the ad
        },
      );
      _rewardedAd!.show(
        onUserEarnedReward: (_, reward) {
          // Handle reward
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('You earned ${reward.amount} ${reward.type}'),
            ),
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Rewarded ad is not ready yet. Please try again later.'),
        ),
      );
    }
  }

  Widget _buildBannerAd() {
    if (_bannerAd == null) {
      return const SizedBox(height: 50); // Placeholder height for banner
    }

    return Container(
      alignment: Alignment.center,
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd!),
    );
  }

  Widget _buildBlogs() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _blogs.length + (_blogs.length ~/ 2), // Add space for ads
      itemBuilder: (context, index) {
        // Show ad after every 2 posts
        if (index > 0 && index % 3 == 0) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: _buildBannerAd(),
          );
        }

        // Calculate the actual blog index
        final blogIndex = index - (index ~/ 3);
        if (blogIndex >= _blogs.length) {
          return const SizedBox.shrink();
        }

        final blog = _blogs[blogIndex];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (blog['image_url'] != null)
                Image.network(
                  blog['image_url'],
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      blog['title'] ?? 'Untitled',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      blog['content'] ?? 'No content',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          timeago.format(
                            DateTime.parse(blog['created_at']),
                            allowFromNow: true,
                          ),
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                        if (_isRewardedAdLoaded)
                          TextButton(
                            onPressed: _showRewardedAd,
                            child: const Text('Watch Ad for More'),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildFeaturedUsers(),
            _buildFeaturedServices(),
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Latest Posts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildBlogs(),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedUsers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'New Users',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: _featuredUsers.length,
            itemBuilder: (context, index) {
              final user = _featuredUsers[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/profile',
                    arguments: user['id'],
                  );
                },
                child: Container(
                  width: 100,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[200],
                        child: Text(
                          user['username'][0].toUpperCase(),
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        user['username'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedServices() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'New Services',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: _featuredServices.length,
          itemBuilder: (context, index) {
            final service = _featuredServices[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/service-details',
                  arguments: service['id'],
                );
              },
              child: Card(
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        service['title'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        service['description'],
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${service['price']}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3797EF),
                            ),
                          ),
                          Text(
                            timeago.format(
                              DateTime.parse(service['created_at']).toLocal(),
                              allowFromNow: true,
                            ),
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
} 