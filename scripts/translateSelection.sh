#!/bin/bash

clipboard_content=$(xclip -o)
firefox --new-tab "https://translate.google.com/?sl=auto&tl=ar&text=$clipboard_content&op=translate"

