require 'test/unit/testcase'
require 'test/unit/testresult'
#require 'test/unit'

class StringTest < Test::Unit::TestCase
  SINGLE_QUOTE = 39
  BACKSLASH = 92

  ALERT = 7
  BACKSPACE = 8
  ESCAPE = 27
  FORMFEED = 12
  NEWLINE = 10
  RETURN = 13
  SPACE = 32
  TAB = 9
  VERTICAL_TAB = 11

  def test_character_escapes
    assert_equal('' << SINGLE_QUOTE, '\'')
    assert_equal('' << SINGLE_QUOTE, "\'")
    
    assert_equal('' << BACKSLASH, "\\")
    assert_equal('' << BACKSLASH, '\\')

    assert_equal('' << ALERT, "\a")
    assert_equal('' << BACKSLASH << 'a', '\a')

    assert_equal('' << BACKSPACE, "\b")
    assert_equal('' << BACKSLASH << 'b', '\b')

    assert_equal('' << ESCAPE, "\e")
    assert_equal('' << BACKSLASH << 'e', '\e')

    assert_equal('' << FORMFEED, "\f")
    assert_equal('' << BACKSLASH << 'f', '\f')

    assert_equal('' << NEWLINE, "\n")
    assert_equal('' << BACKSLASH << 'n', '\n')

    assert_equal('' << RETURN, "\r")
    assert_equal('' << BACKSLASH << 'r', '\r')

    assert_equal('' << SPACE, "\s")
    assert_equal('' << BACKSLASH << 's', '\s')

    assert_equal('' << TAB, "\t")
    assert_equal('' << BACKSLASH << 't', '\t')
    
    assert_equal('' << VERTICAL_TAB, "\v")
    assert_equal('' << BACKSLASH << 'v', '\v')
    
    # Escapes with no definition
    assert_equal('o', "\o")
    assert_equal('' << BACKSLASH << 'o', '\o')
    assert_equal('u', "\u")
    assert_equal('' << BACKSLASH << 'u', '\u')
  end
  
  def test_octal_escape
    assert_equal('' << 2, "\2")
    assert_equal('' << BACKSLASH << '2', '\2')
    assert_equal('' << 2, "\02")
    assert_equal('' << 2, "\002")
    assert_equal('' << 0 << '2', "\0002")

    assert_equal('' << 13, "\15")
    assert_equal('' << BACKSLASH << '15', '\15')

    assert_equal('' << 108, "\154")
    assert_equal('' << BACKSLASH << '154', '\154')

    assert_equal('888', "\888")
    assert_equal('' << BACKSLASH << '154', '\154')

    assert_equal('' << 108 << '3', "\1543")
    assert_equal('' << BACKSLASH << '1543', '\1543')

    assert_equal('' << 2 << 'v', "\2v")
  end

  def test_hex_escape
    assert_equal('' << 2, "\x02")
    assert_equal('' << BACKSLASH << 'x02', '\x02')

    assert_equal('' << 2, "\x2")
    assert_equal('' << BACKSLASH << 'x2', '\x2')

    assert_equal('' << 2 << 'v', "\x2v")
    assert_equal('' << BACKSLASH << 'x2v', '\x2v')
  end

  def test_constructor
    # TODO
    # Returns a new string object containing a copy of str.
    a = "ba"
    a << "Hejsa"
    p a
  end


  # Test '%'
  def test_op_mod
    #TODO
  end

  def test_rindex
    assert_equal(1, "hello".rindex('e'))
    assert_equal(3, "hello".rindex('l'))
    assert_equal(3, "helllo".rindex('ll'))
    assert_equal(nil, "hello".rindex('a'))
    assert_equal(1, "hello".rindex(101))
