// To parse this JSON data, do
//
//     final userGithubDataModel = userGithubDataModelFromJson(jsonString);

import 'dart:convert';

UserGithubDataModel userGithubDataModelFromJson(String str) => UserGithubDataModel.fromJson(json.decode(str));

String userGithubDataModelToJson(UserGithubDataModel data) => json.encode(data.toJson());

class UserGithubDataModel {
  UserGithubDataModel({
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
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.hireable,
    this.bio,
    this.twitterUsername,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
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
  final String name;
  final dynamic company;
  final String blog;
  final dynamic location;
  final dynamic email;
  final bool hireable;
  final String bio;
  final dynamic twitterUsername;
  final int publicRepos;
  final int publicGists;
  final int followers;
  final int following;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserGithubDataModel copyWith({
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
    String name,
    dynamic company,
    String blog,
    dynamic location,
    dynamic email,
    bool hireable,
    String bio,
    dynamic twitterUsername,
    int publicRepos,
    int publicGists,
    int followers,
    int following,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      UserGithubDataModel(
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
        name: name ?? this.name,
        company: company ?? this.company,
        blog: blog ?? this.blog,
        location: location ?? this.location,
        email: email ?? this.email,
        hireable: hireable ?? this.hireable,
        bio: bio ?? this.bio,
        twitterUsername: twitterUsername ?? this.twitterUsername,
        publicRepos: publicRepos ?? this.publicRepos,
        publicGists: publicGists ?? this.publicGists,
        followers: followers ?? this.followers,
        following: following ?? this.following,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory UserGithubDataModel.fromJson(Map<String, dynamic> json) => UserGithubDataModel(
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
    name: json["name"] == null ? null : json["name"],
    company: json["company"],
    blog: json["blog"] == null ? null : json["blog"],
    location: json["location"],
    email: json["email"],
    hireable: json["hireable"] == null ? null : json["hireable"],
    bio: json["bio"] == null ? null : json["bio"],
    twitterUsername: json["twitter_username"],
    publicRepos: json["public_repos"] == null ? null : json["public_repos"],
    publicGists: json["public_gists"] == null ? null : json["public_gists"],
    followers: json["followers"] == null ? null : json["followers"],
    following: json["following"] == null ? null : json["following"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
    "name": name == null ? null : name,
    "company": company,
    "blog": blog == null ? null : blog,
    "location": location,
    "email": email,
    "hireable": hireable == null ? null : hireable,
    "bio": bio == null ? null : bio,
    "twitter_username": twitterUsername,
    "public_repos": publicRepos == null ? null : publicRepos,
    "public_gists": publicGists == null ? null : publicGists,
    "followers": followers == null ? null : followers,
    "following": following == null ? null : following,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
