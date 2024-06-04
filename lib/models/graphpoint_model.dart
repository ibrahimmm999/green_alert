import 'package:collection/collection.dart';
import 'package:intl/intl.dart';

class GraphPoint {
  final double x;
  final double y;
  GraphPoint({required this.x, required this.y});
}

List<GraphPoint> get graphPoints {
  final dataExample = <double>[7, 2, 90, 4, 5, 2, 5, 6, 8, 10, 5];

  final last7Data = dataExample.sublist(dataExample.length - 7);

  return List<GraphPoint>.generate(last7Data.length, (index) {
    return GraphPoint(x: index.toDouble(), y: last7Data[index]);
  });
}
