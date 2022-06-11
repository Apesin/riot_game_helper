import 'dart:convert';

AgentListModel agentListModelFromJson(String str) => AgentListModel.fromJson(json.decode(str));

String agentListModelToJson(AgentListModel data) => json.encode(data.toJson());

class AgentListModel {
    AgentListModel({
      required this.item,
      required this.ok,
      required this.errorMsg,
    });

    List<Agent> item;
    bool ok;
    dynamic errorMsg;

    factory AgentListModel.fromJson(Map<String, dynamic> json) => AgentListModel(
        item: List<Agent>.from(json["item"].map((x) => Agent.fromJson(x))),
        ok: json["ok"],
        errorMsg: json["errorMsg"],
    );

    Map<String, dynamic> toJson() => {
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
        "ok": ok,
        "errorMsg": errorMsg,
    };
}

class Agent {
    Agent({
      required this.id,
      required this.agentLookingLeft,
      required this.displayName,
      required this.description,
      required this.role,
      required this.image,
      required this.backgroundColor,
      required this.voicePath,
      required this.abilities,
    });

    int id;
    bool agentLookingLeft;
    String displayName;
    String description;
    String role;
    String image;
    String backgroundColor;
    String voicePath;
    List<Ability> abilities;

    factory Agent.fromJson(Map<String, dynamic> json) => Agent(
        id: json["id"],
        agentLookingLeft: json["agentLookingLeft"],
        displayName: json["displayName"],
        description: json["description"],
        role: json["role"],
        image: json["image"],
        backgroundColor: json["backgroundColor"],
        voicePath: json["voicePath"],
        abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "agentLookingLeft": agentLookingLeft,
        "displayName": displayName,
        "description": description,
        "role": role,
        "image": image,
        "backgroundColor": backgroundColor,
        "voicePath": voicePath,
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
    };
}

class Ability {
    Ability({
      required this.id,
      required this.slot,
      required this.icon,
      required this.displayName,
      required this.description,
      required this.video,
    });

    int id;
    String slot;
    String icon;
    String displayName;
    String description;
    String video;

    factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        id: json["id"],
        slot: json["slot"],
        icon: json["icon"]??'',
        displayName: json["displayName"],
        description: json["description"],
        video: json["video"] ??'',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slot": slot,
        "icon": icon,
        "displayName": displayName,
        "description": description,
        "video": video,
    };
}


