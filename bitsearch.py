def search_bits(filename, d):
    c = (0xF - d) << 4
    d = d << 4
    g = [c]
    e = [d]
    for i in range(0, 4):
        c = c >> 1
        d = d >> 1
        g.append(c)
        e.append(d)

    print(list(map(hex, e)))
    f = open(filename, "r")
    l = f.read()
    f.close()
    c = 0
    p = ''
    for i in l:
        for j in range(0, len(g)):
            if ((ord(i) & e[j] == e[j]) and (ord(i) & g[j] == 0)):
                print(hex(c), "^", j)
        if (p != ''):
            a = (ord(p) & 0x0f) << 4
            b = (ord(i) & 0xf0) >> 4
            b = a | b
            for j in range(0, len(g)):
                if ((b & e[j] == e[j]) and (b & g[j] == 0)):
                    print(hex(c - 1), "^", j + 4)
        c += 1
        p = i

def file_as_bits(filename):
    o = ""
    f = open(filename, "r")
    while True:
        b = f.read(1)
        if b == '':
            break
        o += format(ord(b), '08b')
    f.close()
    return o
