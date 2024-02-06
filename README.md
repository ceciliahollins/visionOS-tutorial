# visionOS-tutorial
A project to practice and demonstrate functionality of visionOS frameworks

## Description

This project is intended to be used to explore the visionOS frameworks and assist others in learning how to develop for visionOS. To do this, a Spotify remake app is created using static data. This allows for exploration into the basics of visionOS frameworks as introduced in WWDC23. The current project currently supports windows functionality, and a simple immersive video experience.

![WindowsDemo](https://github.com/ceciliahollins/visionOS-tutorial/blob/main/visionOSWindowsDemo.gif)

The windows demo displays playlists and lists of songs, with a new window presented showing the details of a song when a song is pressed. The main highlights of this feature is:
* Presenting and dismissing window groups
* Basic UI practices for SwiftUI in visionOS
* Handling resizing of windows
* Native visionOS UI, including buttons, navigation lists, highlighting and focus of elements, and more.

![ImmersiveVideoDemo](https://github.com/ceciliahollins/visionOS-tutorial/blob/main/visionOSImmersiveVideoDemo.gif)
The immersive video example puts the user in a concert environment and plays a video from a gig to replicate the experience of the concert. The main highlights of this feature is:
* Dismissing windows and presenting an immersive space, as well as exiting an immersive space and presenting windows again
* Using RealityKit and AVKit to play a video in an immersive space

## Getting Started

### Requirements

* visionOS 1.0+
* Xcode 15.2+

### Executing program

* Understand [Vision Pro controls](https://developer.apple.com/videos/play/wwdc2023/10073/)
* Download or clone the project
* Run the project on an Apple Vision Pro simulator

## Authors

Cecilia Hollins 
hollins.cecilia@gmail.com

## Version History

* 0.1
    * Initial Release
* 0.2
    * Adding immersive experience

## Acknowledgments

* [Apple visionOS documentation](https://developer.apple.com/visionos/)
* [WWWDC23 sessions](https://developer.apple.com/wwdc23/sessions/)
