require 'spec_helper'

describe ItemsController do
  describe 'show all the items' do
    before :each do
      @i1 = FactoryGirl.build(:item, :id=>1, :name => 'A', :description => "A is A", :highest_bid => 10)
      @i2 = FactoryGirl.build(:item, :id=>2, :name => 'B', :description => "B is B", :highest_bid => 10)
      @fake_results = [@i1, @i2]
    end
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
end