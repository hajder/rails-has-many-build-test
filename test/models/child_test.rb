require 'test_helper'

class ChildTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "ok: should properly build association with existing parent" do
    parent = Parent.create
    parent.children.build
    
    assert parent.save
    assert_equal 1, parent.children.count
  end
  
  test "ok: should properly create association with existing parent" do
    parent = Parent.create
    parent.children.create
    
    assert_equal 1, parent.children.count
  end
  
  test "ok: should properly build parent-child association with new parent" do
    parent = Parent.new
    parent.children.build
    
    refute_nil parent.children.first, 'should have one child'
  end
  
  test "fail: should properly build child-parent association with new parent" do
    parent = Parent.new
    parent.children.build
    
    refute_nil parent.children.first.parent, 'should have associated parent'
    assert parent.save
  end
  
  test "fail: child should be valid? with new parent" do
    parent = Parent.new
    parent.children.build
    
    assert parent.children.first.valid?, 'child should be valid'
  end
  
  test "ok: persisted child should have associated parent" do
    parent = Parent.new
    parent.children.build
    
    parent.save(validate: false)
    
    refute_nil Child.first.parent, 'is properly associated after saving without validation'
  end
end
