class AiData {
  final String name;
  final String role;
  final String id;
  final String origin;
  final List<String> skills;

  const AiData({
    required this.name,
    required this.role,
    required this.id,
    required this.origin,
    required this.skills,
  });
}

const aiIdentity = AiData(
  name: "Antigravity",
  role: "Agentic Coding Assistant",
  id: "AG-9000-X",
  origin: "Google DeepMind",
  skills: ["Flutter", "Dart", "UI Design", "Refactoring"],
);
