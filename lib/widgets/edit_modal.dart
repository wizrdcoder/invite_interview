import 'package:flutter/material.dart';
import '../models/wedding_invitation.dart';
import '../services/html_generator.dart';

class EditModal extends StatefulWidget {
  final WeddingInvitation invitation;
  final Function(WeddingInvitation) onSave;

  const EditModal({
    super.key,
    required this.invitation,
    required this.onSave,
  });

  @override
  State<EditModal> createState() => _EditModalState();
}

class _EditModalState extends State<EditModal> {
  late TextEditingController _titleController;
  late TextEditingController _namesController;
  late TextEditingController _eventDateController;
  late TextEditingController _eventTimeController;
  late TextEditingController _eventLocationController;
  late TextEditingController _ceremonyVenueController;
  late TextEditingController _ceremonyTimeController;
  late TextEditingController _receptionVenueController;
  late TextEditingController _receptionTimeController;
  late TextEditingController _rsvpPhoneController;
  late TextEditingController _dressCodeController;
  
  late String _selectedBackgroundColor;
  late bool _gatePassRequired;
  late String _selectedFontFamily;
  late String _selectedTextColor;
  late String _selectedAccentColor;
  late bool _isItalic;
  late bool _isBold;
  late double _fontSize;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _titleController = TextEditingController(text: widget.invitation.title);
    _namesController = TextEditingController(text: widget.invitation.coupleNames);
    _eventDateController = TextEditingController(text: widget.invitation.eventDate);
    _eventTimeController = TextEditingController(text: widget.invitation.eventTime);
    _eventLocationController = TextEditingController(text: widget.invitation.eventLocation);
    _ceremonyVenueController = TextEditingController(text: widget.invitation.ceremonyVenue);
    _ceremonyTimeController = TextEditingController(text: widget.invitation.ceremonyTime);
    _receptionVenueController = TextEditingController(text: widget.invitation.receptionVenue);
    _receptionTimeController = TextEditingController(text: widget.invitation.receptionTime);
    _rsvpPhoneController = TextEditingController(text: widget.invitation.rsvpPhone);
    _dressCodeController = TextEditingController(text: widget.invitation.dressCode);
    
    _selectedBackgroundColor = widget.invitation.backgroundColor;
    _gatePassRequired = widget.invitation.gatePassRequired;
    _selectedFontFamily = widget.invitation.fontFamily;
    
    _selectedTextColor = HtmlGenerator.textColorOptions.containsValue(widget.invitation.textColor) 
        ? widget.invitation.textColor 
        : HtmlGenerator.textColorOptions.values.first;
    
    _selectedAccentColor = HtmlGenerator.textColorOptions.containsValue(widget.invitation.accentColor) 
        ? widget.invitation.accentColor 
        : HtmlGenerator.textColorOptions.values.first;
    
