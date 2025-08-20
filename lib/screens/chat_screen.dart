import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> _messages = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _botReply(""); // Initial greeting
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add({"sender": "You", "text": text});
    });

    _controller.clear();
    // Simulate bot thinking time
    Future.delayed(const Duration(milliseconds: 500), () {
      _botReply(text.toLowerCase());
    });
  }

  void _botReply(String userText) {
    String reply;
    if (userText.contains("sos") ||
        userText.contains("help") ||
        userText.contains("emergency")) {
      reply =
          "🆘 SOS triggered! Please call campus security at +1 123-456-7890.";
    } else if (userText.contains("escort")) {
      reply =
          "🛡️ Safety escort available. Call campus escort services at +1 123-456-7891.";
    } else if (userText.contains("report")) {
      reply =
          "📋 You can file an incident report at the admin office or online at university.edu/report.";
    } else if (userText.contains("tip")) {
      reply =
          "💡 Safety Tip: Always be aware of your surroundings and trust your instincts.";
    } else if (userText.contains("lost")) {
      reply =
          "If you're lost, please describe your location and I can try to help. You can also call security for assistance.";
    } else if (userText.contains("unsafe")) {
      reply =
          "If you feel unsafe, please move to a well-lit, populated area and call campus security immediately.";
    } else {
      reply =
          "Hi, I'm SecUnit, your campus safety assistant. How can I help? Try: 'SOS', 'escort', 'report', or 'tip'.";
    }

    setState(() {
      _messages.insert(0, {"sender": "SecUnit", "text": reply});
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
              reverse: true,
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
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    decoration: BoxDecoration(
                      color: isUser
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      msg["text"] ?? "",
                      style: TextStyle(
                        color: isUser
                            ? Colors.white
                            : Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: "Type a message...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      onSubmitted: _sendMessage,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () => _sendMessage(_controller.text),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.red.shade700,
        onPressed: () => _sendMessage("SOS"),
        icon: const Icon(Icons.warning, color: Colors.white),
        label: const Text(
          "SOS",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
