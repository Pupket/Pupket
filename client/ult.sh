#!/bin/sh
flutter clean && flutter pub get && cd ios/ && pod update && pod install
