import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:new_project/core/presentation/state/provider_view_model.dart';
import 'package:new_project/core/presentation/widgets/text_holder.dart';
import 'package:new_project/features/home/presentation/state/grant_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/di/di_config.dart';
import '../../../../core/managers/local_sorage.dart';
import '../../../auth/data/models/user_model.dart';
import 'components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserModel? user;

  Future<void> _loadDashboard() async {
    try {
      final userMap = inject<LocalStorageService>().getJson("user");
      if (userMap != null) {
        setState(() {
          user = UserModelMapper.fromMap(userMap);
        });
      }
      await context.read<GrantProvider>().getDashboardData();
    } catch (e) {
      debugPrint('Error loading dashboard: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadDashboard();
    });
  }


  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
        viewModel: GrantProvider(inject()),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(50),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset("assets/svg/avatar.svg"),
                        ),
                        TextHolder(
                          title: "Hello, ",
                          size: 20,
                          fontWeight: FontWeight.w300,
                        ),
                        TextHolder(
                          title: "${user?.fullname}",
                          size: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        TextHolder(
                          title: "Your Business has",
                          size: 20,
                          fontWeight: FontWeight.w300,
                        ),
                        TextHolder(
                          title: " ${user?.grant_recommendations?.length ?? 0} ",
                          size: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.amber,
                        ),
                        TextHolder(
                          title: " Matches",
                          size: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Stats Cards
                    StatsCard(
                      title: 'No of grants due in the next 30 days',
                      value: '${viewModel.dashboardData?.data?.due_in_thirty_day ?? 0}',
                      backgroundColor: Colors.grey[800],
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 12),
                    const StatsCard(
                      title: 'Value of grants due in the next 30 days',
                      value: '\$7,868,029,399.00',
                      backgroundColor: Colors.amber,
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 12),
                     StatsCard(
                      title: "Number of Grants you're highly eligible for",
                      value: '${viewModel.dashboardData?.data?.high_eligibility_count ?? 0}',
                      backgroundColor: Color(0xFFFFF3E0),
                      textColor: Colors.black,
                    ),

                    const SizedBox(height: 24),

                    // Explore Grants Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Explore Grants',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'See More',
                            style: TextStyle(
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ListView.builder(
                      itemCount: 20,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (c, i) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: GrantCard(
                          imageUrl: 'assets/hunger_fighters.jpg',
                          title: 'Land O Lakes Foundation community Grants',
                          amount: '\$318,000',
                          funder: 'US Department of Justice',
                          deadline: 'Dec 19, 2023',
                          isEligible: true,
                          score: '8',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
