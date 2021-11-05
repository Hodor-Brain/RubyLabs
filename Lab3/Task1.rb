A = false
B = false
C = true

X = 1
Y = 16
Z = -40

#Variant 8

def first
  printf("\na) !(A  B)  (A  !B): #{!(A || B) && (A && !B)}\n")
  printf("b) (Z != Y) ≤ (6 ≥ Y)  A  B  C  X ≥ 1.5: #{(Z != Y).object_id <= (6 >= Y).object_id && A || B && C && X >= 1.5}\n")
  printf("c) (8 – X * 2 ≤ Z)  (X^2 >= Y^2))  (Z ≥ 15): #{(8 - X * 2 <= Z) && (X ** 2 >= Y ** 2) || (Z >= 15)}\n")
  printf("d) X > 0  Y < 0  Z ≥ (X*Y + (–Y/X))+(–Z)*(–2): #{X > 0 && Y < 0 || Z >= (X * Y + (-Y / X)) + (-Z) * (-2)}\n")
  printf("g) !(A  B  !(C  (!A  B))): #{!(A || B && !(C || (!A || B)))}\n")
  printf("h) X^2 + Y^2 ≥ 1  X ≥ 0  Y ≥ 0: #{X ** 2 + Y ** 2 >= 1 && X >= 0 && Y >= 0}\n")
  printf("i) (A  (C  B <> B  A)  C)  B: #{(A && (C && B != B || A) || C) && B}\n")
end

first()

P = true
Q = true

def second
  n = -2
  m = 1
  printf("\n((Р и Q) = не(не P или не Q) и (sqr(m)+sqr(n)<4) и (m+n<1): #{((P && Q) == !(!P || !Q) && (m ** 2 + n ** 2 < 4) && (m + n < 1))}")
end

second()