#    assert_equal(1, "hello".rindex(/[aeiou]/, -2))
#    assert_raises(TypeError) { "".rindex(true) }
  end
  
  def test_map 
    #TODO
  end

  # Test '<<'
  def test_op_append
    a = "hello "
    a << "world"
    assert_equal("hello world", a)
    a << 33
    assert_equal("hello world!", a)
  end

  def test_split 
    #TODO
  end

  def test_any? 
    #TODO
  end

  def test_sort 
    #TODO
  end

  def test_strip 
    #TODO
  end

  def test_size 
    #TODO
  end

  def test_downcase 
    #TODO
  end

  def test_min 
    #TODO
  end

  def test_gsub! 
    #TODO
  end

  def test_count 
    #TODO
  end

  def test_include? 
    #TODO
  end

  def test_succ! 
    #TODO
  end

  def test_downcase! 
    #TODO
  end

  def test_intern 
    #TODO
  end

  def test_squeeze! 
    #TODO
  end

  # Test '*'
  def test_op_multiply 
    #TODO
  end

  def test_next 
    #TODO
  end

  def test_find_all 
    #TODO
  end

  def test_each 
    #TODO
  end

  def test_rstrip! 
    #TODO
  end

  def test_each_line 
    #TODO
  end

  # Test '+'
  def test_op_add 
    #TODO
  end

  def test_sub 
    #TODO
  end

  def test_slice! 
    #TODO
  end

  def test_tr 
    #TODO
  end

  def test_replace 
    #TODO
  end

  def test_inject 
    #TODO
  end

  def test_reverse 
    #TODO
  end

  def test_sort_by 
    #TODO
  end

  def test_lstrip 
    #TODO
  end

  def test_capitalize 
    #TODO
  end

  def test_max 
    #TODO
  end

  def test_chop! 
    #TODO
  end

  def test_capitalize! 
    #TODO
  end

  def test_scan 
    #TODO
  end

  def test_select 
    #TODO
  end

  def test_each_byte 
    #TODO
  end

  def test_casecmp 
    #TODO
  end

  def test_gsub 
    #TODO
  end

  def test_empty? 
    #TODO
  end

  def test_to_str 
    #TODO
  end

  def test_partition 
    #TODO
  end

  def test_tr_s 
    #TODO
  end

  def test_tr! 
    #TODO
  end

  def test_match 
    #TODO
  end

  def test_grep 
    #TODO
  end

  def test_rstrip 
    #TODO
  end

  def test_to_sym 
    #TODO
  end

  def test_next! 
    #TODO
  end

  def test_swapcase 
    #TODO
  end

  def test_chomp! 
    #TODO
  end

  def test_swapcase! 
    #TODO
  end

  def test_ljust 
    #TODO
  end

  def test_between? 
    #TODO
  end

  def test_reject 
    #TODO
  end

  def test_upto 
    #TODO
  end

  def test_hex 
    #TODO
  end

  def test_sum 
    #TODO
  end

  def test_reverse! 
    #TODO
  end

  def test_chop 
    #TODO
  end

  # Test '<=>'
  def test_op_comparison
    assert_equal 0, 'a' <=> 'a'
    assert_equal -1, 'A' <=> 'a'
    assert_equal 1, 'b' <=> 'a'
    assert_equal -1, 'a' <=> 'b'
  end

  def test_insert 
    #TODO
  end

  # Test '<'
  def test_op_less_than 
    #TODO
  end

  def test_delete 
    #TODO
  end

  def test_dump 
    #TODO
  end

  def test_member? 
    #TODO
  end

  def test_tr_s! 
    #TODO
  end

  def test_unpack 
    #TODO
  end

  # Test '>'
  def test_op_greater_than 
    #TODO
  end

  def test_concat 
    a = "hello "
    a.concat "world"
    assert_equal("hello world", a)
    a.concat 33
    assert_equal("hello world!", a)
  end

  def test_succ 
    #TODO
  end

  def test_find 
    #TODO
  end

  def test_strip! 
    #TODO
  end

  def test_each_with_index 
    #TODO
  end

  # Test '>='
  def test_op_greater_than_equal
    #TODO
  end

  def test_to_i 
    #TODO
  end

  def test_rjust 
    #TODO
  end

  # Test '<='
  def test_less_than_equal 
    #TODO
  end

  def test_index 
    assert_equal(1, "hello".index('e'))
    assert_equal(3, "hello".index('lo'))
    assert_equal(nil, "hello".index('a'))
    assert_equal(1, "hello".index(101))
#    assert_equal(4,"hello".index(/[aeiou]/, -3))
  end

  def test_collect 
    #TODO
  end

  def test_slice 
    #TODO
  end

  def test_oct 
    #TODO
  end

  def test_all? 
    #TODO
  end

  def test_length 
    #TODO
  end

  def test_entries 
    #TODO
  end

  def test_chomp 
    #TODO
  end

  def test_upcase 
    #TODO
  end

  def test_sub! 
    #TODO
  end

  def test_squeeze 
    #TODO
  end

  def test_upcase! 
    #TODO
  end

  def test_crypt 
    #TODO
  end

  def test_delete! 
    #TODO
  end

  def test_detect 
    #TODO
  end

  def test_zip 
    #TODO
  end

  # Test '[]'
  def test_op_index 
    #TODO
  end

  def test_lstrip! 
    #TODO
  end

  def test_center 
    #TODO
  end

  # Test '[]='
  def test_op_index_set
    #TODO
  end

  def test_to_f 
    #TODO
  end

end

def do_test(name)
  p name
  tc = StringTest.new(name)
  tr = Test::Unit::TestResult.new
  tc.run(tr) do |event,name|
    #p "test:#{event} #{name}"
  end
  p tr.to_s
end

do_test "test_character_escapes"
do_test "test_octal_escape"
do_test "test_hex_escape"
#do_test "test_op_mod"
do_test "test_rindex"
do_test "test_index"
do_test "test_op_append"
do_test "test_concat"
do_test "test_op_comparison"
