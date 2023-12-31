import 'package:final_project/core/theme/colors/app_colors.dart';
import 'package:final_project/core/theme/styles/app_text_style.dart';
import 'package:final_project/feacher/ranks/view_model/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../sign_in/firebase/get_user_data.dart';
import 'view_model/state.dart';

class RanksView extends StatefulWidget {
  const RanksView({super.key});

  @override
  State<RanksView> createState() => _RanksViewState();
}

class _RanksViewState extends State<RanksView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RanksCubit()
        ..getTopThree()
        ..getRankedUser(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.message_outlined)),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("setting");
                  },
                  child: CircleAvatar(
                    radius: 14,
                    backgroundImage: AssetImage(
                      userModel!.gender == 'male'
                          ? 'imges/man.png'
                          : 'imges/girl 3[74].jpg',
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("settinggg");
                  },
                  icon: Icon(Icons.settings_applications_sharp)),
            ],
            title: Text(
              'Ranks Board',
              style: AppTextStyles.font22BlackBold,
            ),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          backgroundColor: const Color(0xFF423F55),
          body: BlocConsumer<RanksCubit, RanksState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is RanksLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  children: [
                    Flexible(
                      flex: 2,
                      child: SizedBox(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: SizedBox(
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        '1',
                                        style: AppTextStyles.font22BlackBold
                                            .copyWith(
                                          fontFamily: 'SourceSans3',
                                          color: Colors.white,
                                          fontSize: 35.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        child: Center(
                                          child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              Column(
                                                children: [
                                                  Image.asset(
                                                    "imges/one_rank.png",
                                                    height: 100,
                                                  ),
                                                  Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      SizedBox(
                                                        child: Expanded(
                                                          child: Image.asset(
                                                            'imges/lable.png',
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        context
                                                                .read<
                                                                    RanksCubit>()
                                                                .topThreeUser
                                                                .isEmpty
                                                            ? ''
                                                            : context
                                                                .read<
                                                                    RanksCubit>()
                                                                .topThreeUser[0]
                                                                .name!
                                                                .toString(),
                                                        style: AppTextStyles
                                                            .font12GrayRegular
                                                            .copyWith(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Text(
                                                    context
                                                            .read<RanksCubit>()
                                                            .topThreeUser
                                                            .isNotEmpty
                                                        ? context
                                                            .read<RanksCubit>()
                                                            .topThreeUser[0]
                                                            .points
                                                            .toString()
                                                        : '',
                                                    style: AppTextStyles
                                                        .font22BlackBold
                                                        .copyWith(
                                                      color:
                                                          AppColors.primaryBlue,
                                                      fontSize: 30,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Positioned(
                                                top: 30,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                      const Color(0xFF423F55),
                                                  radius: 34,
                                                  child: CircleAvatar(
                                                    radius: 30,
                                                    backgroundImage: context
                                                            .read<RanksCubit>()
                                                            .topThreeUser
                                                            .isNotEmpty
                                                        ? AssetImage(
                                                            context
                                                                        .read<
                                                                            RanksCubit>()
                                                                        .topThreeUser[
                                                                            0]
                                                                        .gender ==
                                                                    'male'
                                                                ? 'imges/man.png'
                                                                : 'imges/girl 3[74].jpg',
                                                          )
                                                        : null,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 85,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '2',
                                        style: AppTextStyles.font22BlackBold
                                            .copyWith(
                                          fontFamily: 'SourceSans3',
                                          color: Colors.white,
                                          fontSize: 35.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        child: Center(
                                          child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              Positioned(
                                                top: 20.5,
                                                child: CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: context
                                                              .read<
                                                                  RanksCubit>()
                                                              .topThreeUser
                                                              .length >
                                                          1
                                                      ? AssetImage(context
                                                                  .read<
                                                                      RanksCubit>()
                                                                  .topThreeUser[
                                                                      1]
                                                                  .gender ==
                                                              'male'
                                                          ? 'imges/man.png'
                                                          : 'imges/girl 3[74].jpg')
                                                      : null,
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Image.asset(
                                                    "imges/cover.png",
                                                    height: 100,
                                                  ),
                                                  Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Image.asset(
                                                        'imges/lable.png',
                                                        width: 100,
                                                      ),
                                                      Text(
                                                        context
                                                                    .read<
                                                                        RanksCubit>()
                                                                    .topThreeUser
                                                                    .length >
                                                                1
                                                            ? context
                                                                .read<
                                                                    RanksCubit>()
                                                                .topThreeUser[1]
                                                                .name!
                                                            : '',
                                                        style: AppTextStyles
                                                            .font12GrayRegular
                                                            .copyWith(
                                                                color: Colors
                                                                    .white),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        context
                                                    .read<RanksCubit>()
                                                    .topThreeUser
                                                    .length >
                                                1
                                            ? context
                                                .read<RanksCubit>()
                                                .topThreeUser[1]
                                                .points
                                                .toString()
                                            : '',
                                        style: AppTextStyles.font22BlackBold
                                            .copyWith(
                                          color: const Color(0xFF00A3FF),
                                          fontSize: 30,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(width: 130.w),
                                  Column(
                                    children: [
                                      Text(
                                        '3',
                                        style: AppTextStyles.font22BlackBold
                                            .copyWith(
                                          color: Colors.white,
                                          fontSize: 35.sp,
                                          fontFamily: 'SourceSans3',
                                        ),
                                      ),
                                      SizedBox(
                                        child: Center(
                                          child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              Positioned(
                                                top: 20.5,
                                                child: CircleAvatar(
                                                  radius: 30,
                                                  backgroundImage: context
                                                              .read<
                                                                  RanksCubit>()
                                                              .topThreeUser
                                                              .length >
                                                          2
                                                      ? AssetImage(
                                                          context
                                                                      .read<
                                                                          RanksCubit>()
                                                                      .topThreeUser[
                                                                          2]
                                                                      .gender ==
                                                                  'male'
                                                              ? 'imges/man.png'
                                                              : 'imges/girl 3[74].jpg',
                                                        )
                                                      : null,
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Image.asset(
                                                    "imges/cover.png",
                                                    height: 100,
                                                  ),
                                                  Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Image.asset(
                                                        'imges/lable.png',
                                                        width: 100,
                                                      ),
                                                      Text(
                                                        context
                                                                    .read<
                                                                        RanksCubit>()
                                                                    .topThreeUser
                                                                    .length >
                                                                2
                                                            ? context
                                                                .read<
                                                                    RanksCubit>()
                                                                .topThreeUser[2]
                                                                .name!
                                                            : '',
                                                        style: AppTextStyles
                                                            .font12GrayRegular
                                                            .copyWith(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        context
                                                    .read<RanksCubit>()
                                                    .topThreeUser
                                                    .length >
                                                2
                                            ? context
                                                .read<RanksCubit>()
                                                .topThreeUser[2]
                                                .points
                                                .toString()
                                            : '',
                                        style: AppTextStyles.font22BlackBold
                                            .copyWith(
                                          color: const Color(0xFF00A3FF),
                                          fontSize: 30,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    context.read<RanksCubit>().rankedUser == []
                        ? const SizedBox()
                        : Flexible(
                            flex: 3,
                            child: SizedBox(
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: context
                                    .read<RanksCubit>()
                                    .rankedUser
                                    .length,
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 40,
                                    vertical: 5,
                                  ),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 10.sp),
                                        child: Text(
                                          '${index + 4}',
                                          style: AppTextStyles.font22BlackBold
                                              .copyWith(
                                            fontFamily: 'SourceSans3',
                                            color: Colors.white,
                                            fontSize: 18.sp,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color:
                                                Colors.white.withOpacity(0.6),
                                          ),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(2),
                                                        child: CircleAvatar(
                                                          radius: 28,
                                                          backgroundImage: AssetImage(context
                                                                      .read<
                                                                          RanksCubit>()
                                                                      .rankedUser[
                                                                          index]
                                                                      .gender ==
                                                                  'male'
                                                              ? 'imges/man.png'
                                                              : 'imges/girl 3[74].jpg'),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    Text(
                                                      context
                                                              .read<
                                                                  RanksCubit>()
                                                              .rankedUser[index]
                                                              .name
                                                              ?.toString() ??
                                                          'No Name',
                                                      style: AppTextStyles
                                                          .font22BlackBold
                                                          .copyWith(
                                                              fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                                const Expanded(
                                                    child: SizedBox()),
                                                Text(
                                                  context
                                                          .read<RanksCubit>()
                                                          .rankedUser[index]
                                                          .points
                                                          ?.toString() ??
                                                      'No points',
                                                  style: AppTextStyles
                                                      .font26BlueBold
                                                      .copyWith(
                                                    color:
                                                        const Color(0xFF1B197C),
                                                    shadows: [
                                                      const Shadow(
                                                        color: Colors.grey,
                                                        offset: Offset(0, 3),
                                                        blurRadius: 4,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(width: 20)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
