Given /^there are no posts$/ do
  Post.destroy_all
  Post.count.should == 0
end

