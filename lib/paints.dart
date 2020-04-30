library paints;

import 'dart:ui';

Paint black() {
  Paint paint = Paint();
  paint.color = Color(0xff000);
  return paint;
}

Paint white() {
  Paint paint = Paint();
  paint.color = Color(0xfffff);
  return paint;
}

Paint primary() {
  Paint paint = Paint();
  paint.color = Color(0xff0000ff);
  return paint;
}