    _isItalic = widget.invitation.isItalic;
    _isBold = widget.invitation.isBold;
    _fontSize = widget.invitation.fontSize;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          _buildHeader(),
          const Divider(height: 1),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: _buildForm(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Row(
            children: [
              Icon(Icons.edit, color: Colors.blue[600]),
              const SizedBox(width: 12),
              Text(
                'Customize Your Invitation',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSection('Font & Style', [
          _buildFontFamilyDropdown(),
          _buildTextColorDropdown(),
          _buildAccentColorDropdown(),
          _buildFontSizeSlider(),
          _buildFontStyleToggles(),
        ]),
        
        _buildSection('Basic Information', [
          _buildTextField(_titleController, 'Invitation Title', Icons.title),
          _buildTextField(_namesController, 'Couple Names', Icons.person),
          _buildColorDropdown(),
        ]),
        
        _buildSection('Event Details', [
          _buildTextField(_eventDateController, 'Event Date', Icons.calendar_today),
          _buildTextField(_eventTimeController, 'Event Time', Icons.access_time),
          _buildTextField(_eventLocationController, 'Event Location', Icons.location_on),
        ]),
        
        _buildSection('Ceremony & Reception', [
          _buildTextField(_ceremonyVenueController, 'Ceremony Venue', Icons.church),
          _buildTextField(_ceremonyTimeController, 'Ceremony Time', Icons.access_time),
          _buildTextField(_receptionVenueController, 'Reception Venue', Icons.celebration),
          _buildTextField(_receptionTimeController, 'Reception Time', Icons.access_time),
        ]),
        
        _buildSection('Contact & Details', [
          _buildTextField(_rsvpPhoneController, 'RSVP Phone', Icons.phone),
          _buildTextField(_dressCodeController, 'Dress Code', Icons.style),
          _buildGatePassSwitch(),
        ]),
        
        const SizedBox(height: 30),
        _buildSaveButton(),
        const SizedBox(height: 16),
        _buildInfoBox(),
      ],
    );
  }

  Widget _buildFontFamilyDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        value: _selectedFontFamily,
        decoration: const InputDecoration(
          labelText: 'Font Family',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.font_download),
        ),
        items: HtmlGenerator.fontOptions.keys.map((String fontName) {
          return DropdownMenuItem<String>(
            value: fontName,
            child: Text(fontName, style: TextStyle(fontFamily: fontName)),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              _selectedFontFamily = newValue;
            });
            _updatePreview();
          }
        },
      ),
    );
  }

  Widget _buildTextColorDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        value: _selectedTextColor,
        decoration: const InputDecoration(
          labelText: 'Text Color',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.color_lens),
        ),
        items: HtmlGenerator.textColorOptions.entries.map((entry) {
          return DropdownMenuItem<String>(
            value: entry.value,
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(int.parse(entry.value.replaceAll('#', '0xFF'))),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                ),
                const SizedBox(width: 12),
                Text(entry.key),
              ],
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              _selectedTextColor = newValue;
            });
            _updatePreview();
          }
        },
      ),
    );
  }

  Widget _buildAccentColorDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        value: _selectedAccentColor,
        decoration: const InputDecoration(
          labelText: 'Accent Color',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.palette),
        ),
        items: HtmlGenerator.textColorOptions.entries.map((entry) {
          return DropdownMenuItem<String>(
            value: entry.value,
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(int.parse(entry.value.replaceAll('#', '0xFF'))),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                ),
                const SizedBox(width: 12),
                Text(entry.key),
              ],
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              _selectedAccentColor = newValue;
            });
            _updatePreview();
          }
        },
      ),
    );
  }

  Widget _buildFontSizeSlider() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Font Size: ${_fontSize.round()}px'),
          Slider(
            value: _fontSize,
            min: 12.0,
            max: 24.0,
            divisions: 12,
            onChanged: (double value) {
              setState(() {
                _fontSize = value;
              });
              _updatePreview();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFontStyleToggles() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: CheckboxListTile(
              title: const Text('Italic'),
              value: _isItalic,
              onChanged: (bool? value) {
                setState(() {
                  _isItalic = value ?? false;
                });
                _updatePreview();
              },
            ),
          ),
          Expanded(
            child: CheckboxListTile(
              title: const Text('Bold'),
              value: _isBold,
              onChanged: (bool? value) {
                setState(() {
                  _isBold = value ?? false;
                });
                _updatePreview();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16, top: 24),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        ...children,
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(icon),
        ),
        onChanged: (_) => _updatePreview(),
      ),
    );
  }

  Widget _buildColorDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        value: _selectedBackgroundColor,
        decoration: const InputDecoration(
          labelText: 'Background Color',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.palette),
        ),
        items: HtmlGenerator.colorOptions.keys.map((String colorName) {
          return DropdownMenuItem<String>(
            value: colorName,
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Color(
                      int.parse(
                        HtmlGenerator.colorOptions[colorName]!.replaceAll('#', '0xFF'),
                      ),
                    ),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                ),
                const SizedBox(width: 12),
                Text(colorName),
              ],
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              _selectedBackgroundColor = newValue;
            });
            _updatePreview();
          }
        },
      ),
    );
  }

  Widget _buildGatePassSwitch() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SwitchListTile(
        title: const Text('Gate Pass Required'),
        subtitle: const Text('Show gate pass requirement on invitation'),
        value: _gatePassRequired,
        onChanged: (bool value) {
          setState(() {
            _gatePassRequired = value;
          });
          _updatePreview();
        },
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: _saveChanges,
        icon: const Icon(Icons.check),
        label: const Text('Save Changes'),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.blue[600],
          foregroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildInfoBox() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.blue[600], size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Changes are applied automatically as you type. Click Save Changes to close this panel.',
              style: TextStyle(color: Colors.blue[800], fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  void _updatePreview() {
    final updatedInvitation = widget.invitation.copyWith(
      title: _titleController.text,
      coupleNames: _namesController.text,
      backgroundColor: _selectedBackgroundColor,
      eventDate: _eventDateController.text,
      eventTime: _eventTimeController.text,
      eventLocation: _eventLocationController.text,
      ceremonyVenue: _ceremonyVenueController.text,
      ceremonyTime: _ceremonyTimeController.text,
      receptionVenue: _receptionVenueController.text,
      receptionTime: _receptionTimeController.text,
      rsvpPhone: _rsvpPhoneController.text,
      dressCode: _dressCodeController.text,
      gatePassRequired: _gatePassRequired,
      fontFamily: _selectedFontFamily,
      textColor: _selectedTextColor,
      accentColor: _selectedAccentColor,
      isItalic: _isItalic,
      isBold: _isBold,
      fontSize: _fontSize,
    );
    widget.onSave(updatedInvitation);
  }

  void _saveChanges() {
    _updatePreview();
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _namesController.dispose();
    _eventDateController.dispose();
    _eventTimeController.dispose();
    _eventLocationController.dispose();
    _ceremonyVenueController.dispose();
    _ceremonyTimeController.dispose();
    _receptionVenueController.dispose();
    _receptionTimeController.dispose();
    _rsvpPhoneController.dispose();
    _dressCodeController.dispose();
    super.dispose();
  }
}
