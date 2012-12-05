require 'spec_helper'

describe ListsController do
  context "create list" do
    it "should be able to create a new task and be redirected to such list page" do
      expect {
        post :create, {:list => attributes_for(:list)}
        created_list = assigns[:list]
        created_list.should_not be_new_record
        response.should redirect_to(lists_url)
      }.to change { List.count }.by(1)
    end
  end 

  it "should be able to see the new task" do
    get :new
    response.should render_template(:new)
  end

  it "should be able to submit an update for an existing task." do
    existing_list = create(:list)
    put :update, {
      id: existing_list.id,
      list: { est_list: true }
    }
    existing_list.reload.est_list.should eql(true)
    response.should redirect_to(lists_url)
  end

  it "should be able to destroy for an existing task." do
    existing_list = create(:list)
    delete :destroy, {
      :id => existing_list.id
    }
    existing_list.should_not be_nil
    response.should redirect_to(lists_url)
  end

  it "should be presented with a list of all task at index" do
      4.times { create(:list) }
      get :index
      assigns[:complete_lists].should have_at_least(0).lists
      assigns[:incomplete_lists].should have_at_least(4).lists
      response.should render_template(:index)
    end
end
