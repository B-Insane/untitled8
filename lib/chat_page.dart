import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final List<Map<String, String>> messages = [
    {'user': 'Luis', 'message': 'Hola, ¿cómo estás?'},
    {'user': 'Juan', 'message': 'Bien, gracias. ¿Y tú?'},
    {'user': 'Luis', 'message': 'También bien. ¿Necesitas ayuda con algo?'},
    {'user': 'Juan', 'message': 'Sí, necesito saber cómo registrar una cita.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat de Consultas'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isMine = message['user'] == 'Luis'; // Ejemplo: determinar el usuario actual
                return Align(
                  alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.symmetric(vertical: 5.0),
                    decoration: BoxDecoration(
                      color: isMine ? Colors.blueAccent : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment:
                      isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        Text(
                          message['user']!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isMine ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          message['message']!,
                          style: TextStyle(
                            color: isMine ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1.0),
          _buildMessageComposer(context),
        ],
      ),
    );
  }

  Widget _buildMessageComposer(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: () {
              // Lógica para agregar fotos
            },
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration.collapsed(
                hintText: 'Enviar un mensaje...',
              ),
              onSubmitted: (text) {
                // Lógica para enviar el mensaje
                _controller.clear();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Lógica para enviar el mensaje
              _controller.clear();
            },
          ),
        ],
      ),
    );
  }
}


