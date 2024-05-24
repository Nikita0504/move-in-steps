double progressCounter(int target, int meters) {
  int remainder = meters % target;
  double progress = (remainder / target) * 100;
  return progress;
}
