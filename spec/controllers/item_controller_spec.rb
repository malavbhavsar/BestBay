require 'spec_helper'

describe ItemsController do
  login_user

  it "should have a current_user" do
    # note the fact that I removed the "validate_session" parameter if this was a scaffold-generated controller
    subject.current_user.should_not be_nil
  end

  it "should get index" do
    # Note, rails 3.x scaffolding may add lines like get :index, {}, valid_session
    # the valid_session overrides the devise login. Remove the valid_session from your specs
    get 'index'
    response.should be_success
  end

  before :each do
    @i1 = FactoryGirl.build(:item, :id=>1, :name => 'A', :description => "A is A")
    @i2 = FactoryGirl.build(:item, :id=>2, :name => 'B', :description => "B is B")
    @fake_results = [@i1, @i2]
  end
  describe 'show all the items' do
    it 'model should receive the call to method' do
      Item.should_receive(:all)
      get :index
    end
    describe 'testing the index view' do
      before :each do
        Item.stub(:all).and_return(@fake_results)
        get :index
      end
      it 'it should assign the values to the variable in view' do
        assigns(:items).should == @fake_results
      end
    end
  end
  describe 'go to one particular item' do
    it 'model should receive the call to find and return appropriate value' do
      Item.should_receive(:find).with(@i1.id.to_s).and_return(@i1)
      get :show, :id=>@i1.id
    end
    describe 'testing the show view' do
      before :each do
        Item.stub(:find).with(@i1.id.to_s).and_return(@i1)
        get :show, :id=>@i1.id
      end
      it 'it should assign the value to the variable in the view' do
        assigns(:item).should == @i1
      end
    end
  end
end