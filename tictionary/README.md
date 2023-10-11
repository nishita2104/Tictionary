# Tictionary

Tictionary, your very own travel dictionary!

## Features
 - Translation: It translates your audio to desired language and displays the same in form of text
 - Points of interest: It displays nearby restaurants, hotels, places to visit, etc using your current location

## Future goals
 - Estimated costs: depending on the places you would want to visit be it hotels, restaurants, tourism spots, etc. we aim to use ML model to implement the same
 - Shopping complexes: suggested set of places for take home goodies for your loved ones 
 - Currency conversion: visit to a new country shall not restrict the use of our app, currency conversion gives a better estimate!

## Steps to follow
1. Clone the repository
```
git clone https://github.com/nishita2104/Tictionary.git
```
2. Get the dependencies
```
flutter pub get
```
3. Change the contents of SpeectToTextPlugin.kt by placing
override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>,grantResults: IntArray)
    : Boolean {
        when (requestCode) {
            speechToTextPermissionCode -> {
                if (null != grantResults) {
                    permissionToRecordAudio = grantResults.isNotEmpty() &&
                            grantResults.get(0) == PackageManager.PERMISSION_GRANTED
                }
                completeInitialize()
                return true
            }
        }
        return false
    } inside public class SpeechToTextPlugin and remove the same from other places
4. Connect your android and run the app
```
flutter run --no-sound-null-safety
```

## Getting Started with flutter

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
