// To parse this JSON data, do
//
//     final userGithubModel = userGithubModelFromJson(jsonString);

import 'dart:convert';

UserGithubModel userGithubModelFromJson(String str) => UserGithubModel.fromJson(json.decode(str));

String userGithubModelToJson(UserGithubModel data) => json.encode(data.toJson());

class UserGithubModel {
  UserGithubModel({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  final int totalCount;
  final bool incompleteResults;
  final List<Item> items;

  UserGithubModel copyWith({
    int totalCount,
    bool incompleteResults,
    List<Item> items,
  }) =>
      UserGithubModel(
        totalCount: totalCount ?? this.totalCount,
        incompleteResults: incompleteResults ?? this.incompleteResults,
        items: items ?? this.items,
      );

  factory UserGithubModel.fromJson(Map<String, dynamic> json) => UserGithubModel(
    totalCount: json["total_count"] == null ? null : json["total_count"],
    incompleteResults: json["incomplete_results"] == null ? null : json["incomplete_results"],
    items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_count": totalCount == null ? null : totalCount,
    "incomplete_results": incompleteResults == null ? null : incompleteResults,
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
    this.score,
  });

  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String gravatarId;
  final String url;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final String type;
  final bool siteAdmin;
  final int score;

  Item copyWith({
    String login,
    int id,
    String nodeId,
    String avatarUrl,
    String gravatarId,
    String url,
    String htmlUrl,
    String followersUrl,
    String followingUrl,
    String gistsUrl,
    String starredUrl,
    String subscriptionsUrl,
    String organizationsUrl,
    String reposUrl,
    String eventsUrl,
    String receivedEventsUrl,
    String type,
    bool siteAdmin,
    int score,
  }) =>
      Item(
        login: login ?? this.login,
        id: id ?? this.id,
        nodeId: nodeId ?? this.nodeId,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        gravatarId: gravatarId ?? this.gravatarId,
        url: url ?? this.url,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        followersUrl: followersUrl ?? this.followersUrl,
        followingUrl: followingUrl ?? this.followingUrl,
        gistsUrl: gistsUrl ?? this.gistsUrl,
        starredUrl: starredUrl ?? this.starredUrl,
        subscriptionsUrl: subscriptionsUrl ?? this.subscriptionsUrl,
        organizationsUrl: organizationsUrl ?? this.organizationsUrl,
        reposUrl: reposUrl ?? this.reposUrl,
        eventsUrl: eventsUrl ?? this.eventsUrl,
        receivedEventsUrl: receivedEventsUrl ?? this.receivedEventsUrl,
        type: type ?? this.type,
        siteAdmin: siteAdmin ?? this.siteAdmin,
        score: score ?? this.score,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    login: json["login"] == null ? null : json["login"],
    id: json["id"] == null ? null : json["id"],
    nodeId: json["node_id"] == null ? null : json["node_id"],
    avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
    gravatarId: json["gravatar_id"] == null ? null : json["gravatar_id"],
    url: json["url"] == null ? null : json["url"],
    htmlUrl: json["html_url"] == null ? null : json["html_url"],
    followersUrl: json["followers_url"] == null ? null : json["followers_url"],
    followingUrl: json["following_url"] == null ? null : json["following_url"],
    gistsUrl: json["gists_url"] == null ? null : json["gists_url"],
    starredUrl: json["starred_url"] == null ? null : json["starred_url"],
    subscriptionsUrl: json["subscriptions_url"] == null ? null : json["subscriptions_url"],
    organizationsUrl: json["organizations_url"] == null ? null : json["organizations_url"],
    reposUrl: json["repos_url"] == null ? null : json["repos_url"],
    eventsUrl: json["events_url"] == null ? null : json["events_url"],
    receivedEventsUrl: json["received_events_url"] == null ? null : json["received_events_url"],
    type: json["type"] == null ? null : json["type"],
    siteAdmin: json["site_admin"] == null ? null : json["site_admin"],
    score: json["score"] == null ? null : json["score"],
  );

  Map<String, dynamic> toJson() => {
    "login": login == null ? null : login,
    "id": id == null ? null : id,
    "node_id": nodeId == null ? null : nodeId,
    "avatar_url": avatarUrl == null ? null : avatarUrl,
    "gravatar_id": gravatarId == null ? null : gravatarId,
    "url": url == null ? null : url,
    "html_url": htmlUrl == null ? null : htmlUrl,
    "followers_url": followersUrl == null ? null : followersUrl,
    "following_url": followingUrl == null ? null : followingUrl,
    "gists_url": gistsUrl == null ? null : gistsUrl,
    "starred_url": starredUrl == null ? null : starredUrl,
    "subscriptions_url": subscriptionsUrl == null ? null : subscriptionsUrl,
    "organizations_url": organizationsUrl == null ? null : organizationsUrl,
    "repos_url": reposUrl == null ? null : reposUrl,
    "events_url": eventsUrl == null ? null : eventsUrl,
    "received_events_url": receivedEventsUrl == null ? null : receivedEventsUrl,
    "type": type == null ? null : type,
    "site_admin": siteAdmin == null ? null : siteAdmin,
    "score": score == null ? null : score,
  };
}
