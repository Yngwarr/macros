function log(obj) {
    console.log(JSON.stringify(obj, null, 2));
}

const PATH_SEP = '/';
const TAG_SEP = '+';
const EXT_SEP = '.';

function last(xs) {
    return xs[xs.length - 1];
}

function extractTags(fname) {
    if (!fname.includes(TAG_SEP)) return { name: fname, tags: [] };
    
    const tags = fname.split(TAG_SEP);
    const last_tag = last(tags);
    let ext = '';
    let name = tags[0] === '' ? '.' : tags[0];

    if (last_tag.includes(EXT_SEP)) {
        const sep_loc = last_tag.lastIndexOf(EXT_SEP);
        ext = last_tag.slice(sep_loc);
        tags[tags.length - 1] = last_tag.slice(0, sep_loc);
    }

    tags.shift();

    return { name: `${name}${ext}`, tags };
}

function hasAll(a, b) {
    for (const x of a) {
        if (!b.includes(x)) return false;
    }
    return true;
}

function main() {
    if (scriptArgs.length < 2) {
        console.log('Usage: test-tags.js path ...tags');
        return -1;
    }

    const argv = scriptArgs;
    argv.shift();

    const path = argv[0];
    let meta = path.split(PATH_SEP).map(extractTags);
    const name = meta.map(x => x.name).join(PATH_SEP);
    const tags = Array.from(meta.reduce((a, b) => {
        b.tags.forEach(x => a.push(x));
        return a;
    }, []));

    const features = argv;
    features.shift();

    console.log(hasAll(tags, features) ? name : '');
}

main();
