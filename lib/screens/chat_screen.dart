import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add({"sender": "You", "text": text});
    });

    _controller.clear();
    _botReply(text.toLowerCase());
  }

  void _botReply(String userText) {
    String reply;
    if (userText.contains("sos") || userText.contains("help")) {
      reply =
          "🚨 SOS triggered! Please call campus security at +1 123-456-7890.";
    } else if (userText.contains("escort")) {
      reply = "👮 Safety escort available. Call campus escort services.";
    } else if (userText.contains("report")) {
      reply = "📝 You can file an incident report at the admin office.";
    } else if (userText.contains("tip")) {
      reply = "💡 Safety Tip: Stick to well-lit paths at night.";
    } else {
      reply = "Hi, I'm SecUnit. Try typing: SOS, escort, report, or tip.";
    }

    setState(() {
      _messages.add({"sender": "SecUnit", "text": reply});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SecUnit Chat")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isUser = msg["sender"] == "You";
                return Align(
                  alignment: isUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    constraints: const BoxConstraints(maxWidth: 260),
                    decoration: BoxDecoration(
                      color: isUser
                          ? Colors.blue.shade200
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(msg["text"] ?? ""),
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Type a message…",
                    ),
                    onSubmitted: _sendMessage,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.red,
        onPressed: () => _sendMessage("SOS"),
        icon: const Icon(Icons.warning),
        label: const Text("SOS", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
