# Transfer your input character into the corresponding string
	.data
A: .asciiz "Alpha"
B1: .asciiz "Bravo"
C: .asciiz "China"
D: .asciiz "Delta"
E: .asciiz "Echo"
F: .asciiz "Foxtrot"
G: .asciiz "Golf"
H: .asciiz "Hotel"
I: .asciiz "India"
J1: .asciiz "Juliet"
K: .asciiz "Kilo"
L: .asciiz "Lima"
M: .asciiz "Mary"
N: .asciiz "November"
O: .asciiz "Oscar"
P: .asciiz "Paper"
Q: .asciiz "Quebec"
R: .asciiz "Research"
S: .asciiz "Sierra"
T: .asciiz "Tango"
U: .asciiz "Uniform"
V: .asciiz "Victor"
W: .asciiz "Whisky"
X: .asciiz "X-ray"
Y: .asciiz "Yankee"
Z: .asciiz "Zulu"
a: .asciiz "alpha"
b1: .asciiz "bravo"
c: .asciiz "china"
d: .asciiz "delta"
e: .asciiz "echo"
f: .asciiz "foxtrot"
g: .asciiz "golf"
h: .asciiz "hotel"
i: .asciiz "india"
j1: .asciiz "juliet"
k: .asciiz "kilo"
l: .asciiz "lima"
m: .asciiz "mary"
n: .asciiz "november"
o: .asciiz "oscar"
p: .asciiz "paper"
q: .asciiz "quebec"
r: .asciiz "research"
s: .asciiz "sierra"
t: .asciiz "tango"
u: .asciiz "uniform"
v: .asciiz "victor"
w: .asciiz "whisky"
x: .asciiz "x-ray"
y: .asciiz "yankee"
z: .asciiz "zulu"
first: .asciiz "First"
second: .asciiz "Second"
third: .asciiz "third"
fourth: .asciiz "Fourth"
fifth: .asciiz "Fifth"
sixth: .asciiz "Sixth"
seventh: .asciiz "Seventh"
eighth: .asciiz "Eighth"
ninth: .ascii "Ninth"
zero: .asciiz "Zero"
star: .word '*'
new_line: .asciiz "\n"
prompt: .asciiz "Please enter any alphabetic letter or single number, enter ? to exit."
.align 2
list: .word A, B1, C, D, E, F, G, H, I, J1, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z, a, b1, c, d, e, f, g, h, i, j1, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, zero, first, second, third, fourth, fifth, sixth, seventh, eighth, ninth

	.text
main:

la $a0, prompt
li $v0, 4
syscall # print new line
read:
la $a0, new_line
li $v0, 4
syscall # print new line
li $v0, 12
syscall #read a character
move $v1, $v0
la $a0, new_line
li $v0, 4
syscall # print new line
beq $v1, 63, endloop # if == ?, endloop
ble $v1, 47, print_star # if < 47, print_star
ble $v1, 57, print_num # if < 57, print_num
ble $v1, 64, print_star
ble $v1, 90, print_char_upper # if < 90, print_char
ble $v1, 96, print_star
ble $v1, 122, print_char_lower
j print_star # if > 122, print_star

print_char_upper:
	subi $v1, $v1, 65
	mul $v1, $v1, 4
	lw $a0, list($v1)
	li $v0, 4
	syscall
	j read
print_char_lower:
	subi $v1, $v1, 97
	addi $v1, $v1, 26
	mul $v1, $v1, 4
	lw $a0, list($v1)
	li $v0, 4
	syscall
	j read
print_num:
	subi $v1, $v1, 48
	addi $v1, $v1, 52
	mul $v1, $v1, 4
	lw $a0, list($v1)
	li $v0, 4
	syscall
	j read
print_star:
	li $v0, 11
	lw $a0, star
	syscall
	j read
endloop:
	li $v0, 10
	syscall
