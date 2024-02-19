import 'package:evertec_mobile_test/app/modules/details/bloc/details_bloc.dart';
import 'package:evertec_mobile_test/app/modules/details/models/state_current.dart';
import 'package:evertec_mobile_test/app/modules/details/models/state_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final detailsBloc = Modular.get<DetailsBloc>();

  @override
  void initState() {
    detailsBloc.add(Current());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => detailsBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detalles por región'),
        ),
        body: BlocBuilder<DetailsBloc, DetailsState>(
          builder: (context, state) {
            if (state is DetailsInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is DetailsSuccess) {
              return ListView.builder(
                itemCount: state.stateCurrentModel.length,
                itemBuilder: (context, index) {
                  return regionCard(state.stateCurrentModel[index],
                      state.stateInfoModel[index]);
                },
              );
            } else {
              return const Center(
                child: Text('Error al cargar los datos'),
              );
            }
          },
        ),
      ),
    );
  }

  String formatarData(String dataString) {
    if (dataString.isEmpty) {
      return '';
    }

    DateTime data = DateTime.parse(dataString);

    String dataFormatada = DateFormat('dd/MM/yyyy').format(data);

    return dataFormatada;
  }

  Widget regionCard(
      StateCurrentModel stateCurrentModel, StateInfoModel stateInfoModel) {
    return Container(
        width: double.maxFinite,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.location_on,
                    size: 32,
                  )),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stateInfoModel.name ?? '',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Casos totals: ',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: stateCurrentModel.total.toString(),
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Ultima modificación: ${formatarData(stateCurrentModel.dateModified ?? '')}',
                      style: const TextStyle(fontSize: 11),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.keyboard_arrow_right,
                    size: 32,
                  )),
            ),
          ],
        ));
  }
}
