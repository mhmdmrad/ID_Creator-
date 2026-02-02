import 'package:flutter/material.dart';
import '../id_data.dart';
import 'glass_container.dart';

class IdCreationForm extends StatefulWidget {
  final Function(IdData) onCreate;

  const IdCreationForm({super.key, required this.onCreate});

  @override
  State<IdCreationForm> createState() => _IdCreationFormState();
}

class _IdCreationFormState extends State<IdCreationForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _regionController = TextEditingController();
  final _sexController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _regionController.dispose();
    _sexController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final data = IdData(
        name: _nameController.text,
        age: _ageController.text,
        region: _regionController.text,
        sex: _sexController.text,
      );
      widget.onCreate(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassContainer(
        width: 350,
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'ID CREATION',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 30),
              _buildField('Name', _nameController, Icons.person),
              const SizedBox(height: 16),
              _buildField('Age', _ageController, Icons.calendar_today),
              const SizedBox(height: 16),
              _buildField('Region', _regionController, Icons.map),
              const SizedBox(height: 16),
              _buildField('Sex', _sexController, Icons.wc),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.cyanAccent.withOpacity(0.8),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'GENERATE ID',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(
    String label,
    TextEditingController controller,
    IconData icon,
  ) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      validator: (value) => value == null || value.isEmpty ? 'Required' : null,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        prefixIcon: Icon(icon, color: Colors.cyanAccent),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.cyanAccent),
        ),
        filled: true,
        fillColor: Colors.black.withOpacity(0.2),
      ),
    );
  }
}
