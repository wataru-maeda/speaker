# Speaker

## Installation

Add the Speaker to your project manually (drag & drop the file into your project).

## Usage

### ・Basic Usage

1. Import `Speaker` for setup

```Swift
import Speaker
```
2. Pass "text" and "language" to Speaker. That's all!

```Swift
Speaker.speak(text: "Hello Speaker", language: "en-US")
```

Here is a list of [supported languages](https://stackoverflow.com/questions/23827145/how-to-get-difference-language-code-for-ios-7-avspeechutterance-text-to-speech)

### ・Interrupt speech

`interrupt` can interrupt the speaking if it in the middle of the speech. The default value is `false`.

```Swift
Speaker.speak(text: "Hello Speaker", language: "en-US", interrupt: true)
```

### ・Speech speed

`rate` can adjust the speed of the speech. It is ranged from `0.0` to `1.0`. Default value is `0.0`

```Swift
Speaker.speak(text: "Hello Speaker", language: "en-US", rate: 1.0)
```
### ・Voice pitch

`pitch` can decide the pitch of the voice. Value range is from `0.5` to `2.0`. The default value is `1.0`.

```Swift
Speaker.speak(text: "Hello Speaker", language: "en-US", pitch: 0.5)
```

### ・Notice the start and end of the speech

You might like to know when the speech starts and when it ends. In this case, bellow is how to get these callbacks.

```Swift
Speaker.speak(text: "Hello Speaker", language: "en-US", started: {
print("Started")
})
```
```Swift
Speaker.speak(text: "Hello Speaker", language: "en-US", finished: {
print("Finished")
})
```
You can sets both callbacks

```Swift
Speaker.speak(text: "Hello Speaker", language: "en-US", started: {
print("Started")
}, finished: {
print("Finished")
})
```

## Requirements

iOS 8+
Swift 3.0+
Xcode 8.0+

## License

This project is available under the MIT license. See the [LICENSE](https://github.com/WataruMaeda/speaker/blob/master/LICENSE) file for more info.
