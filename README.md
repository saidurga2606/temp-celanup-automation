# 🧹 Temp Cleanup Automation

This project automates the deletion of temporary and junk files on a Windows system using PowerShell and n8n.

---

## 🚀 Features

- Deletes temp files automatically
- Clears Windows temp directories
- Empties recycle bin
- Runs on a schedule (daily/hourly)
- Sends email notification after cleanup
- Simple and lightweight automation

---

## 🛠️ Technologies Used

- PowerShell
- n8n (workflow automation)
- SMTP (Gmail for email alerts)

---

## ⚙️ How It Works

1. Schedule Trigger starts the workflow
2. PowerShell script runs and cleans temp files
3. System junk files are removed
4. Email notification is sent to the user

---

## 📂 Project Files

- `cleanup.ps1` → PowerShell script for cleanup
- `temp-cleanup-workflow.json` → n8n workflow

---

## 📸 Workflow Overview

Schedule Trigger → Execute Command → Send Email

---

## ✉️ Email Notification

After cleanup, an email is sent with:
- Status of cleanup
- Time of execution

---

## 💻 Setup Instructions

1. Clone the repository
2. Install n8n
3. Import the workflow JSON file
4. Configure SMTP (Gmail App Password)
5. Run the workflow

---

## 📌 Example Use Case

- Automatically clean system junk daily
- Free up disk space
- Maintain system performance

---

## 🧑‍💻 Author

Your Name

---

## ⭐ Project Status

Completed ✅
