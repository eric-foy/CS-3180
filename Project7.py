class Student:
    def __init__(self, uid, first, last, level, classes):
        self.uid = uid
        self.first = first
        self.last = last
        self.level = level
        self.classes = classes
        self.index = 0

    def __iter__(self):
        return self

    def __next__(self):
        if self.index == len(self.classes):
            raise StopIteration
        o = self.classes[self.index]
        self.index = self.index + 1
        return o

    def __str__(self):
        a = 'UID: {}\n'.format(self.uid)
        b = 'First Name: {}\n'.format(self.first)
        c = 'Last Name: {}\n'.format(self.last)
        d = 'Level: {}'.format(self.level)
        return a + b + c + d

    def reset(self):
        self.index = 0

students = []
try:
    f = open('studentRecordsIn.txt', 'r')
    lines = f.read().split('\n')
    for line in lines:
        d = line.split('\t')
        d = [x for x in d if x != '']
        students += [Student(d[0], d[1], d[2], d[3], d[4:])]
    f.close()
except FileNotFoundError:
    print('studentRecordsIn.txt not found')
    exit()

print('Student Records')
print('===============')
print('')
for i in students:
    print(i)
    print('CLASSES:')
    for j in iter(i):
        print(j)
    print('-----------')
    print('-----------')
    print('')

f = open('studentRecordsOut.txt', 'w')
f.write('Student Records\n')
f.write('===============\n')
f.write('\n')
for i in students:
    f.write(str(i))
    f.write('\n')
    i.reset()
    f.write('CLASSES:\n')
    for j in iter(i):
        f.write(j)
        f.write('\n')
    f.write('-----------\n')
    f.write('-----------\n')
    f.write('\n')
f.close()
