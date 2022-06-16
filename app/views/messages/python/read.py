import fileinput

for line in fileinput.input():
    print('Output:', line.rstrip())