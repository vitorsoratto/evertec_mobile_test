import 'package:auto_size_text/auto_size_text.dart';
import 'package:evertec_mobile_test/app/modules/details/models/state_detail.dart';
import 'package:evertec_mobile_test/app/modules/details/state/bloc/state_info_bloc.dart';
import 'package:evertec_mobile_test/app/modules/details/state/models/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StateDetailView extends StatefulWidget {
  final StateDetailModel stateDetail;

  const StateDetailView({Key? key, required this.stateDetail})
      : super(key: key);

  @override
  State<StateDetailView> createState() => _StateDetailViewState();
}

class _StateDetailViewState extends State<StateDetailView> {
  final stateInfoBloc = Modular.get<StateInfoBloc>();

  List<GridItem> items = [];

  @override
  void initState() {
    stateInfoBloc.add(StateSearch(stateDetailModel: widget.stateDetail));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => stateInfoBloc,
      child: BlocBuilder<StateInfoBloc, StateInfoState>(
        builder: (context, state) {
          if (state is StateInfoInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is StateInfoSuccess) {
            populateItems(state.stateDetailModel);
            return Scaffold(
              appBar: AppBar(
                title: Text(
                    state.stateDetailModel.stateInfo?.state?.toUpperCase() ??
                        ''),
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Covid-19 Information for ${state.stateDetailModel.stateInfo?.name}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: items.length,
                      itemBuilder: ((context, index) {
                        return infoCard(items[index]);
                      }),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Error al cargar los datos'),
            );
          }
        },
      ),
    );
  }

  Widget infoCard(GridItem item) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                item.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                maxLines: 1,
                minFontSize: 11,
                maxFontSize: 24,
              ),
              const SizedBox(height: 8),
              AutoSizeText(
                item.content.toString(),
                minFontSize: 8,
                maxFontSize: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void populateItems(StateDetailModel stateDetailModel) {
    items = [
      GridItem(
        'Total',
        stateDetailModel.stateCurrent?.total ?? 0,
      ),
      GridItem(
        'Deads',
        stateDetailModel.stateCurrent?.death ?? 0,
      ),
      GridItem(
        'Positive Cases',
        stateDetailModel.stateCurrent?.positive ?? 0,
      ),
      GridItem(
        'Negative Cases',
        stateDetailModel.stateCurrent?.negative ?? 0,
      ),
      GridItem(
        'Hospitalized',
        stateDetailModel.stateCurrent?.hospitalized ?? 0,
      ),
      GridItem(
        'Recovered',
        stateDetailModel.stateCurrent?.recovered ?? 0,
      ),
    ];
  }
}
