# E.T. Radiator — Website & Admin Portal

Full website with customer booking portal and admin dashboard.

## Project Structure

```
et-radiator/
├── index.html              ← Main website
├── booking.html            ← Customer booking form
├── admin/
│   ├── index.html          ← Admin login page
│   └── dashboard.html      ← Booking management dashboard
├── supabase/
│   └── schema.sql          ← Database setup (run once)
├── netlify.toml
├── .gitignore
└── README.md
```

---

## Step 1 — Supabase Setup (do this first)

1. Go to [supabase.com](https://supabase.com) → **New project**
2. Name it `et-radiator`, set a strong database password, choose **ap-southeast-2** (Sydney)
3. Wait ~2 minutes for it to spin up
4. Go to **SQL Editor → New Query**, paste the contents of `supabase/schema.sql`, and click **Run**
5. Go to **Authentication → Users → Add User → Create new user**
   - Email: `cheng.thach@gmail.com`
   - Password: (choose something strong)
   - Check **Auto Confirm User**
6. Go to **Settings → API**, copy:
   - **Project URL** (looks like `https://xxxx.supabase.co`)
   - **anon public** key

7. In your code editor (Cursor), do **Find All** for `YOUR_SUPABASE_URL` and `YOUR_SUPABASE_ANON_KEY` and replace with your real values. They appear in:
   - `booking.html`
   - `admin/index.html`
   - `admin/dashboard.html`

---

## Step 2 — Git Setup

```bash
git init
git add .
git commit -m "init: ET Radiator website + booking portal"

# Create repo on GitHub → github.com/new → name: et-radiator
git remote add origin https://github.com/YOUR_USERNAME/et-radiator.git
git branch -M main
git push -u origin main
```

---

## Step 3 — Deploy to Netlify

1. [app.netlify.com](https://app.netlify.com) → **Add new site → Import from Git**
2. Choose **GitHub** → select `et-radiator`
3. Build command: *(blank)*  /  Publish directory: `.`
4. Click **Deploy site**

Every `git push` auto-deploys in ~30 seconds.

### Custom domain
1. Netlify → Domain management → Add domain: `etradiator.com.au`
2. Update nameservers at your registrar to Netlify's NS records
3. SSL auto-provisions (wait up to 2 hours for `.com.au`)

---

## Cursor Workflow

Open the project folder in Cursor. Useful search shortcuts:

| What to find | Search for |
|---|---|
| Contact details | `9625 4994` |
| Email | `cheng.thach` |
| Address | `Stout Rd` |
| Services list | `sv-grid` |
| Hours | `day-o` |
| Supabase keys | `YOUR_SUPABASE` |

---

## How Bookings Work

1. Customer visits `booking.html`, fills in the form, submits
2. Booking is saved to Supabase with status `pending`
3. You log in at `yourdomain.com.au/admin`
4. Dashboard shows all bookings — click any row for full details
5. You click **Confirm Booking** → status changes to `confirmed`
6. After the job is done → click **Mark Complete**

---

## What to Customise

| Item | File & Search Term |
|---|---|
| Phone number | All files → `9625 4994` |
| Email address | All files → `cheng.thach` |
| Address | `index.html` → `Stout Rd` |
| Business hours | `index.html` → `hrs` table |
| Year established | `index.html` → `2003` |
| Mechanic count | `index.html` → `3` |
| Accent colour (blue) | `index.html` → `--blue: #4A8CFF` |
| Services list | `index.html` → `sv-grid` section |
