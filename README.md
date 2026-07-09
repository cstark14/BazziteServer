# 🎮 Bazzite Integration Server

A FastAPI server that integrates your Bazzite gaming PC with Home Assistant!

It provides:

✅ Game detection  
✅ CPU temperature monitoring  
✅ Remote shutdown & sleep commands  
✅ WebSocket-based push updates

---

## ⚡️ Quickstart (recommended)

On your Bazzite PC:

```bash
git clone https://github.com/Tijgerd/bazzite-server.git
cd bazzite-server
chmod +x install.sh
./install.sh
```

The installer now upgrades pip/setuptools/wheel first and lets pip resolve FastAPI's compatible Pydantic packages, which avoids the Python 3.14 `pydantic_core` build failure.

It also writes your actual clone path into the user systemd service, so the service works even if the repository is not cloned to `~/bazzite-server`.

After starting, the server will listen on:
ws://YOUR-PC-IP:5000/ws
