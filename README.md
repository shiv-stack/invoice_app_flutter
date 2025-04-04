# newinvoice_app




![invoice_app](https://github.com/user-attachments/assets/fe12ab77-1bbd-4683-af5f-2bea6e77544f)





This project is a simple and elegant Invoice Generator App built using Flutter with BLoC state management. It allows users to add invoice items dynamically, generate a detailed invoice in PDF format, and save it directly to their device. The app demonstrates core Flutter principles with a clean UI and includes runtime permission handling and file operations.
-----------------------------------------------------------------------------------------------------------------------

✨ Features
📌 Add multiple invoice items with item name and price.

➕ Dynamic item entry using a plus (+) icon.

📄 Generate and download a professional invoice as a PDF.

🗂️ Save the PDF to the device's local storage.

🎯 Built using Flutter BLoC architecture.

🔐 Handles storage permissions gracefully.

🚀 Includes a simple splash screen animation (expandable).
-------------------------------------------------------------------------------------------------------------------

🛠️ Tech Stack
Flutter

Dart

BLoC (flutter_bloc)

pdf package for PDF generation

path_provider for file system access

permission_handler for runtime permissions

open_file to open the generated PDF directly from the app
--------------------------------------------------------------------------------------------------------------------

📁 Folder Structure
bash
Copy
Edit
lib/
├── main.dart               # App entry point
├── bloc/                   # Contains BLoC files (events, states, logic)
├── ui/                     # UI and widgets
├── utils/                  # PDF generation and file handling
android/
└── app/
    └── src/
        └── main/
            └── AndroidManifest.xml  # Permissions added

---------------------------------------------------------------------------------------------------------------------
📝 Usage
Run the app on an Android device.

Add item names and prices using the form.

Tap the ➕ icon to add them to the list.

Press Generate Invoice to create a PDF file.

The PDF will be saved and opened automatically.

 
 
