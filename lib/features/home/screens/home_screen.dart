import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:yo_trade/common/constants/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:yo_trade/config/theme/app_color.dart';
import 'package:yo_trade/features/home/widgets/portfolio_balance_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            '$iconAssets/ic_profile.svg',
            fit: BoxFit.cover,
            width: 24.w,
            height: 24.w,
          ),
        ),
        centerTitle: true,
        title: Image.asset('$imageAssets/img_brand_name.png'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              '$iconAssets/ic_setting.svg',
              fit: BoxFit.cover,
              width: 24.w,
              height: 24.w,
            ),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Portfolio Balance'),
                Gap(5.h),
                Text('\$2,760.23',
                    style: Theme.of(context).textTheme.titleLarge),
                Gap(5.h),
                const Text('+2.60%'),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
                width: double.infinity,
                height: 120.h,
                child: LineChart(portfolioBalanceChartData())),
          ),
          TopRowOfLists(
            title: 'Market Movers',
            onTap: () {},
            margitTop: 20.h,
          ),
          const MarketMoversWidget(),
          TopRowOfLists(title: 'Portfolio', onTap: () {}),
       
        ],
      ),
    );
  }
}

class TopRowOfLists extends StatelessWidget {
  const TopRowOfLists(
      {super.key, required this.title, required this.onTap, this.margitTop});

  final String title;
  final Function() onTap;
  final double? margitTop;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: margitTop ?? 8.h, right: 12.w, left: 12.w),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall!,
            ),
            TextButton(
              onPressed: onTap,
              child: Text(
                'More',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MarketMoversWidget extends StatelessWidget {
  const MarketMoversWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      sliver: SliverToBoxAdapter(
          child: SizedBox(
        height: 145.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return SizedBox(
                height: 150.h, child: const CoinCardWithChartWidget());
          },
        ),
      )),
    );
  }
}

class CoinCardWithChartWidget extends StatelessWidget {
  const CoinCardWithChartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: darkSurfaceColor,
        borderRadius: BorderRadius.circular(12.w),
      ),
      margin: EdgeInsets.only(right: 8.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
      width: 150.w,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('BTC/USD'),
                        const Text('30,113.80'),
                        Text(
                          '+2.76%',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .apply(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  Image.asset('$imageAssets/img_small_bitcoin_logo.png')
                ],
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 8.h,
                  ),
                  height: 25.h,
                  width: constraints.maxWidth / 1.5,
                  child: LineChart(mainChart()),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '24H Vol.',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: darkSecondaryColor),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('394 897 432,26',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: darkSecondaryColor)),
              ),
            ],
          );
        },
      ),
    );
  }
}

LineChartData mainChart() {
  return LineChartData(
    gridData: const FlGridData(
      show: false,
    ),
    lineTouchData: const LineTouchData(
      enabled: false,
    ),
    titlesData: const FlTitlesData(
      show: true,
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: false,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    ),
    borderData: FlBorderData(
      show: false,
    ),
    minX: 0,
    maxX: 8,
    minY: 0,
    maxY: 2,
    lineBarsData: [
      LineChartBarData(
        color: primaryColor,
        spots: const [
          FlSpot(0, 0.5),
          FlSpot(0.5, 1.5),
          FlSpot(1, 1),
          FlSpot(1.9, 1.5),
          FlSpot(2.5, 1.2),
          FlSpot(3, 1.1),
          FlSpot(3.5, 2),
          FlSpot(4, 1.4),
          FlSpot(4.9, 1.8),
          FlSpot(5.5, 1),
          FlSpot(6, 1.8),
          FlSpot(6.5, 1.5),
          FlSpot(7.5, 2),
        ],
        isCurved: true,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
      ),
    ],
  );
}
