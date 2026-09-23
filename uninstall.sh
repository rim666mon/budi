#!/bin/bash

# ============================================================
#  uninstall.sh — удаление симлинков budi
# ============================================================

BIN_DIR="/usr/local/bin"

for f in budi budilist budidel budiinfo; do
    if [ -L "$BIN_DIR/$f" ]; then
        sudo rm "$BIN_DIR/$f"
        echo "Удалено: $BIN_DIR/$f"
    fi
done

echo "Готово."
