module MatrixGenerator
  def self.matrix_value(vertices, edges)
    matrix_value = generate_base_matrix_from_labels(vertices)
    assings_values(matrix_value, vertices, edges)
  end

  def self.matrix_route(matrix_value, vertices)
    total_vertices = vertices.size

    (0...total_vertices).map do |i|
      (0...total_vertices).map do |j|
        matrix_value[i][j] == Float::INFINITY ? 0 : vertices[j]
      end
    end
  end

  private

  def self.assings_values(matrix_value, vertices, edges)
    edges.each do |edge|
      i = vertices.index edge[0]
      j = vertices.index edge[1]
      weight = edge[2].to_i
      matrix_value[i][j] = weight
    end

    matrix_value
  end

  def self.generate_base_matrix_from_labels(vertices)
    total_vertices = vertices.size

    (0...total_vertices).map do |i|
      (0...total_vertices).map { |j| i == j ? 0 : Float::INFINITY }
    end
  end
end

