import 'package:audioplayers/audioplayers.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../model/media_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ShowMediaScreen extends StatelessWidget {
  ShowMediaScreen({super.key, required this.media});
  final List<MediaModel> media;
  List<String> soundFileExtensions = [
    'mp3',
    'wav',
    'aac',
    'ogg',
    'm4a',
    'flac',
  ];
  List<String> videoFileExtensions = [
    'mp4',
    'mkv',
    'webm',
    'avi',
    'flv',
    'mov',
  ];

  List<String> imageFileExtensions = [
    'jpg',
    'jpeg',
    'png',
    'gif',
    'bmp',
    'tiff',
    'webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Files'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ElevatedButton(
              onPressed: () {
                if (soundFileExtensions.contains(media[index].fileType)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SoundPlayerWidget(
                        soundUrl: media[index].fileUrl!,
                      ),
                    ),
                  );
                } else if (videoFileExtensions
                    .contains(media[index].fileType)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChewieVideoPlayer(
                        videoUrl: media[index].fileUrl!,
                      ),
                    ),
                  );
                } else if (imageFileExtensions
                    .contains(media[index].fileType)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhotoPreview(
                        imageUrl: media[index].fileUrl!,
                      ),
                    ),
                  );
                } else if (media[index].fileType == 'pdf') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PdfViewerWidget(
                        pdfUrl: media[index].fileUrl!,
                      ),
                    ),
                  );
                }
              },
              child: Text(media[index].fineName!));
        },
        itemCount: media.length,
      ),
    );
  }
}

class ChewieVideoPlayer extends StatefulWidget {
  final String videoUrl;

  // Constructor to accept video URL as parameter
  const ChewieVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _ChewieVideoPlayerState createState() => _ChewieVideoPlayerState();
}

class _ChewieVideoPlayerState extends State<ChewieVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();

    // Initialize the video player with the URL passed from the widget
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));

    // Initialize the ChewieController
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _chewieController != null &&
            _chewieController!.videoPlayerController.value.isInitialized
        ? Chewie(
            controller: _chewieController!,
          )
        : const Center(
            child:
                CircularProgressIndicator()); // Loading indicator until the video is initialized
  }
}

class SoundPlayerWidget extends StatefulWidget {
  final String soundUrl;

  // Constructor to accept the sound URL as a parameter
  const SoundPlayerWidget({Key? key, required this.soundUrl}) : super(key: key);

  @override
  _SoundPlayerWidgetState createState() => _SoundPlayerWidgetState();
}

class _SoundPlayerWidgetState extends State<SoundPlayerWidget> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  // Function to play the sound
  void _playSound() async {
    await _audioPlayer.play(UrlSource(widget.soundUrl));
  }

  // Function to stop the sound
  void _stopSound() async {
    await _audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sound Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: isPlaying ? _stopSound : _playSound,
              child: Text(isPlaying ? 'Stop' : 'Play'),
            ),
          ],
        ),
      ),
    );
  }
}

class PhotoPreview extends StatelessWidget {
  final String imageUrl;

  const PhotoPreview({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Preview'),
      ),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}

class PdfViewerWidget extends StatefulWidget {
  final String pdfUrl;

  // Constructor to accept the PDF URL as a parameter
  const PdfViewerWidget({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  _PdfViewerWidgetState createState() => _PdfViewerWidgetState();
}

class _PdfViewerWidgetState extends State<PdfViewerWidget> {
  String? localPdfPath;

  @override
  void initState() {
    super.initState();
    _downloadPdfFile();
  }

  // Function to download the PDF file from the URL
  Future<void> _downloadPdfFile() async {
    try {
      var response = await http.get(Uri.parse(widget.pdfUrl));
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/temp.pdf");
      await file.writeAsBytes(response.bodyBytes);

      setState(() {
        localPdfPath = file.path;
      });
    } catch (e) {
      print('Error downloading PDF: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
      ),
      body: localPdfPath != null
          ? PDFView(
              filePath: localPdfPath,
            )
          : const Center(
              child:
                  CircularProgressIndicator(), // Show loading indicator while downloading
            ),
    );
  }
}
