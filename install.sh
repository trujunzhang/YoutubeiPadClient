#!/bin/bash

#/Volumes/Home/Developing/SketchProjects/YoutubeiPadClient/dependencies/layers/Business-Logic-Layer/AppResource

appPath=`pwd`;

AppResource="${appPath}/dependencies/layers/Business-Logic-Layer/AppResource"

echo "the current working directory is:${appPath}"

echo "AppCode path is:${_AppCode_app}"

echo "AppCode path is:${AppResource}"

_cleanup() {
    rm -rf ${appPath}/mxAsTubeiPad
    unzip  ${appPath}/mxAsTubeiPad.zip

    cp ${AppResource}/Podfile          ${appPath}/mxAsTubeiPad
    cp ${AppResource}/Main.storyboard  ${appPath}/mxAsTubeiPad/mxAsTubeiPad/Base.lproj
}

_cocoapodsInstall() {
    cd mxAsTubeiPad
    pod install  --verbose  --no-repo-update
}

_runProject(){
     open -a ${_AppCode_app} ${appPath}/mxAsTubeiPad/mxAsTubeiPad.xcworkspace
}

#/Volumes/Home/Developing/SketchProjects/YoutubeiPadClient/mxAsTubeiPad/mxAsTubeiPad.xcworkspace
#/Volumes/Home/Developing/SketchProjects/YoutubeiPadClient/mxAsTubeiPad/mxAsTubeiPad.xcworkspace

_cleanup
_cocoapodsInstall
_runProject