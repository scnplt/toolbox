#!/usr/bin/env bash
set -ex

STATUS="🚫 Fail"
if [ $BITRISE_BUILD_STATUS -eq 0 ]; then STATUS="✅ Successful"; fi

MESSAGE="Build Status: $STATUS
Workflow: $BITRISE_TRIGGERED_WORKFLOW_TITLE
Module: $XMODULE
Version Name: $ANDROID_VERSION_NAME
Version Code: $ANDROID_VERSION_CODE

============================

$BITRISE_PUBLIC_INSTALL_PAGE_URL_MAP"

curl -X POST -H "Content-Type: application/json" --data '
        {"chat_id":"'"$TELEGRAM_CHAT_ID"'",
        "text":"'"$MESSAGE"'",
        "parse_mode":"html",
        "disable_web_page_preview":true
        }' "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" -w "\n"