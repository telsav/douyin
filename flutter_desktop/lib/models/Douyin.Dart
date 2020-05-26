class Douyin {
  int statusCode;
  String statusMsg;
  List<BillboardData> billboardData;
  Extra extra;

  Douyin({this.statusCode, this.statusMsg, this.billboardData, this.extra});

  Douyin.fromJson(Map<String, dynamic> json) {
    statusCode = json["status_code"];
    statusMsg = json["status_msg"];
    if (json['billboard_data'] != null) {
      billboardData = new List<BillboardData>();
      json["billboard_data"].forEach((v) {
        billboardData.add(BillboardData.fromJson(v));
      });
    }
    extra = json['extra'] != null ? new Extra.fromJson(json['extra']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status_code"] = this.statusCode;
    data["status_msg"] = this.statusMsg;
    if (this.billboardData != null) {
      data["billboard_data"] =
          this.billboardData.map((v) => v.toJson()).toList();
    }
    data["extra"] = this.extra;
    return data;
  }
}

class BillboardData {
  String author;
  String imgUrl;
  String link;
  int rank;
  String title;
  String value;

  BillboardData(
      {this.author, this.imgUrl, this.link, this.rank, this.title, this.value});

  BillboardData.fromJson(Map<String, dynamic> json) {
    this.author = json["author"];
    this.imgUrl = json["img_url"];
    this.link = json["link"];
    this.rank = json["rank"];
    this.title = json["title"];
    this.value = json["value"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["author"] = this.author;
    data["img_url"] = this.imgUrl;
    data["link"] = this.link;
    data["rank"] = this.rank;
    data["title"] = this.title;
    data["value"] = this.value;
    return data;
  }
}

class Extra {
  int now;
  Extra({this.now});

  Extra.fromJson(Map<String, dynamic> json) {
    now = json["now"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["now"] = this.now;
    return data;
  }
}

class VideoData {
  int statusCode;
  List<Itemlist> itemList;
  ExtraData extra;

  VideoData.fromJson(Map<String, dynamic> json) {
    this.statusCode = json["status_code"];
    if (json['item_list'] != null) {
      itemList = new List<Itemlist>();
      json['item_list'].forEach((v) {
        itemList.add(new Itemlist.fromJson(v));
      });
    }
    this.extra =
        json["extra"] != null ? new ExtraData.fromJson(json["extra"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["status_code"] = this.statusCode;
    if (this.itemList != null) {
      data['item_list'] = this.itemList.map((v) => v.toJson()).toList();
    }
    if (this.extra != null) {
      data["extra"] = this.extra.toJson();
    }
    return data;
  }
}

class Itemlist {
  String awemeid;
  String videolabels;
  String labeltoptext;
  int category;
  Author author;
  int duration;
  String promotions;
  int ispreview;
  int createtime;
  List<ChaList> chalist;
  String commentlist;
  int authoruserid;
  String videotext;
  int groupid;
  bool islivereplay;
  ShareInfo shareinfo;
  String position;
  String imageinfos;
  RiskInfos riskinfos;
  String uniqidposition;
  String geofencing;
  Statistics statistics;
  int awemetype;
  Music music;
  List<TextExtra> textExtras;
  Video video;
  String shareurl;
  String desc;
  String longvideo;

  Itemlist(
      {this.awemeid,
      this.videolabels,
      this.labeltoptext,
      this.category,
      this.author,
      this.duration,
      this.promotions,
      this.ispreview,
      this.createtime,
      this.chalist,
      this.commentlist,
      this.authoruserid,
      this.videotext,
      this.groupid,
      this.islivereplay,
      this.shareinfo,
      this.position,
      this.imageinfos,
      this.riskinfos,
      this.uniqidposition,
      this.geofencing,
      this.statistics,
      this.awemetype,
      this.music,
      this.textExtras,
      this.video,
      this.shareurl,
      this.desc,
      this.longvideo});

  Itemlist.fromJson(Map<String, dynamic> json) {
    this.awemeid = json["aweme_id"];
    this.videolabels = json["video_labels"];
    this.labeltoptext = json["label_top_text"];
    this.category = json["category"];
    this.author =
        json["author"] != null ? new Author.fromJson(json["author"]) : null;
    this.duration = json["duration"];
    this.promotions = json["promotions"];
    this.ispreview = json["is_preview"];
    this.createtime = json["create_time"];
    if (json["cha_list"] != null) {
      this.chalist = new List<ChaList>();
      json["cha_list"].forEach((v) {
        this.chalist.add(new ChaList.fromJson(v));
      });
    }
    this.commentlist = json["comment_list"];
    this.authoruserid = json["author_user_id"];
    this.videotext = json["video_text"];
    this.groupid = json["group_id"];
    this.islivereplay = json["is_live_replay"];
    this.shareinfo = json["share_info"] != null
        ? new ShareInfo.fromJson(json["share_info"])
        : null;
    this.position = json["position"];
    this.imageinfos = json["image_infos"];
    this.riskinfos = json["risk_infos"] != null
        ? new RiskInfos.fromJson(json["risk_infos"])
        : null;
    this.uniqidposition = json["uniqid_position"];
    this.geofencing = json["geofencing"];
    this.statistics = json["statistics"] != null
        ? new Statistics.fromJson(json["statistics"])
        : null;
    this.awemetype = json["aweme_type"];
    this.music =
        json["music"] != null ? new Music.fromJson(json["music"]) : null;
    if (json["text_extra"] != null) {
      this.textExtras = new List<TextExtra>();
      json['text_extra'].forEach((v) {
        textExtras.add(new TextExtra.formJson(v));
      });
    }
    this.video =
        json["video"] != null ? new Video.fromJson(json["video"]) : null;
    this.shareurl = json["share_url"];
    this.desc = json["desc"];
    this.longvideo = json["long_video"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["aweme_id"] = this.awemeid;
    data["video_labels"] = this.videolabels;
    data["label_top_text"] = this.labeltoptext;
    data["category"] = this.category;
    if (this.author != null) {
      data["author"] = this.author.toJson();
    }
    data["duration"] = this.duration;
    data["promotions"] = this.promotions;
    data["is_preview"] = this.ispreview;
    data["create_time"] = this.createtime;
    if (this.chalist != null) {
      data["cha_list"] = this.chalist.map((e) => e.toJson()).toList();
    }
    data["comment_list"] = this.commentlist;
    data["author_user_id"] = this.authoruserid;
    data["video_text"] = this.videotext;
    data["group_id"] = this.groupid;
    data["is_live_replay"] = this.islivereplay;
    if (this.shareinfo != null) {
      data["share_info"] = this.shareinfo.toJson();
    }
    data["position"] = this.position;
    data["image_infos"] = this.imageinfos;
    if (this.riskinfos != null) {
      data["risk_infos"] = this.riskinfos.toJson();
    }
    data["uniqid_position"] = this.uniqidposition;
    data["geofencing"] = this.geofencing;
    if (this.statistics != null) {
      data["statistics"] = this.statistics.toJson();
    }
    data["aweme_type"] = this.awemetype;
    if (this.music != null) {
      data["music"] = this.music.toJson();
    }
    if (this.textExtras != null) {
      data["text_extra"] = this.textExtras.map((e) => e.toJson()).toList();
    }
    if (this.video != null) {
      data["video"] = this.video.toJson();
    }
    data["share_url"] = this.shareurl;
    data["desc"] = this.desc;
    data["long_video"] = this.longvideo;
    return data;
  }
}

class TextExtra {
  String hashtagName;
  int hashtagId;
  int start;
  int end;
  int type;

  TextExtra(
      {this.hashtagName, this.hashtagId, this.start, this.end, this.type});

  TextExtra.formJson(Map<String, dynamic> json) {
    this.hashtagName = json["hashtag_name"];
    this.hashtagId = json["hashtag_id"];
    this.start = json["start"];
    this.end = json["end"];
    this.type = json["type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["hashtag_name"] = this.hashtagName;
    data["hashtag_id"] = this.hashtagId;
    data["start"] = this.start;
    data["end"] = this.end;
    data["type"] = this.type;
    return data;
  }
}

// Author
class Author {
  String geofencing;
  String uid;
  String shortID;
  String signature;
  AvatarMedium avatarMedium;
  String uniqueId;
  String followersDetail;
  String platformSyncInfo;
  String policyVersion;
  String nickname;
  AvatarLarger avatarlarger;
  AvatarThumb avatarthumb;

  Author(
      {this.geofencing,
      this.uid,
      this.shortID,
      this.signature,
      this.avatarMedium,
      this.uniqueId,
      this.followersDetail,
      this.platformSyncInfo,
      this.policyVersion,
      this.nickname,
      this.avatarlarger,
      this.avatarthumb});

  Author.fromJson(Map<String, dynamic> json) {
    this.geofencing = json["geofencing"];
    this.uid = json["uid"];
    this.shortID = json["short_id"];
    this.signature = json["signature"];
    this.avatarMedium = json["avatar_medium"] != null
        ? new AvatarMedium.fromJson(json["avatar_medium"])
        : null;
    this.uniqueId = json["unique_id"];
    this.followersDetail = json["followers_detail"];
    this.platformSyncInfo = json["platform_sync_info"];
    this.policyVersion = json["policy_version"];
    this.nickname = json["nickname"];
    this.avatarlarger = json["avatar_larger"] != null
        ? new AvatarLarger.formJson(json["avatar_larger"])
        : null;
    this.avatarthumb = json["avatar_thumb"] != null
        ? new AvatarThumb.formJson(json["avatar_thumb"])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["geofencing"] = this.geofencing;
    data["uid"] = this.uid;
    data["short_id"] = this.shortID;
    data["signature"] = this.signature;
    if (this.avatarMedium != null) {
      data["avatar_medium"] = this.avatarMedium.toJson();
    }
    data["unique_id"] = this.uniqueId;
    data["followers_detail"] = this.followersDetail;
    data["platform_sync_info"] = this.platformSyncInfo;
    data["policy_version"] = this.policyVersion;
    data["nickname"] = this.nickname;
    if (this.avatarlarger != null) {
      data["avatar_larger"] = this.avatarlarger.toJson();
    }
    if (this.avatarthumb != null) {
      data["avatar_thumb"] = this.avatarthumb.toJson();
    }
    return data;
  }
}

class AvatarMedium {
  List<String> urlList;
  String uri;
  AvatarMedium({this.urlList, this.uri});

  AvatarMedium.fromJson(Map<String, dynamic> json) {
    if (json["url_list"] != null) {
      this.urlList = json["url_list"].cast<String>();
    }
    this.uri = json["uri"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["url_list"] = this.urlList;
    return data;
  }
}

class AvatarLarger {
  String uri;
  List<String> urlList;
  AvatarLarger({this.uri, this.urlList});

  AvatarLarger.formJson(Map<String, dynamic> json) {
    this.uri = json["uri"] as String;
    this.urlList = json["url_list"].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["url_list"] = this.urlList;
    data["uri"] = this.uri;
    return data;
  }
}

class AvatarThumb {
  String uri;
  List<String> urlList;
  AvatarThumb({this.uri, this.urlList});

  AvatarThumb.formJson(Map<String, dynamic> json) {
    this.uri = json["uri"] as String;
    this.urlList = json["url_list"].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["url_list"] = this.urlList;
    data["uri"] = this.uri;
    return data;
  }
}

class ExtraData {
  int now;
  String logid;
  ExtraData({this.now, this.logid});

  ExtraData.fromJson(Map<String, dynamic> json) {
    this.now = json["now"];
    this.logid = json["logid"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["now"] = this.now;
    data["logid"] = this.logid;
    return data;
  }
}
//End author

//ChaList
class ChaList {
  String chaName;
  int viewCount;
  String hashTagProfile;
  bool isCommerce;
  String cid;
  String desc;
  int userCount;
  String connectMusic;
  int type;
  CoverItem coverItem;
  ChaList(
      {this.chaName,
      this.viewCount,
      this.hashTagProfile,
      this.isCommerce,
      this.cid,
      this.desc,
      this.userCount,
      this.connectMusic,
      this.type,
      this.coverItem});

  ChaList.fromJson(Map<String, dynamic> json) {
    this.chaName = json["cha_name"];
    this.viewCount = json["view_count"];
    this.hashTagProfile = json["hash_tag_profile"];
    this.isCommerce = json["is_commerce"];
    this.cid = json["cid"];
    this.desc = json["desc"];
    this.userCount = json["user_count"];
    this.connectMusic = json["connect_music"];
    this.type = json["type"];
    this.coverItem = json["cover_item"] != null
        ? new CoverItem.formJson(json["cover_item"])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["cha_name"] = this.chaName;
    data["view_count"] = this.viewCount;
    data["hash_tag_profile"] = this.hashTagProfile;
    data["is_commerce"] = this.isCommerce;
    data["cid"] = this.cid;
    data["desc"] = this.desc;
    data["user_count"] = this.userCount;
    data["connect_music"] = this.connectMusic;
    data["type"] = this.type;
    if (this.coverItem != null) {
      data["cover_item"] = this.coverItem.toJson();
    }
    return data;
  }
}

class CoverItem {
  String uri;
  List<String> urlList;
  CoverItem({this.uri, this.urlList});
  CoverItem.formJson(Map<String, dynamic> json) {
    this.uri = json["uri"] as String;
    this.urlList = json["url_list"].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["url_list"] = this.urlList;
    data["uri"] = this.uri;
    return data;
  }
}
//End ChaList

//ShareInfo
class ShareInfo {
  String shareweibodesc;
  String sharedesc;
  String sharetitle;
  ShareInfo({this.shareweibodesc, this.sharedesc, this.sharetitle});
  ShareInfo.fromJson(Map<String, dynamic> json) {
    this.shareweibodesc = json["share_weibo_desc"];
    this.sharedesc = json["share_desc"];
    this.sharetitle = json["share_title"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["share_weibo_desc"] = this.shareweibodesc;
    data["share_desc"] = this.sharedesc;
    data["share_title"] = this.sharetitle;
    return data;
  }
}
//End ShareInfo

//RiskInfos
class RiskInfos {
  bool warn;
  int type;
  String content;
  RiskInfos({this.warn, this.type, this.content});
  RiskInfos.fromJson(Map<String, dynamic> json) {
    this.warn = json["warn"] as bool;
    this.type = json["type"];
    this.content = json["content"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["warn"] = this.warn;
    data["type"] = this.type;
    data["content"] = this.content;
    return data;
  }
}
//End RiskInfos

//Statistics
class Statistics {
  String awemeId;
  int commentCount;
  int diggCount;
  Statistics.fromJson(Map<String, dynamic> json) {
    this.awemeId = json["aweme_id"];
    this.commentCount = json["comment_count"];
    this.diggCount = json["digg_count"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["aweme_id"] = this.awemeId;
    data["comment_count"] = this.commentCount;
    data["digg_count"] = this.diggCount;
    return data;
  }
}
//End Statistics

//Music
class Music {
  CoverLarge coverlarge;
  CoverMedium covermedium;
  int duration;
  int status;
  String mid;
  String title;
  String author;
  PlayUrl playurl;
  String position;
  int id;
  CoverHd coverhd;
  CoverThumb coverthumb;

  Music.fromJson(Map<String, dynamic> json) {
    this.coverlarge = json["cover_large"] != null
        ? new CoverLarge.formJson(json["cover_large"])
        : null;
    this.covermedium = json["cover_medium"] != null
        ? new CoverMedium.formJson(json["cover_medium"])
        : null;
    this.duration = json["duration"];
    this.status = json["status"];
    this.mid = json["mid"];
    this.title = json["title"];
    this.author = json["author"];
    this.playurl = json["play_url"] != null
        ? new PlayUrl.formJson(json["play_url"])
        : null;
    this.position = json["position"];
    this.id = json["id"];
    this.coverhd = json["cover_hd"] != null
        ? new CoverHd.formJson(json["cover_hd"])
        : null;
    this.coverthumb = json["cover_thumb"] != null
        ? new CoverThumb.formJson(json["cover_thumb"])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coverlarge != null) {
      data["cover_large"] = this.coverlarge.toJson();
    }
    if (this.covermedium != null) {
      data["cover_medium"] = this.covermedium.toJson();
    }
    data["duration"] = this.duration;
    data["status"] = this.status;
    data["mid"] = this.mid;
    data["title"] = this.title;
    data["author"] = this.author;
    if (this.playurl != null) {
      data["play_url"] = this.playurl.toJson();
    }
    data["position"] = this.position;
    data["id"] = this.id;
    if (this.coverhd != null) {
      data["cover_hd"] = this.coverhd.toJson();
    }
    if (this.coverthumb != null) {
      data["cover_thumb"] = this.coverthumb.toJson();
    }
    return data;
  }
}

class CoverLarge {
  String uri;
  List<String> urlList;
  CoverLarge({this.uri, this.urlList});
  CoverLarge.formJson(Map<String, dynamic> json) {
    this.uri = json["uri"] as String;
    this.urlList = json["url_list"].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["url_list"] = this.urlList;
    data["uri"] = this.uri;
    return data;
  }
}

class CoverMedium {
  String uri;
  List<String> urlList;
  CoverMedium({this.uri, this.urlList});
  CoverMedium.formJson(Map<String, dynamic> json) {
    this.uri = json["uri"] as String;
    this.urlList = json["url_list"].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["url_list"] = this.urlList;
    data["uri"] = this.uri;
    return data;
  }
}

class PlayUrl {
  String uri;
  List<String> urlList;
  PlayUrl({this.uri, this.urlList});
  PlayUrl.formJson(Map<String, dynamic> json) {
    this.uri = json["uri"] as String;
    this.urlList = json["url_list"].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["url_list"] = this.urlList;
    data["uri"] = this.uri;
    return data;
  }
}

class CoverHd {
  String uri;
  List<String> urlList;
  CoverHd({this.uri, this.urlList});
  CoverHd.formJson(Map<String, dynamic> json) {
    this.uri = json["uri"] as String;
    this.urlList = json["url_list"].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["url_list"] = this.urlList;
    data["uri"] = this.uri;
    return data;
  }
}

class CoverThumb {
  String uri;
  List<String> urlList;
  CoverThumb({this.uri, this.urlList});
  CoverThumb.formJson(Map<String, dynamic> json) {
    this.uri = json["uri"] as String;
    this.urlList = json["url_list"].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["url_list"] = this.urlList;
    data["uri"] = this.uri;
    return data;
  }
}
//End Music

//Video
class Video {
  int width;
  OriginCover origincover;
  String ratio;
  bool haswatermark;
  String bitrate;
  PlayAddr playaddr;
  Cover cover;
  int duration;
  String vid;
  int islongvideo;
  int height;
  DynamicCover dynamiccover;
  Video(
      {this.width,
      this.origincover,
      this.ratio,
      this.haswatermark,
      this.bitrate,
      this.playaddr,
      this.cover,
      this.duration,
      this.vid,
      this.islongvideo,
      this.height,
      this.dynamiccover});
  Video.fromJson(Map<String, dynamic> json) {
    this.width = json["width"];
    this.origincover = json["origin_cover"] != null
        ? new OriginCover.formJson(json["origin_cover"])
        : null;
    this.ratio = json["ratio"];
    this.haswatermark = json["has_watermark"];
    this.bitrate = json["bit_rate"];
    this.playaddr = json["play_addr"] != null
        ? new PlayAddr.formJson(json["play_addr"])
        : null;
    this.cover =
        json["cover"] != null ? new Cover.formJson(json["cover"]) : null;
    this.duration = json["duration"];
    this.vid = json["vid"];
    this.islongvideo = json["is_long_video"];
    this.height = json["height"];
    this.dynamiccover = json["dynamic_cover"] != null
        ? new DynamicCover.formJson(json["dynamic_cover"])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["width"] = this.width;
    if (this.origincover != null) {
      data["origin_cover"] = this.origincover.toJson();
    }
    data["ratio"] = this.ratio;
    data["has_watermark"] = this.haswatermark;
    data["bit_rate"] = this.bitrate;
    if (this.playaddr != null) {
      data["play_addr"] = this.playaddr.toJson();
    }
    if (this.cover != null) {
      data["cover"] = this.cover.toJson();
    }
    data["duration"] = this.duration;
    data["vid"] = this.vid;
    data["is_long_video"] = this.islongvideo;
    data["height"] = this.height;
    if (this.dynamiccover != null) {
      data["dynamic_cover"] = this.dynamiccover.toJson();
    }
    return data;
  }
}

class OriginCover {
  String uri;
  List<String> urlList;
  OriginCover({this.uri, this.urlList});
  OriginCover.formJson(Map<String, dynamic> json) {
    this.uri = json["uri"] as String;
    this.urlList = json["url_list"].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["url_list"] = this.urlList;
    data["uri"] = this.uri;
    return data;
  }
}

class PlayAddr {
  String uri;
  List<String> urlList;
  PlayAddr({this.uri, this.urlList});
  PlayAddr.formJson(Map<String, dynamic> json) {
    this.uri = json["uri"] as String;
    this.urlList = json["url_list"].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["url_list"] = this.urlList;
    data["uri"] = this.uri;
    return data;
  }
}

class Cover {
  String uri;
  List<String> urlList;
  Cover({this.uri, this.urlList});
  Cover.formJson(Map<String, dynamic> json) {
    this.uri = json["uri"] as String;
    this.urlList = json["url_list"].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["url_list"] = this.urlList;
    data["uri"] = this.uri;
    return data;
  }
}

class DynamicCover {
  String uri;
  List<String> urlList;
  DynamicCover({this.uri, this.urlList});
  DynamicCover.formJson(Map<String, dynamic> json) {
    this.uri = json["uri"] as String;
    this.urlList = json["url_list"].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["url_list"] = this.urlList;
    data["uri"] = this.uri;
    return data;
  }
}

//End Video
