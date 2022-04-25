BEGIN {
    print_it = 1;
    skip_line = 0;
}

match($0, /\/\/! version = ([0-9]+)/, xs) {
    skip_line = 1;

    if (xs[1] != version) {
        print_it = 0;
    }
}

/\/\/! 2mb/ {
    skip_line = 1;

    if (size != 2) {
        print_it = 0;
    }
}

/\/\/! end/ {
    skip_line = 1;
    print_it = 1;
}

print_it == 1 && !skip_line { print }
skip_line { skip_line = 0 }
