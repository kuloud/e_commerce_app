class RecordingsResponse {
  final String numRecordings;
  final String numSpecies;
  final int page;
  final int numPages;
  final List<RecordingEntity> recordings;

  RecordingsResponse({
    required this.numRecordings,
    required this.numSpecies,
    required this.page,
    required this.numPages,
    required this.recordings,
  });

  factory RecordingsResponse.fromJson(Map<String, dynamic> json) {
    List<RecordingEntity> recordingsList = [];
    if (json['recordings'] != null) {
      json['recordings'].forEach((v) {
        recordingsList.add(RecordingEntity.fromJson(v));
      });
    }
    return RecordingsResponse(
      numRecordings: json['numRecordings'],
      numSpecies: json['numSpecies'],
      page: json['page'],
      numPages: json['numPages'],
      recordings: recordingsList,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> recordingsList =
        recordings.map((recording) => recording.toJson()).toList();
    return {
      'numRecordings': numRecordings,
      'numSpecies': numSpecies,
      'page': page,
      'numPages': numPages,
      'recordings': recordingsList,
    };
  }

  @override
  String toString() {
    return 'RecordingsResponse: {numRecordings: $numRecordings, numSpecies: $numSpecies, page: $page, numPages: $numPages, recordings: $recordings}';
  }
}

class RecordingEntity {
  final String id;
  final String genericName;
  final String specificName;
  final String subspeciesName;
  final String group;
  final String englishName;
  final String recordistName;
  final String country;
  final String locality;
  final double? latitude;
  final double? longitude;
  final String soundType;
  final String sex;
  final String lifeStage;
  final String recordingMethod;
  final String url;
  final String audioFileUrl;
  final String audioFileName;
  final Map<String, String> sonograms;
  final Map<String, String> oscillograms;
  final String licenseUrl;
  final String qualityRating;
  final String recordingLength;
  final String recordingTime;
  final String recordingDate;
  final String uploadedDate;
  final List<String> backgroundSpecies;
  final String remarks;
  final String birdSeen;
  final String animalSeen;
  final String playbackUsed;
  final String temperature;
  final String specimenRegistrationNumber;
  final String automaticRecording;
  final String recordingDevice;
  final String microphone;
  final String sampleRate;

  RecordingEntity({
    required this.id,
    required this.genericName,
    required this.specificName,
    required this.subspeciesName,
    required this.group,
    required this.englishName,
    required this.recordistName,
    required this.country,
    required this.locality,
    this.latitude,
    this.longitude,
    required this.soundType,
    required this.sex,
    required this.lifeStage,
    required this.recordingMethod,
    required this.url,
    required this.audioFileUrl,
    required this.audioFileName,
    required this.sonograms,
    required this.oscillograms,
    required this.licenseUrl,
    required this.qualityRating,
    required this.recordingLength,
    required this.recordingTime,
    required this.recordingDate,
    required this.uploadedDate,
    required this.backgroundSpecies,
    required this.remarks,
    required this.birdSeen,
    required this.animalSeen,
    required this.playbackUsed,
    required this.temperature,
    required this.specimenRegistrationNumber,
    required this.automaticRecording,
    required this.recordingDevice,
    required this.microphone,
    required this.sampleRate,
  });

  // 从JSON数据转换为RecordingEntity对象
  factory RecordingEntity.fromJson(Map<String, dynamic> json) {
    return RecordingEntity(
      id: json['id'],
      genericName: json['gen'],
      specificName: json['sp'],
      subspeciesName: json['ssp'],
      group: json['group'],
      englishName: json['en'],
      recordistName: json['rec'],
      country: json['cnt'],
      locality: json['loc'],
      latitude: double.tryParse(json['lat'] ?? ''),
      longitude: double.tryParse(json['lng'] ?? ''),
      soundType: json['type'],
      sex: json['sex'],
      lifeStage: json['stage'],
      recordingMethod: json['method'],
      url: json['url'],
      audioFileUrl: json['file'],
      audioFileName: json['file-name'],
      sonograms: Map<String, String>.from(json['sono']),
      oscillograms: Map<String, String>.from(json['osci']),
      licenseUrl: json['lic'],
      qualityRating: json['q'],
      recordingLength: json['length'],
      recordingTime: json['time'],
      recordingDate: json['date'],
      uploadedDate: json['uploaded'],
      backgroundSpecies: List<String>.from(json['also']),
      remarks: json['rmk'],
      birdSeen: json['bird-seen'],
      animalSeen: json['animal-seen'],
      playbackUsed: json['playback-used'],
      temperature: json['temp'],
      specimenRegistrationNumber: json['regnr'],
      automaticRecording: json['auto'],
      recordingDevice: json['dvc'],
      microphone: json['mic'],
      sampleRate: json['smp'],
    );
  }

  // 将RecordingEntity对象转换为JSON数据
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'gen': genericName,
      'sp': specificName,
      'ssp': subspeciesName,
      'group': group,
      'en': englishName,
      'rec': recordistName,
      'cnt': country,
      'loc': locality,
      'lat': latitude?.toString(),
      'lng': longitude?.toString(),
      'type': soundType,
      'sex': sex,
      'stage': lifeStage,
      'method': recordingMethod,
      'url': url,
      'file': audioFileUrl,
      'file-name': audioFileName,
      'sono': sonograms,
      'osci': oscillograms,
      'lic': licenseUrl,
      'q': qualityRating,
      'length': recordingLength,
      'time': recordingTime,
      'date': recordingDate,
      'uploaded': uploadedDate,
      'also': backgroundSpecies,
      'rmk': remarks,
      'bird-seen': birdSeen,
      'animal-seen': animalSeen,
      'playback-used': playbackUsed,
      'temp': temperature,
      'regnr': specimenRegistrationNumber,
      'auto': automaticRecording,
      'dvc': recordingDevice,
      'mic': microphone,
      'smp': sampleRate,
    };
  }

  // 重写toString方法，用于打印RecordingEntity对象信息
  @override
  String toString() {
    return 'RecordingEntity{id: $id, genericName: $genericName, specificName: $specificName, englishName: $englishName}';
  }
}
