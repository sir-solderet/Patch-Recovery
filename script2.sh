#!/bin/bash

set -e
echo "🔧 Starting script2.sh..."

# Set working directories
WORKDIR=$(pwd)
UNPACK_DIR="${WORKDIR}/unpack"
MAGISKBOOT="${WORKDIR}/magiskboot"

# Create and enter unpack directory
mkdir -p "$UNPACK_DIR"
cd "$UNPACK_DIR"

# Unpack recovery image
echo "📦 Unpacking r.img..."
"$MAGISKBOOT" unpack ../r.img

echo "📂 Extracting ramdisk..."
"$MAGISKBOOT" cpio ramdisk.cpio extract

# Hexpatch system/bin/recovery
echo "🩹 Applying hexpatches..."
RECOVERY_BIN="system/bin/recovery"
PATCHES=(
  "e10313aaf40300aa6ecc009420010034 e10313aaf40300aa6ecc0094"
  "eec3009420010034 eec3009420010035"
  "3ad3009420010034 3ad3009420010035"
  "50c0009420010034 50c0009420010035"
  "080109aae80000b4 080109aae80000b5"
  "20f0a6ef38b1681c 20f0a6ef38b9681c"
  "23f03aed38b1681c 23f03aed38b9681c"
  "20f09eef38b1681c 20f09eef38b9681c"
  "26f0ceec30b1681c 26f0ceec30b9681c"
  "24f0fcee30b1681c 24f0fcee30b9681c"
  "27f02eeb30b1681c 27f02eeb30b9681c"
  "b4f082ee28b1701c b4f082ee28b970c1"
  "9ef0f4ec28b1701c 9ef0f4ec28b9701c"
  "9ef00ced28b1701c 9ef00ced28b9701c"
  "2001597ae0000054 2001597ae1000054"
  "24f0f2ea30b1681c 24f0f2ea30b9681c"
  "41010054a0020012f44f48a9 4101005420008052f44f48a9"
)

for patch in "${PATCHES[@]}"; do
  before=$(echo "$patch" | cut -d' ' -f1)
  after=$(echo "$patch" | cut -d' ' -f2)
  echo "  • Patching $before → $after"
  "$MAGISKBOOT" hexpatch "$RECOVERY_BIN" "$before" "$after"
done

# Repack ramdisk
echo "📦 Repacking recovery binary into ramdisk..."
"$MAGISKBOOT" cpio ramdisk.cpio "add 0755 $RECOVERY_BIN $RECOVERY_BIN"

# Repack full image
echo "📦 Repacking patched recovery image..."
"$MAGISKBOOT" repack ../r.img new-boot.img
cp new-boot.img ../recovery-patched.img

echo "✅ script2.sh completed."
