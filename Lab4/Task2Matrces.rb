require 'matrix'

def get_random_matrix(n, m)
  Matrix.build(n, m) { rand(10) }
end

def get_random_vector(n)
  Vector[Array.new(n) { rand(10) }]
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

def task_fourth
  matrix_a = get_random_matrix(8, 8)
  matrix_b = get_random_matrix(8, 8)

  matrix_mult = matrix_a * matrix_b
  printf("Fourth task (matrix multiplication):\nMatrix A:\n")
  print_matrix(matrix_a)
  printf("\nMatrix B:\n")
  print_matrix(matrix_b)
  printf("\nMatrix multiplication:\n")
  print_matrix(matrix_mult)
  print("\n\n")
end

def task_sixth
  vector_x = get_random_vector(8)
  vector_y = get_random_vector(8)

  product = 0
  vector_x.each_with_index do |_, i|
    vector_x[i].each_index do |j|
      product += vector_x[i][j] * vector_y[i][j]
    end
  end

  printf("Sixth task (vector inner mult.):\nVector X: #{vector_x}
Vector Y: #{vector_y}
Product: #{product}\n\n")
end

def task_ninth
  vector_x = get_random_vector(8).to_a[0]
  matrix = get_random_matrix(8, 8)
  matrix_a = matrix.to_a

  result = []

  matrix_a.each_with_index do |matrix_element, _|
    element = 0
    vector_x.each_with_index do |vector_element, j|
      element += matrix_element[j] * vector_element
    end
    result.append(element)
  end

  result = Vector[result]

  printf("Ninth task (matrix by vector):\nMatrix:\n")
  print_matrix(matrix)
  printf("\nVector: #{vector_x}^T\nResult: #{result}^T")
end

task_fourth
task_sixth
task_ninth