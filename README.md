SecUnit: Campus Safety App
<!-- Replace with the direct URL to your new logo -->

SecUnit is a comprehensive Flutter-based mobile application designed to enhance personal safety for students on a university campus. It combines essential security features with a user-friendly interface to create an all-in-one campus companion.

✨ Features

SecUnit is packed with tools to keep you safe and informed:

🤖 AI Safety Chatbot
Get instant answers to safety-related questions. The chatbot responds to keywords like "SOS", "escort", "report", "unsafe", and more, providing immediate guidance.

👤 User Profiles
Create a personal profile with your name, student ID, profile picture, and an emergency contact number.

🆘 Emergency Contacts
Maintain a dedicated list of emergency contacts who can be quickly reached in urgent situations.

📚 Safety Resources
Access a curated list of important campus resources, including security, health services, and counseling contacts.

🎨 Professional UI with Dark Mode
Enjoy a clean, modern, and intuitive interface with both light and dark themes for comfortable viewing in any lighting condition.

🚀 Getting Started

Follow these steps to get a local copy up and running.

Prerequisites

Flutter SDK installed on your machine.
Official Flutter installation guide

Installation & Setup

Clone the repository

git clone https://github.com/svm00/secunit.git
cd secunit


Install dependencies

flutter pub get


Generate App Icons (Optional)
If you updated the app icon at assets/icon/icon.png:

flutter pub run flutter_launcher_icons:main


Run the Application

flutter run

📦 Key Packages Used

provider – State management, especially for toggling between light and dark themes.

shared_preferences – Persist user profile data, settings, and emergency contacts locally.

image_picker – Pick images from the device gallery for profile photos.

flutter_launcher_icons – Generate launcher icons for multiple platforms.

🤝 Contributing

Contributions are what make the open-source community amazing. Any help is greatly appreciated!

Fork the repository

Create your feature branch: git checkout -b feature/YourFeature

Commit your changes: git commit -m 'Add some feature'

Push to the branch: git push origin feature/YourFeature

Open a pull request

You can also open an issue with the enhancement tag if you have ideas or suggestions.
