saved_stty=$(stty -g)

cleanup() {
    stty "$saved_stty"
    trap - INT TERM EXIT TSTP
    exit
}

trap cleanup INT TERM EXIT

trap '' TSTP

stty -icanon -echo

SIZE=$(stty size) tui/main.scm

cleanup
