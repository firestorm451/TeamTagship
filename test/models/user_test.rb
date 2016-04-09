require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # For testing User model. Class tweaked to allow for both one-time setup and teardown as well as between-test setup and teardown.

  def setup
    @users = []
    100.times do |n|
      @users.push(instance_variable_set("@user#{n}", User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: Faker::Internet.password)))
    end
    puts @@test
  end

  def teardown
    puts 'runs after each test'
  end


  test "validates email presence" do
    @user1.email = nil
    refute @user1.valid?, "#{@user1.username}'s e-mail was not validated for presence"
  end

  test "validates email uniqueness" do
    @user1.email = @user2.email
    refute @user1.valid?, "#{@user1.username}'s e-mail was not validated for uniqueness"
  end

  test "validates user password is at least eight characters long" do
    @user1.password = 'abba'
    refute @user1.valid? , "#{@user1.username}'s password was not validated for length"
  end

  test "validates user password contains at least four unique characters" do
    skip # this one makes Ruby explode atm
    @user1.password = 'AGAAGABA'
    refute user1.valid?, "#{@user1.username}'s password was not validated for a minimum of four unique characters"
  end

end
