import 'package:doctor_flutter_v1/controller/faqs_cubit/faqs_cubit.dart';
import 'package:doctor_flutter_v1/core/widgets/custom_loading.dart';
import 'package:doctor_flutter_v1/core/widgets/empty_widget.dart';
import 'package:doctor_flutter_v1/core/widgets/error_widget.dart';
import 'package:doctor_flutter_v1/presentation/frequently_asked_questions/widgets/in_active_asked_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FrequentlyAskedListView extends StatefulWidget {
  const FrequentlyAskedListView({
    super.key,
  });

  @override
  State<FrequentlyAskedListView> createState() =>
      _FrequentlyAskedListViewState();
}

class _FrequentlyAskedListViewState extends State<FrequentlyAskedListView> {
  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        BlocBuilder<FaqsCubit, FaqsState>(
          builder: (context, state) {
            if (state is FaqsLoaded) {
              return state.faqsModel.data.isEmpty
                  ? SliverToBoxAdapter(
                      child: CustomEmptyWidget(
                        onRetry: () {
                          context.read<FaqsCubit>().getFaqs();
                        },
                      ),
                    )
                  : SliverList.separated(
                      itemCount: state.faqsModel.data.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 24.r,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              if (selectedItem.contains(index)) {
                                selectedItem.remove(index);
                              } else {
                                selectedItem.add(index);
                              }
                            });
                          },
                          child: AnimatedCrossFade(
                            duration: const Duration(milliseconds: 300),
                            firstChild: InActiveAskedListViewItem(
                              faqsModelData: state.faqsModel.data[index],
                            ),
                            secondChild: ActiveAskedListViewItem(
                              faqsModelData: state.faqsModel.data[index],
                            ),
                            crossFadeState: selectedItem.contains(index)
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                          ),
                        );
                      },
                    );
            } else if (state is FaqsError) {
              return SliverToBoxAdapter(
                  child: CustomErrorWidget(
                error: state.errorMessage,
                onRetry: () {
                  context.read<FaqsCubit>().getFaqs();
                },
              ));
            } else {
              return const SliverToBoxAdapter(
                child: CustomLoading(),
              );
            }
          },
        ),
      ],
    );
  }
}
