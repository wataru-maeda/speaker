# Speaker

## Installation

Add the [Speaker](https://github.com/WataruMaeda/speaker/blob/master/Speaker/Speaker.swift) to your project manually (drag & drop the file into your project).

## Usage

Pass "text" and "language or country" to Speaker. That's all!

```Swift
Speaker.speech(text: "Hello Speaker!", language: "en-US")
// or
Speaker.speech(text: "Hello Speaker!", country: .US)
```

Here is a list of [supported languages](https://github.com/WataruMaeda/speaker/blob/master/Speaker/Speaker.swift#L147L184)

## Interrupt speech

`interrupt` can interrupt the speaking if it in the middle of the speech. The default value is `false`.

```Swift
Speaker.speech(text: "Hello Speaker!", country: .US, interrupt: true)
```

## Change Speed

`rate` can adjust the speed of the speech. It is ranged from `0.0` to `1.0`. Default value is `0.0`

```Swift
Speaker.speech(text: "Hello Speaker!", country: .US, rate: 1.0)
```
### Change Pitch

`pitch` can decide the pitch of the voice. Value range is from `0.5` to `2.0`. The default value is `1.0`.

```Swift
Speaker.speech(text: "Hello Speaker!", country: .US, pitch: 1.0)
```

## Get Start and End

You might like to know when the speech starts and when it ends. In this case, bellow is how to get these callbacks.

```Swift
Speaker.speech(text: "Hello Speaker!", country: .US, started: {
  print("Started")
})
```
```Swift
Speaker.speech(text: "Hello Speaker!", country: .US, finished: {
  print("Finished")
})
```
* You can sets both callbacks

```Swift
Speaker.speech(text: "Hello Speaker", language: "en-US", started: {
  print("Started")
}, finished: {
  print("Finished")
})
```

## Play Sound file

* You can play sounds too. 

```Swift
Speaker.play(resource: "sample", type: "mp3")
```

* Callback (finished only) also can be inplemented like bellow sample

```Swift
Speaker.play(resource: "sample", type: "mp3", finished: {
  print("Finished")
})
```

## Requirements

iOS 8+
Swift 3.0+
Xcode 8.0+

## License

This project is available under the MIT license. See the [LICENSE](https://github.com/WataruMaeda/speaker/blob/master/LICENSE) file for more info.
