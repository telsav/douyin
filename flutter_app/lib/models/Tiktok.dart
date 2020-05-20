class Tiktok {
  int statueCode;
  Body body;
  Object errMsg;

  Tiktok({this.statueCode, this.body, this.errMsg});

  Tiktok.fromJson(Map<String, dynamic> json) {
    statueCode = json['statusCode'];
    body = json['body'] != null ? new Body.fromJson(json['body']) : null;
    errMsg = json['errMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statueCode;
    if (this.body != null) {
      data['body'] = this.body.toJson();
    }
    data['errMsg'] = this.errMsg;
    return data;
  }
}

class Body {
  PageState pageState;
  List<ItemListData> itemListData;
  String hasMore;
  String maxCursor;
  String minCursor;

  Body(
      {this.pageState,
      this.itemListData,
      this.hasMore,
      this.maxCursor,
      this.minCursor});

  Body.fromJson(Map<String, dynamic> json) {
    pageState = json['pageState'] != null
        ? new PageState.fromJson(json['pageState'])
        : null;
    if (json['itemListData'] != null) {
      itemListData = new List<ItemListData>();
      json['itemListData'].forEach((v) {
        itemListData.add(new ItemListData.fromJson(v));
      });
    }

    hasMore = json['hasMore'].toString();
    maxCursor = json['maxCursor'];
    minCursor = json['minCursor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pageState != null) {
      data['pageState'] = this.pageState.toJson();
    }
    if (this.itemListData != null) {
      data['itemListData'] = this.itemListData.map((v) => v.toJson()).toList();
    }

    data['hasMore'] = this.hasMore;
    data['maxCursor'] = this.maxCursor;
    data['minCursor'] = this.minCursor;
    return data;
  }
}

class PageState {
  int regionAppId;
  String os;
  String region;
  String baseURL;
  String appType;
  String fullUrl;

  PageState(
      {this.regionAppId,
      this.os,
      this.region,
      this.baseURL,
      this.appType,
      this.fullUrl});

  PageState.fromJson(Map<String, dynamic> json) {
    regionAppId = json['regionAppId'];
    os = json['os'];
    region = json['region'];
    baseURL = json['baseURL'];
    appType = json['appType'];
    fullUrl = json['fullUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regionAppId'] = this.regionAppId;
    data['os'] = this.os;
    data['region'] = this.region;
    data['baseURL'] = this.baseURL;
    data['appType'] = this.appType;
    data['fullUrl'] = this.fullUrl;
    return data;
  }
}

class ItemListData {
  ItemInfos itemInfos;
  AuthorInfos authorInfos;
  MusicInfos musicInfos;
  List<ChallengeInfoList> challengeInfoList;
  String duetInfo;
  List<TextExtra> textExtra;
  AuthorStats authorStats;

  ItemListData(
      {this.itemInfos,
      this.authorInfos,
      this.musicInfos,
      this.challengeInfoList,
      this.duetInfo,
      this.textExtra,
      this.authorStats});

  ItemListData.fromJson(Map<String, dynamic> json) {
    itemInfos = json['itemInfos'] != null
        ? new ItemInfos.fromJson(json['itemInfos'])
        : null;
    authorInfos = json['authorInfos'] != null
        ? new AuthorInfos.fromJson(json['authorInfos'])
        : null;
    musicInfos = json['musicInfos'] != null
        ? new MusicInfos.fromJson(json['musicInfos'])
        : null;
    if (json['challengeInfoList'] != null) {
      challengeInfoList = new List<ChallengeInfoList>();
      json['challengeInfoList'].forEach((v) {
        challengeInfoList.add(new ChallengeInfoList.fromJson(v));
      });
    }
    duetInfo = json['duetInfo'];
    if (json['textExtra'] != null) {
      textExtra = new List<TextExtra>();
      json['textExtra'].forEach((v) {
        textExtra.add(new TextExtra.fromJson(v));
      });
    }
    authorStats = json['authorStats'] != null
        ? new AuthorStats.fromJson(json['authorStats'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itemInfos != null) {
      data['itemInfos'] = this.itemInfos.toJson();
    }
    if (this.authorInfos != null) {
      data['authorInfos'] = this.authorInfos.toJson();
    }
    if (this.musicInfos != null) {
      data['musicInfos'] = this.musicInfos.toJson();
    }
    if (this.challengeInfoList != null) {
      data['challengeInfoList'] =
          this.challengeInfoList.map((v) => v.toJson()).toList();
    }
    data['duetInfo'] = this.duetInfo;
    if (this.textExtra != null) {
      data['textExtra'] = this.textExtra.map((v) => v.toJson()).toList();
    }
    if (this.authorStats != null) {
      data['authorStats'] = this.authorStats.toJson();
    }
    return data;
  }
}

class ItemInfos {
  String id;
  String text;
  String createTime;
  String authorId;
  String musicId;
  List<String> covers;
  List<String> coversOrigin;
  List<String> coversDynamic;
  Video video;
  int diggCount;
  int shareCount;
  int playCount;
  int commentCount;
  bool isOriginal;
  bool isOfficial;
  bool isActivityItem;
  List<Null> warnInfo;

  ItemInfos(
      {this.id,
      this.text,
      this.createTime,
      this.authorId,
      this.musicId,
      this.covers,
      this.coversOrigin,
      this.coversDynamic,
      this.video,
      this.diggCount,
      this.shareCount,
      this.playCount,
      this.commentCount,
      this.isOriginal,
      this.isOfficial,
      this.isActivityItem,
      this.warnInfo});

  ItemInfos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    createTime = json['createTime'];
    authorId = json['authorId'];
    musicId = json['musicId'];
    covers = json['covers'].cast<String>();
    coversOrigin = json['coversOrigin'].cast<String>();
    coversDynamic = json['coversDynamic'].cast<String>();
    video = json['video'] != null ? new Video.fromJson(json['video']) : null;
    diggCount = json['diggCount'];
    shareCount = json['shareCount'];
    playCount = json['playCount'];
    commentCount = json['commentCount'];
    isOriginal = json['isOriginal'];
    isOfficial = json['isOfficial'];
    isActivityItem = json['isActivityItem'];
    if (json['warnInfo'] != null) {
      warnInfo = new List<Null>();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['createTime'] = this.createTime;
    data['authorId'] = this.authorId;
    data['musicId'] = this.musicId;
    data['covers'] = this.covers;
    data['coversOrigin'] = this.coversOrigin;
    data['coversDynamic'] = this.coversDynamic;
    if (this.video != null) {
      data['video'] = this.video.toJson();
    }
    data['diggCount'] = this.diggCount;
    data['shareCount'] = this.shareCount;
    data['playCount'] = this.playCount;
    data['commentCount'] = this.commentCount;
    data['isOriginal'] = this.isOriginal;
    data['isOfficial'] = this.isOfficial;
    data['isActivityItem'] = this.isActivityItem;
    return data;
  }
}

class Video {
  List<String> urls;
  VideoMeta videoMeta;

  Video({this.urls, this.videoMeta});

  Video.fromJson(Map<String, dynamic> json) {
    urls = json['urls'].cast<String>();
    videoMeta = json['videoMeta'] != null
        ? new VideoMeta.fromJson(json['videoMeta'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['urls'] = this.urls;
    if (this.videoMeta != null) {
      data['videoMeta'] = this.videoMeta.toJson();
    }
    return data;
  }
}

class VideoMeta {
  int width;
  int height;
  int ratio;
  int duration;

  VideoMeta({this.width, this.height, this.ratio, this.duration});

  VideoMeta.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    ratio = json['ratio'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    data['ratio'] = this.ratio;
    data['duration'] = this.duration;
    return data;
  }
}

class AuthorInfos {
  String secUid;
  String userId;
  String uniqueId;
  String nickName;
  String signature;
  bool verified;
  List<String> covers;
  List<String> coversMedium;
  List<String> coversLarger;
  bool isSecret;

  AuthorInfos(
      {this.secUid,
      this.userId,
      this.uniqueId,
      this.nickName,
      this.signature,
      this.verified,
      this.covers,
      this.coversMedium,
      this.coversLarger,
      this.isSecret});

  AuthorInfos.fromJson(Map<String, dynamic> json) {
    secUid = json['secUid'];
    userId = json['userId'];
    uniqueId = json['uniqueId'];
    nickName = json['nickName'];
    signature = json['signature'];
    verified = json['verified'];
    covers = json['covers'].cast<String>();
    coversMedium = json['coversMedium'].cast<String>();
    coversLarger = json['coversLarger'].cast<String>();
    isSecret = json['isSecret'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['secUid'] = this.secUid;
    data['userId'] = this.userId;
    data['uniqueId'] = this.uniqueId;
    data['nickName'] = this.nickName;
    data['signature'] = this.signature;
    data['verified'] = this.verified;
    data['covers'] = this.covers;
    data['coversMedium'] = this.coversMedium;
    data['coversLarger'] = this.coversLarger;
    data['isSecret'] = this.isSecret;
    return data;
  }
}

class MusicInfos {
  String musicId;
  String musicName;
  String authorName;
  String original;
  List<String> playUrl;
  List<String> covers;
  List<String> coversMedium;
  List<String> coversLarger;

  MusicInfos(
      {this.musicId,
      this.musicName,
      this.authorName,
      this.original,
      this.playUrl,
      this.covers,
      this.coversMedium,
      this.coversLarger});

  MusicInfos.fromJson(Map<String, dynamic> json) {
    musicId = json['musicId'];
    musicName = json['musicName'];
    authorName = json['authorName'];
    original = json['original'].toString();
    playUrl = json['playUrl'].cast<String>();
    covers = json['covers'].cast<String>();
    coversMedium = json['coversMedium'].cast<String>();
    coversLarger = json['coversLarger'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['musicId'] = this.musicId;
    data['musicName'] = this.musicName;
    data['authorName'] = this.authorName;
    data['original'] = this.original;
    data['playUrl'] = this.playUrl;
    data['covers'] = this.covers;
    data['coversMedium'] = this.coversMedium;
    data['coversLarger'] = this.coversLarger;
    return data;
  }
}

class ChallengeInfoList {
  String challengeId;
  String challengeName;
  bool isCommerce;
  String text;
  List<String> covers;
  List<String> coversMedium;
  List<String> coversLarger;
  String splitTitle;

  ChallengeInfoList(
      {this.challengeId,
      this.challengeName,
      this.isCommerce,
      this.text,
      this.covers,
      this.coversMedium,
      this.coversLarger,
      this.splitTitle});

  ChallengeInfoList.fromJson(Map<String, dynamic> json) {
    challengeId = json['challengeId'];
    challengeName = json['challengeName'];
    isCommerce = json['isCommerce'];
    text = json['text'];
    covers = json['covers'].cast<String>();
    coversMedium = json['coversMedium'].cast<String>();
    coversLarger = json['coversLarger'].cast<String>();
    splitTitle = json['splitTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['challengeId'] = this.challengeId;
    data['challengeName'] = this.challengeName;
    data['isCommerce'] = this.isCommerce;
    data['text'] = this.text;
    data['covers'] = this.covers;
    data['coversMedium'] = this.coversMedium;
    data['coversLarger'] = this.coversLarger;
    data['splitTitle'] = this.splitTitle;
    return data;
  }
}

class TextExtra {
  String awemeId;
  int start;
  int end;
  String hashtagName;
  String hashtagId;
  int type;
  String userId;
  bool isCommerce;

  TextExtra(
      {this.awemeId,
      this.start,
      this.end,
      this.hashtagName,
      this.hashtagId,
      this.type,
      this.userId,
      this.isCommerce});

  TextExtra.fromJson(Map<String, dynamic> json) {
    awemeId = json['AwemeId'];
    start = json['Start'];
    end = json['End'];
    hashtagName = json['HashtagName'];
    hashtagId = json['HashtagId'];
    type = json['Type'];
    userId = json['UserId'];
    isCommerce = json['IsCommerce'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AwemeId'] = this.awemeId;
    data['Start'] = this.start;
    data['End'] = this.end;
    data['HashtagName'] = this.hashtagName;
    data['HashtagId'] = this.hashtagId;
    data['Type'] = this.type;
    data['UserId'] = this.userId;
    data['IsCommerce'] = this.isCommerce;
    return data;
  }
}

class AuthorStats {
  int followingCount;
  int followerCount;
  String heartCount;
  int videoCount;
  int diggCount;

  AuthorStats(
      {this.followingCount,
      this.followerCount,
      this.heartCount,
      this.videoCount,
      this.diggCount});

  AuthorStats.fromJson(Map<String, dynamic> json) {
    followingCount = json['followingCount'];
    followerCount = json['followerCount'];
    heartCount = json['heartCount'];
    videoCount = json['videoCount'];
    diggCount = json['diggCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['followingCount'] = this.followingCount;
    data['followerCount'] = this.followerCount;
    data['heartCount'] = this.heartCount;
    data['videoCount'] = this.videoCount;
    data['diggCount'] = this.diggCount;
    return data;
  }
}
