module Floyd
  def self.run!(matrix_value, matrix_route)
    length = matrix_value.size

    (0...length).each do |k|
      (0...length).each do |i|
        (0...length).each do |j|
          if (matrix_value[i][k] + matrix_value[k][j]) < matrix_value[i][j]
            matrix_value[i][j] = matrix_value[i][k] + matrix_value[k][j]
            matrix_route[i][j] = matrix_route[i][k]
          end
        end
      end
    end
  end
end

