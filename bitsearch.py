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

    print(g)
    print(e)
    f = open(filename, "r")
    l = f.read()
    f.close()
    c = 0
    for i in l:
        for j in range(0, len(g)):
            if ((ord(i) & e[j] == e[j]) and (ord(i) & g[j] == 0)):
                print(hex(c), "^", j)
        c += 1

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
