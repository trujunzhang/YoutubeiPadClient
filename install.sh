#!/bin/sh

#/Volumes/Home/Developing/SketchProjects/YoutubeiPadClient/dependencies/layers/Business-Logic-Layer/AppResource

rm -rf mxAsTubeiPad&&unzip  mxAsTubeiPad.zip&&cp dependencies/layers/Business-Logic-Layer/AppResource/Podfile mxAsTubeiPad&&cp dependencies/layers/Business-Logic-Layer/AppResource/Main.storyboard mxAsTubeiPad/mxAsTubeiPad/Base.lproj&&cd mxAsTubeiPad&&pod install  --verbose 