#!/bin/bash

# ============================================================
#  install.sh — установка budi на новую машину
# ============================================================

set -e

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="/usr/local/bin"

echo "Проект: $PROJECT_DIR"

# Проверка зависимостей
command -v at >/dev/null 2>&1 || { echo "Установите at: sudo dnf install at"; exit 1; }
command -v notify-send >/dev/null 2>&1 || { echo "Установите libnotify: sudo dnf install libnotify"; exit 1; }

# Запуск atd
sudo systemctl enable --now atd

# Симлинки
for f in budi budilist budidel budiinfo; do
    sudo ln -sf "$PROJECT_DIR/bin/$f" "$BIN_DIR/$f"
    sudo chmod +x "$PROJECT_DIR/bin/$f"
    echo "Установлено: $BIN_DIR/$f -> $PROJECT_DIR/bin/$f"
done

echo
echo "Готово. Проверьте: budiinfo"
