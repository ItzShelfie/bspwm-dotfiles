# Dotfiles backup

Снимок конфигов **bspwm/X11**-десктопа на момент 2026-11-24. Структура повторяет домашнюю директорию: `.config/…`, `.local/bin/…`, `.xinitrc`.

Только то, что работает в текущей X11-сессии. Wayland-компоненты (waybar и т.п.) намеренно исключены.

## Что внутри

- `matugen/` — `config.toml`, шаблоны для kitty/polybar/bspwm/picom/fastfetch/cmatrix/starship и сгенерированные файлы
- `polybar/`, `kitty/`, `picom/`, `bspwm/`, `sxhkd/`, `rofi/`, `cava/`, `fastfetch/`, `fish/`
- `.xinitrc` — запуск `sxhkd` и `bspwm`
- `.local/bin/` — скрипты темы, обоев, буфера обмена, `cmatrix`, `fix-clock-root` и т.д.
- `starship.toml` — шаблон остался, но в fish не используется
- `state/current-wallpaper` — путь к последним обоям

## Заметки

- Файлы, сгенерированные Matugen (`wallpaper-colors.conf`, `colors.ini`, `colors.sh`, шейдер picom), включены как есть; при смене обоев они перегенерируются.
- Waybar-шаблон удалён и из `matugen/config.toml`, чтобы при применении темы не создавались Wayland-файлы.
- Из скриптов и `bspwmrc` вырезаны Wayland-ветки и `pkill waybar` — только X11-путь.
- Скриншот по `Super+Shift+S`: `maim -s` → 1280px, 256 цветов (палитра FFmpeg) → PNG ~230KB → clipboard с таргетом `image/png`. Размер меньше лимита одного X11-запроса (262144 байта), поэтому INCR-трансфер не используется и приложение не блокирует UI на ожидание кусков. Старые владельцы cleared через `pkill -x xclip` перед копированием. xsel не используется: он не поддерживает таргет `image/png` и обрезает бинарные данные.
- `gfetch` вместо абсолютной симлинки на `~/Documents/gfetch` скопирован как отдельный исполняемый файл.
- Секреты/токены не найдены.
- `~/.local/bin/fix-clock-root` требует `sudo`: чинит рассинхрон RTC/UTC на 3 часа.
- Скрипты `bspwm-double-border*` — старая, отменённая реализация двойного бордера; перед публикацией их можно удалить.

`MANIFEST.txt` содержит полный список файлов.
# bspwm-dotfiles
# bspwm-dotfiles
