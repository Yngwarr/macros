BEGIN {
    dont_print = 0;
    skip_line = 0;
}

match($0, /\/\/! version = ([0-9]+)/, xs) {
    skip_line = 1;

    if (xs[1] != version || dont_print > 0) {
        dont_print++;
    }
}

/\/\/! 2mb/ {
    skip_line = 1;

    if (size != 2 || dont_print > 0) {
        dont_print++;
    }
}

/\/\/! end/ {
    skip_line = 1;
    if (dont_print > 0) {
        dont_print--;
    }
}

dont_print == 0 && !skip_line { print }
skip_line { skip_line = 0 }
