set -e

APP_NAME="$1"
PACKAGE_NAME="$2"

APP_NAME=${APP_NAME:-Flupk App}
PACKAGE_NAME=$(echo "$PACKAGE_NAME" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9.]/./g' | sed 's/\.\+\././g' | sed 's/^\.//;s/\.$//')

echo "Using app name: $APP_NAME"
echo "Using package name: $PACKAGE_NAME"

cd flutter_project
flutter create . --platforms android

# Update AndroidManifest & build.gradle
MANIFEST="android/app/src/main/AndroidManifest.xml"
STRINGS="android/app/src/main/res/values/strings.xml"
BUILD_GRADLE="android/app/build.gradle"

# Replace default package name
sed -i "s/package=\"[^"]*\"/package=\"$PACKAGE_NAME\"/g" $MANIFEST

# Replace app name
sed -i "s/<string name=\"app_name\">[^<]*<\/string>/<string name=\"app_name\">$APP_NAME<\/string>/g" $STRINGS

# Update applicationId
sed -i "s/applicationId \"[^"]*\"/applicationId \"$PACKAGE_NAME\"/g" $BUILD_GRADLE

# Rename directory to match package structure
PACKAGE_DIR="android/app/src/main/kotlin/$(echo $PACKAGE_NAME | sed 's/\./\//g')"
mkdir -p "$PACKAGE_DIR"
MAIN_KT="$PACKAGE_DIR/MainActivity.kt"

cat > "$MAIN_KT" <<EOF
package $PACKAGE_NAME

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {}
EOF

rm -rf android/app/src/main/kotlin/*
mv "$PACKAGE_DIR" android/app/src/main/kotlin/
