import 'package:doctor_flutter_v1/controller/send_appoinment_cubit/submit_health_record_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../paient_home_layout/view/patients_home_layout_view.dart';

class SelectMedia extends StatefulWidget {
  const SelectMedia({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  State<SelectMedia> createState() => _SelectMediaState();
}

class _SelectMediaState extends State<SelectMedia> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubmitHealthRecordCubit(),
      child: BlocConsumer<SubmitHealthRecordCubit, SubmitHealthRecordState>(
        listener: (context, state) {
          if (state is UploadFileSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('File Uploaded'),
              ),
            );
            while (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          } else if (state is UploadFileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Select Media'),
            ),
            body: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    SubmitHealthRecordCubit.get(context).addFile();
                  },
                  child: const Text('add File'),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: SubmitHealthRecordCubit.get(context).file.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(SubmitHealthRecordCubit.get(context)
                            .file[index]
                            .path
                            .split('/')
                            .last),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              SubmitHealthRecordCubit.get(context)
                                  .file
                                  .removeAt(index);
                            });
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      );
                    },
                  ),
                ),
                state is UploadFileLoading
                    ? const Center(
                        child: const CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          SubmitHealthRecordCubit.get(context).uploadFile(
                            widget.id,
                          );
                        },
                        child: const Text('Submit'),
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
