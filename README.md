# Flupk - Flutter to APK Builder

Upload your `project.zip` and `icon.png` to the `uploads/` folder. Trigger GitHub Actions manually with your app name and package name. The system will:

1. Generate `android/` folder automatically
2. Apply your app name and package name
3. Resize your app icon
4. Build Release APK
5. Upload APK as GitHub artifact
6. Delete files after 20 minutes
7. 
