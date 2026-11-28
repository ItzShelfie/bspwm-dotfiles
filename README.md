# Dotfiles backup

Снимок конфигов **bspwm/X11**-десктопа на момент 2026-11-28. Структура повторяет домашнюю директорию: `.config/…`, `.local/bin/…`, `.xinitrc`.

Только то, что работает в текущей X11-сессии. Wayland-компоненты (waybar и т.п.) намеренно исключены.

## Что внутри

- `matugen/` — `config.toml`, шаблоны для kitty/polybar/bspwm/picom/fastfetch/cmatrix/starship и сгенерированные файлы
- `polybar/`, `kitty/`, `picom/`, `bspwm/`, `sxhkd/`, `rofi/`, `cava/`, `fastfetch/`, `fish/`
- `.xinitrc` — запуск `sxhkd` и `bspwm`
- `.local/bin/` — скрипты темы, обоев, буфера обмена, `cmatrix`, `obs-audio-route`, `fix-clock-root` и т.д.
- `starship.toml` — шаблон остался, но в fish не используется
- `state/current-wallpaper` — путь к последним обоям

## Заметки

- Файлы, сгенерированные Matugen (`wallpaper-colors.conf`, `colors.ini`, `colors.sh`, шейдер picom), включены как есть; при смене обоев они перегенерируются.
- Waybar-шаблон удалён и из `matugen/config.toml`, чтобы при применении темы не создавались Wayland-файлы.
- Из скриптов и `bspwmrc` вырезаны Wayland-ветки и `pkill waybar` — только X11-путь.
- Скриншот по `Super+Shift+S`: `maim -s` → 1920px, 64 цвета, без дизеринга → PNG ~230KB → clipboard с таргетом `image/png`. Полное разрешение сохранено, убраны шум дизеринга и INCR-трансфер (лимит одного X11-запроса 262144 байта). Старые владельцы cleared через `pkill -x xclip` перед копированием. xsel не используется: он не поддерживает таргет `image/png` и обрезает бинарные данные.
- Матуген: схема `scheme-fidelity` выбирается только если ≥8% пикселей реально насыщены (spread ≥40 и S ≥0.5). Для ч/б обоев вместо `matugen image` используется `matugen color hex <серый>` с `scheme-fidelity`: иначе Matugen подставляет свой fallback `#4285f4` и даёт синий акцент. Серый ограничен `#b0b0b0` сверху, почти белые цвета (`S<0.08, V>0.9`) не участвуют в выборе акцента.
- `obs-audio-route`: виртуальный микшер `obs-stream-mix` + loopback на USB-выход с задержкой 50 мс. Discord идёт на колонки мимо микшера, OBS слушает `obs-stream-mix.monitor` (источник `Desktop Audio (no Discord)`). Запускается из `bspwmrc`, следит за новыми аудиопотоками через `pactl subscribe`.
- В `bspwmrc` бэкапа намеренно нет строки `pkill -x waybar` — только X11-путь.
- `gfetch` вместо абсолютной симлинки на `~/Documents/gfetch` скопирован как отдельный исполняемый файл.
- Секреты/токены не найдены.
- `~/.local/bin/fix-clock-root` требует `sudo`: чинит рассинхрон RTC/UTC на 3 часа.
- Скрипты `bspwm-double-border*` — старая, отменённая реализация двойного бордера; перед публикацией их можно удалить.

`MANIFEST.txt` содержит полный список файлов.
# bspwm-dotfiles
# bspwm-dotfiles
