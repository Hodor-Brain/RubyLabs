require 'matrix'

def generatet_matrix(n, k)
  Matrix.build(n, n) do |row_index, column_index|
    if row_index == column_index
      2
    else
      k + 2
    end
  end
end

def get_vector(n)
  Vector[Array.new(n) { |i| i + 1 }]
end

def print_matrix(matrix)
  array = matrix.to_a

  n = array.length
  m = array[0].length

  (0...n).each { |i|
    print("| ")
    (0...m).each { |j|
      printf("#{matrix[i, j]} ")
    }
    print("|\n")
  }
end

def Gauss_inverse_trace(matrix_a, n)
  x = Matrix.zero(1,n)

  (0..(n-1)).reverse_each { |i|
    sum = 0
    (i + 1...n).each { |j|
      sum += matrix_a[i][j].to_f * x[0, j]
    }
    x[0, i] = matrix_a[i][n].to_f - sum
  }
  Vector[x.to_a[0]]
end

def solve_Gauss(matrix, b)
  n = matrix.to_a.length

  print("Matrix:\n")
  print_matrix matrix
  print("\nValues vector:\n")
  print("#{b[0]}^T\n")
  print("\n")

  current_matrix = Matrix.hstack(matrix, Matrix.column_vector(b[0].to_a)).to_a

  (0...n).each { |k|
    (k + 1..n).each { |j|
      current_matrix[k][j] = current_matrix[k][j].to_f / current_matrix[k][k]
    }
    current_matrix[k][k] = 1

    (k + 1...n).each { |i|
      (k + 1..n).each { |j|
        current_matrix[i][j] = current_matrix[i][j].to_f - (current_matrix[i][k] * current_matrix[k][j])
      }
      current_matrix[i][k] = current_matrix[i][k].to_f - (current_matrix[i][k] * current_matrix[k][k])
    }
  }

  print_matrix(Matrix.rows(current_matrix))
  result = Gauss_inverse_trace(current_matrix, n)
  printf("\nResult: #{result}^T\n")
end

def main_function
  begin
    print("Enter n (3 -- 9):\n")
    n = gets.chomp.to_i
  end while n < 2 || n > 9

  matrix_a = generatet_matrix(n, 5)
  vector_b = get_vector n

  solve_Gauss(matrix_a, vector_b)
end

main_function
