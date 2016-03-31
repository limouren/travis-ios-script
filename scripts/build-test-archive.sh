#!/bin/sh
if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
    echo "This is a pull request. Nothing to archive."
else
    echo "Making archive..."
    xctool -workspace $WORKSPACE_NAME.xcworkspace -scheme $SCHEME_NAME \
    -sdk $RELEASE_BUILD_SDK -configuration Release ONLY_ACTIVE_ARCH=NO \
    archive -archivePath $PWD/build/$APP_NAME.xcarchive
    if [[ $? -ne 0 ]]; then
        echo "Error: Archive fail."
        exit 1
    fi
fi
