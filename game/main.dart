/**
 * Copyright (C) 2014 Cantidio Fontes
 * For conditions of distribution and use, see copyright notice in LICENSE.txt
 */
import 'package:duengine/duengine.dart';
import 'package:gorgon/gorgon.dart';
import 'dart:html';
import 'dart:async';

main()
{
  Display display = new Display( query("#display"), width: 640, height: 480 );


  //this resource should be removed, it was used only to make sure the dependencies were working nicely
  Spritepack sp = new Spritepack.fromTileSheet("resources/mario_tilesheet.png", 16,16 );
  sp.onLoad.then((_){
    num ang = 0.0;
    num scale = 1.0;
    int scale_mod = 1;
    List<Tile> tl = [];
    sp.groups.forEach((String group){
      tl.add(new Tile(sp[group]));
    });

    TileMap map = new TileMap.fromMatrix([
                                          [tl[0],tl[1],tl[2]],
                                          [tl[0],tl[1],tl[2]],
                                          [tl[0],tl[1],tl[2]],
                                          [tl[0],tl[1],tl[2]],
                                          [tl[0],tl[1],tl[2]],
                                          [tl[0],tl[1],tl[2]]
                                          ], new Point2D(16,16));

    int tile = 0;
      Timer timer = new Timer.periodic( const Duration(milliseconds: 1000~/3), (_) {
         display.clear();
         map.draw(new Point2D(0, 0));
         map.logic();
      });
  });


}
