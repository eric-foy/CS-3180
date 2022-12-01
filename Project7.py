# Eric Foy

# Your program must have at least one defined class "Student" to hold a student
# record, a method addClass, and an iterator method. You may define more
# classes and methods as you need.
class Student:
    # Create a new student object.
    # Parameters:
    # uid - user id
    # first - first name
    # last - last name
    # level - grad or undergrad
    def __init__(self, uid, first, last, level):
        self.uid = uid
        self.first = first
        self.last = last
        self.level = level
        self.classes = []
        self.index = 0

    # Used in the call to iter() to iterate over classes.
    # Returns: self
    # Parameters: None
    def __iter__(self):
        return self

    # Used in the iteration of classes to get next class.
    # Returns: next class
    # Parameters: None
    def __next__(self):
        if self.index == len(self.classes):
            raise StopIteration
        o = self.classes[self.index]
        self.index = self.index + 1
        return o

    # A string representation of a Student object.
    # Returns: string representation of a student
    # Parameters: None
    def __str__(self):
        a = 'UID: {}\n'.format(self.uid)
        b = 'First Name: {}\n'.format(self.first)
        c = 'Last Name: {}\n'.format(self.last)
        d = 'Level: {}\n'.format(self.level)
        e = 'CLASSES:\n'
        o = a + b + c + d + e
        self.index = 0
        for i in iter(self):
            o += '{}\n'.format(i)
        f = '-----------\n'
        return o + f + f

    # Add a class
    # Returns: self
    # Parameters:
    # c - class to add
    def addClass(self, c):
        self.classes += [c]
        return self

# When executed, your program should look for the file studentRecordsIn.txt
# (provided) in the same directory as your main program script. It should load
# the list of records from this file. If this file is not present, your program
# should exit gracefully (with a message).
students = []
try:
    f = open('studentRecordsIn.txt', 'r')
    lines = f.read().split('\n')

    # Each line is a full student record with the last words are for the
    # classes:
    # Student record order: UID, FIRST, LAST, LEVEL, CLASSES 
    for line in lines:
        line = line.replace(' ', '\t')
        d = line.split('\t')
        d = [x for x in d if x != '']
        s = Student(d[0], d[1], d[2], d[3])
        for i in d[4:]:
            s.addClass(i)
        students += [s]
    f.close()
except FileNotFoundError:
    print('studentRecordsIn.txt not found')
    exit()

# After reading records, your program should output the data to the console.
print('Student Records')
print('===============')
print('')
for i in students:
    print(i)

# Then print the output to text file studentRecordsOut.txt in the same format
# and save it in the same directory.
f = open('studentRecordsOut.txt', 'w')
f.write('Student Records\n')
f.write('===============\n')
f.write('\n')
for i in students:
    f.write(str(i))
    f.write('\n')
f.close()
