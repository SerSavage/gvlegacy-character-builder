# Gloria Victis Character Builder

Offline character builder for Gloria Victis, hosted on Render and integrated with Discord.

## 🚀 Quick Start

### 1. Deploy to Render (Static Site)

1. Push this repository to GitHub (see upload instructions below)
2. Go to [Render Dashboard](https://dashboard.render.com)
3. Click "New +" → "Static Site"
4. Connect your GitHub repository
5. Set:
   - **Name**: `gv-character-builder` (or your choice)
   - **Build Command**: (leave empty)
   - **Publish Directory**: `.` (root)
6. Click "Create Static Site"
7. Wait for deployment (takes ~2 minutes)
8. Copy your site URL (e.g., `https://your-app.onrender.com`)

### 2. Set Up Discord Bot

1. Go to [Discord Developer Portal](https://discord.com/developers/applications)
2. Click "New Application" → Name it → Create
3. Go to "Bot" section → Click "Add Bot"
4. Under "Token" → Click "Reset Token" → Copy the token
5. Enable these Privileged Gateway Intents:
   - ✅ Message Content Intent
6. Go to "OAuth2" → "URL Generator"
   - Scopes: `bot`
   - Bot Permissions: `Send Messages`, `Read Message History`
7. Copy the generated URL and open it to invite bot to your server

### 3. Deploy Bot to Render (Web Service)

1. In Render Dashboard → "New +" → "Web Service"
2. Connect your GitHub repository
3. Set:
   - **Name**: `gv-builder-bot` (or your choice)
   - **Environment**: `Python 3`
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `python discord-bot.py`
4. Add Environment Variables:
   - `DISCORD_BOT_TOKEN`: (paste your bot token)
   - `BUILDER_URL`: (paste your static site URL from step 1)
5. Click "Create Web Service"
6. Wait for deployment

## 📁 Project Structure

```
.
├── index.html              # Main builder page
├── index_files/            # CSS, JS, images
├── render.yaml             # Render config (optional)
├── static.json             # Static site config
├── discord-bot.py          # Discord bot code
├── requirements.txt        # Python dependencies
└── README.md               # This file
```

## 🤖 Discord Bot Commands

- `!builder` - Get the character builder link
- `!builderhelp` - Show help message

The bot will also respond to mentions of "builder" or "character builder" in messages.

## 📤 Uploading to GitHub

### Option 1: Using the Upload Script (Easiest)

1. Make sure Git is installed: https://git-scm.com/download/win
2. Run `upload-to-github.bat` in this folder
3. Follow the prompts

### Option 2: Using GitHub Desktop

1. Download GitHub Desktop: https://desktop.github.com/
2. File → Add Local Repository
3. Select this folder (`github-ready`)
4. Click "Publish repository"
5. Repository name: `gvlegacy-character-builder`
6. Make sure it's set to: `SerSavage/gvlegacy-character-builder`
7. Click "Publish Repository"

### Option 3: Manual Git Commands

```bash
cd github-ready
git init
git add .
git commit -m "Initial commit: Gloria Victis Character Builder"
git branch -M main
git remote add origin https://github.com/SerSavage/gvlegacy-character-builder.git
git push -u origin main
```

## 🔧 Local Development

### Test Discord Bot Locally

1. Create `.env` file from `env.example`
2. Add your Discord bot token
3. Install dependencies: `pip install -r requirements.txt`
4. Run: `python discord-bot.py`

### Test Static Site Locally

1. Use a local web server:
   ```bash
   # Python
   python -m http.server 8000

   # Node.js
   npx serve .
   ```
2. Open `http://localhost:8000` in your browser

## 📝 Notes

- The builder works completely offline (all assets are included)
- Render free tier: Static sites are always on, web services sleep after 15min inactivity
- For always-on bot, consider upgrading or using a different hosting service
- The static site has no cold starts and is always available

## 🆘 Troubleshooting

**Bot not responding?**
- Check bot is online in Discord
- Verify `DISCORD_BOT_TOKEN` is set correctly
- Check Render logs for errors

**Builder not loading?**
- Verify all files in `index_files/` are uploaded
- Check browser console for 404 errors
- Ensure `static.json` routes are correct

**Git upload issues?**
- Install Git: https://git-scm.com/download/win
- Or use GitHub Desktop (easier): https://desktop.github.com/
- For authentication, use Personal Access Token: https://github.com/settings/tokens

## 📄 License

This is an archived version of the Gloria Victis Character Builder.
Original source: gloriavictisgame.info

