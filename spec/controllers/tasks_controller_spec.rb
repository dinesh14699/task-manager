# spec/controllers/tasks_controller_spec.rb

require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  before do
    @user = User.find_or_initialize_by(email: 'test@example.com')
    @user.password = "password"
    @user.save!
    sign_in @user # Use Devise sign_in method to authenticate the user
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    let(:task) {
      Task.create(title: "Sample Task", user: @user, deadline: Time.now, status: 0)
    }

    it "returns a success response" do
      get :show, params: { id: task.id }
      expect(response).to be_successful
    end
  end
end
