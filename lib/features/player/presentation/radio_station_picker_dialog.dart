import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../domain/radio_station.dart';

class RadioStationPickerDialog extends StatefulWidget {
  const RadioStationPickerDialog({super.key, required this.loadStations});

  final Future<List<RadioStation>> Function() loadStations;

  @override
  State<RadioStationPickerDialog> createState() =>
      _RadioStationPickerDialogState();
}

class _RadioStationPickerDialogState extends State<RadioStationPickerDialog> {
  late final Future<List<RadioStation>> _stations = widget.loadStations();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Start radio'),
      content: SizedBox(
        width: 360,
        height: 280,
        child: FutureBuilder<List<RadioStation>>(
          future: _stations,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              );
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text('Could not load radio stations.'),
              );
            }
            final stations = snapshot.data ?? const <RadioStation>[];
            if (stations.isEmpty) {
              return const Center(
                child: Text('No radio stations found in your library.'),
              );
            }

            return ListView.separated(
              itemCount: stations.length,
              separatorBuilder: (context, index) =>
                  const Divider(height: 1, color: Color(0xFF293A3A)),
              itemBuilder: (context, index) {
                final station = stations[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    CupertinoIcons.antenna_radiowaves_left_right,
                    color: Color(0xFFB6E36A),
                  ),
                  title: Text(
                    station.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => Navigator.of(context).pop(station),
                );
              },
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('CANCEL'),
        ),
      ],
    );
  }
}
