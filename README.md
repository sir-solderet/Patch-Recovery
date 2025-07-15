# Patch-Recovery for Samsung Galaxy Tab A9 (GTA9)

This repository provides a patched recovery image for the Samsung Galaxy Tab A9 (GTA9). It is intended to be flashed using Odin on a Windows PC.

---

## 📲 Device Info

- **Device Name:** Samsung Galaxy Tab A9
- **Codename:** gta9
- **Model Variants:** SM-X110 / SM-X115

---

## 📁 Files Provided

- `recovery.img` – The raw recovery image
- `recovery.tar.md5` – Odin-flashable recovery image

---

## ⚠️ Disclaimer

> Flashing custom recovery images may void your warranty and could potentially brick your device.  
> Proceed at your own risk and always make sure you know what you're doing.

---

## 🛠 Requirements

- Windows PC
- [Samsung USB Drivers](https://developer.samsung.com/mobile/android-usb-driver.html)
- [Odin Tool (v3.14.1 or newer)](https://samfw.com/blog/download-odin-all-version)
- USB cable
- Samsung Galaxy Tab A9 with **OEM Unlock** enabled

---

## 🔓 Enable OEM Unlocking

1. Go to **Settings > About tablet > Software information**
2. Tap **Build number** 7 times to enable Developer Options
3. Go back and open **Developer options**
4. Enable **OEM unlocking**

---

## 🚀 Flashing Instructions (Using Odin)

### 1. Boot Device into Download Mode

- Power off the device completely  
- Press and hold **Volume Up + Volume Down**, then plug in the USB cable  
- Once on the warning screen, press **Volume Up** to enter **Download Mode**

### 2. Flash Recovery Using Odin

1. Open **Odin** on your PC
2. Connect your device via USB — Odin should detect it (e.g. show `COMx`)
3. Click the **AP** button and select the `recovery.tar.md5` file
4. **IMPORTANT:** Uncheck **Auto Reboot** in the Options tab
5. Click **Start** to begin flashing

### 3. Boot into Recovery Immediately

- Once flashing is complete and Odin shows **PASS**, disconnect the device  
- Press and hold **Power + Volume Up** until the Samsung logo appears  
- This will boot into the newly flashed recovery

---

## ✅ Verifying Recovery

If successful, you will now see the Patch recovery interface.  
From here, you can:
- Enter Fastbootd
- And all the normal stock recovery functions

---

## 🧰 Tips

- **Do not let the device boot into the system after flashing recovery**, or it may be overwritten. **Flash magisk patched boot.img**, it will not let the system overwrite the patched recovery.
- You can convert `.img` to `.tar.md5` using tools like `tar` and `md5sum` or Samsung-specific utilities (available via community tools).

---
