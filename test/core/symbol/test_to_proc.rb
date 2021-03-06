covers 'facets/symbol/to_proc'

test_case Symbol do

  method :to_proc do

    test do
      x = (1..10).inject(&:*)
      x.assert == 3628800

      x = %w{foo bar qux}.map(&:reverse)
      x.assert == %w{oof rab xuq}

      x = [1, 2, nil, 3, nil].reject(&:nil?)
      x.assert == [1, 2, 3]

      x = %w{ruby and world}.sort_by(&:reverse)
      x.assert == %w{world and ruby}
    end

    test "call" do
      up = :upcase.to_proc
      up.assert.is_a?(Proc)
      up.call("hello").assert == "HELLO"
    end

    test "map" do
      q = [[1,2,3], [4,5,6], [7,8,9]].map(&:reverse)
      a = [[3, 2, 1], [6, 5, 4], [9, 8, 7]]
      q.assert == a
    end

  end

end
