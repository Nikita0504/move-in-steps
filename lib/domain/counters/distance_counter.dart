String distance(steps) {
  double meters = 0.0;
  String measurements = 'm';
  meters = steps * 0.7;
  if (meters >= 1000) {
    meters = meters / 1000;
    measurements = 'km';
  }
  return '${meters.ceil()} $measurements';
}
