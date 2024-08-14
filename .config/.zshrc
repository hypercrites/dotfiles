# Add this

# Tastatur
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# please is a "sudo !!" alias
alias please='sudo $(fc -ln -1)'
alias bitte='sudo $(fc -ln -1)'
alias mach='sudo $(fc -ln -1)'

# Remove package
alias yeet="sudo pacman -Rns"

# Kram
alias neolol="neofetch | lolcat"
alias lolfetch="neofetch | lolcat"
alias wetter="curl -s 'wttr.in/Boizenburg?format=3'"
alias fetch="clear && fastfetch"
alias server="ssh stunner@serv.er -p ##"
alias q="exit"
alias pong="ping -c 4"

#yt-dlp
alias ytaudio="yt-dlp -P '~/Musik/yt-dlp' -o '%(title)s-%(id)s.%(ext)s' -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --parse-metadata '%(uploader|)s:%(meta_artist)s' --embed-metadata --sponsorblock-remove all --no-abort-on-error --geo-bypass --cookies-from-browser firefox"
alias ytvideo="yt-dlp -P '~/Videos/yt-dlp' -o '%(title)s-%(id)s.%(ext)s' -f 'bv*+ba/b' --merge-output-format 'mp4' --sponsorblock-remove all --no-abort-on-error --geo-bypass --cookies-from-browser firefox"
