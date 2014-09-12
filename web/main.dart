/**
 * Copyright (C) 2014 Cantidio Fontes
 * For conditions of distribution and use, see copyright notice in LICENSE.txt
 */
import 'package:duengine/duengine.dart';
import 'package:gorgon/gorgon.dart';
import 'dart:html';
import 'dart:async';

main() {
  Display display = new Display(query("#display"), width: 640, height: 480);
  Spritepack sp = new Spritepack.fromJSON("resources/obj/player/black_zero/spritepack.json");
  Animationpack ap = new Animationpack.fromJSON("resources/obj/player/black_zero/animationpack.json");

  Future.wait([sp.onLoad, ap.onLoad]).then((_) {
    Animator zero1 = new Animator(sp, ap);
    Animator zero2 = new Animator(sp, ap);
    Animator zero3 = new Animator(sp, ap);

    zero1.changeAnimation("Stand");
    zero2.changeAnimation("Walk");
    zero3.changeAnimation("ZSaber-1");
    Timer timer = new Timer.periodic(const Duration(milliseconds: 1000 ~/ 60), (_) {
      display.clear();

      zero1.draw(new Point2D(50, 50));
      zero2.draw(new Point2D(120, 50));
      zero3.draw(new Point2D(200, 50));
      zero1.runStep();
      zero2.runStep();
      zero3.runStep();

    });
  });


}
