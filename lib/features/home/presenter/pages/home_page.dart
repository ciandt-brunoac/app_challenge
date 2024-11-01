import 'package:app_challenge/core/helpers/url_launch.dart';
import 'package:app_challenge/core/inject/app_inject_config.dart';
import 'package:app_challenge/features/home/presenter/controllers/home_cubit.dart';
import 'package:app_challenge/features/home/presenter/controllers/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit _cubit;

  @override
  void initState() {
    _cubit = AppInjectConfig.get<HomeCubit>();
    _cubit.initGraphqlService();
    _cubit.getHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
          bloc: _cubit,
          builder: (context, state) {
            if (state.status == HomePageStatus.failure) {
              return const Center(
                child: Text('Error'),
              );
            }

            if (state.status == HomePageStatus.success) {
              return successWidget(state);
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

Widget successWidget(HomeState state) {
  return SingleChildScrollView(
    primary: true,
    physics: const ClampingScrollPhysics(),
    child: Stack(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF730723),
                Color(0xFFA04545),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF730723),
                      width: 2,
                    ),
                    image: DecorationImage(
                      image: NetworkImage(state.profile!.user.avatarUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Column(
                  children: [
                    Text(
                      "@${state.profile!.user.login}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      state.profile!.user.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      state.profile!.user.bio ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.black26,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Most Popular Repositories:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          padding: EdgeInsets.zero,
                          itemCount: state.profile!.user.repositories.length,
                          itemBuilder: (BuildContext context, int index) {
                            final repository =
                                state.profile!.user.repositories[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  goToUrl(repository.url);
                                },
                                child: Card(
                                  color: Theme.of(context).cardColor,
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Container(
                                    width: 250,
                                    height: 100,
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          repository.name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          repository.description,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
