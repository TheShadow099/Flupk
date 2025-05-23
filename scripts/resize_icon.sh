set -e

ICON_PATH="uploads/icon.png"
RES_PATH="flutter_project/android/app/src/main/res"

mkdir -p $RES_PATH/mipmap-mdpi
mkdir -p $RES_PATH/mipmap-hdpi
mkdir -p $RES_PATH/mipmap-xhdpi
mkdir -p $RES_PATH/mipmap-xxhdpi
mkdir -p $RES_PATH/mipmap-xxxhdpi

convert "$ICON_PATH" -resize 48x48 "$RES_PATH/mipmap-mdpi/ic_launcher.png"
convert "$ICON_PATH" -resize 72x72 "$RES_PATH/mipmap-hdpi/ic_launcher.png"
convert "$ICON_PATH" -resize 96x96 "$RES_PATH/mipmap-xhdpi/ic_launcher.png"
convert "$ICON_PATH" -resize 144x144 "$RES_PATH/mipmap-xxhdpi/ic_launcher.png"
convert "$ICON_PATH" -resize 192x192 "$RES_PATH/mipmap-xxxhdpi/ic_launcher.png"
