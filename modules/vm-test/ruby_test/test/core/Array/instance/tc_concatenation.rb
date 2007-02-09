##########################################################
# tc_concatenation.rb
#
# Test suite for the Array#+ instance method.
##########################################################
require "test/unit"

class TC_Array_Concatenation_Instance < Test::Unit::TestCase
   def setup
      @array1 = [1,2,3]
      @array2 = ["hello", "world"]
      @array3 = [true, false, nil]
   end

   def test_concatentation_method_exists
      assert_respond_to(@array1, :+)
   end

   def test_concatenation_basic
      assert_nothing_raised{ @array1 + @array2 }
      assert_nothing_raised{ @array1 + @array3 }
      assert_nothing_raised{ @array1 + @array2 + @array3 }

      assert_equal([1, 2, 3, "hello", "world"], @array1 + @array2)
      assert_equal([1, 2, 3, true, false, nil], @array1 + @array3)

      assert_equal([1, 2, 3, "hello", "world", true, false, nil],
         @array1 + @array2 + @array3
      )
   end

   # Ensure that a new array is created when two or more arrays are
   # concatenated, and that the originals are unchanged.
   def test_concatenation_new_array
      assert_nothing_raised{ @array1 + @array2 }
      assert_equal([1, 2, 3], @array1)
      assert_equal(["hello", "world"], @array2)
   end

   def test_concatenation_edge_cases
      assert_equal([1, 2, 3, nil], @array1 + [nil])
      assert_equal([1, 2, 3, false], @array1 + [false])
   end

   def test_concatenation_expected_errors
      assert_raises(TypeError){ @array1 + nil }
      assert_raises(TypeError){ @array1 + 1 }
      assert_raises(TypeError){ @array1 + "hello" }
   end

   def teardown
      @array1 = nil
      @array2 = nil
      @array3 = nil
   end
end
