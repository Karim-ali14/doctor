import 'package:book_appointment/utils/local_notification_handler.dart';
import 'package:book_appointment/views/core/widgets/retry_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:futuristic/futuristic.dart';

class MyFuturistic<T> extends StatelessWidget {
  const MyFuturistic(
      {Key key,
      @required this.futureBuilder,
      this.busyBuilder,
      @required this.dataBuilder})
      : super(key: key);
  final AsyncValueGetter<T> futureBuilder;
  final Widget busyBuilder;
  final Widget Function(BuildContext, T) dataBuilder;

  @override
  Widget build(BuildContext context) {
    return Futuristic<T>(
      // initialBuilder:null ,
      autoStart: true,
      futureBuilder: futureBuilder,
      busyBuilder: (context) =>
          busyBuilder ??
          Scaffold(body: Center(child: CircularProgressIndicator())),
      errorBuilder: (context, error, retry) {
        // throw error;
        return Scaffold(body: Retry(onPressed: retry));
        return Column(
          children: [
            Retry(onPressed: retry),
          ],
        );

        throw error;
      },
      dataBuilder: dataBuilder,
    );
  }
}
