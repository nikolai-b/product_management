require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe LineItemsController do

  # This should return the minimal set of attributes required to create a valid
  # LineItem. As you add validations to LineItem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { (FactoryGirl.attributes_for :line_item).with_indifferent_access }


  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LineItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  let!(:line_item) { FactoryGirl.create :line_item}
  let(:order) { line_item.order }

  describe "GET index" do
    it "assigns all line_items as @line_items" do
      get :index, {order_id: order.to_param}, valid_session
      assigns(:line_items).should eq([line_item])
    end
  end

  describe "GET show" do
    it "assigns the requested line_item as @line_item" do
      get :show, {:id => line_item.to_param, order_id: order.to_param}, valid_session
      assigns(:line_item).should eq(line_item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new LineItem" do
        expect {
          post :create, {:line_item => valid_attributes, order_id: order.to_param}, valid_session
        }.to change(LineItem, :count).by(1)
      end

      describe "simple POST" do
        before :each do
          post :create, {:line_item => valid_attributes, order_id: order.to_param}, valid_session
        end

        it "assigns a newly created line_item as @line_item" do
          assigns(:line_item).should be_a(LineItem)
          assigns(:line_item).should be_persisted
        end

        it "has status created" do
          expect(response.status).to eq(201)
        end

        it "has location" do
          expect(response.location).to include(order.to_param)
        end
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved line_item as @line_item" do
        # Trigger the behavior that occurs when invalid params are submitted
        LineItem.any_instance.stub(:save).and_return(false)
        post :create, {:line_item => { "quantity" => "invalid value" }, order_id: order.to_param}, valid_session
        assigns(:line_item).should be_a_new(LineItem)
      end

      it "has status unprocessable_entity" do
        # Trigger the behavior that occurs when invalid params are submitted
        LineItem.any_instance.stub(:save).and_return(false)
        post :create, {:line_item => { "quantity" => "invalid value" }, order_id: order.to_param}, valid_session
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested line_item" do
        # Assuming there are no other line_items in the database, this
        # specifies that the LineItem created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        LineItem.any_instance.should_receive(:update).with( valid_attributes)
        put :update, {:id => line_item.to_param, :line_item => valid_attributes, order_id: order.to_param}, valid_session
      end

      it "assigns the requested line_item as @line_item" do
        put :update, {:id => line_item.to_param, :line_item => valid_attributes, order_id: order.to_param}, valid_session
        assigns(:line_item).should eq(line_item)
      end

      it "has status 204" do
        put :update, {:id => line_item.to_param, :line_item => valid_attributes, order_id: order.to_param}, valid_session
        expect(response.status).to eq(204)
      end
    end

    describe "with invalid params" do
      it "assigns the line_item as @line_item" do
        # Trigger the behavior that occurs when invalid params are submitted
        LineItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => line_item.to_param, :line_item => { "quantity" => "invalid value" }, order_id: order.to_param}, valid_session
        assigns(:line_item).should eq(line_item)
      end

      it "has status unprocessable_entity" do
        # Trigger the behavior that occurs when invalid params are submitted
        LineItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => line_item.to_param, :line_item => { "name" => "invalid value" }, order_id: order.to_param}, valid_session
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested line_item" do
      expect {
        delete :destroy, {:id => line_item.to_param, order_id: order.to_param}, valid_session
      }.to change(LineItem, :count).by(-1)
    end

    it "has status 204" do
      delete :destroy, {:id => line_item.to_param, order_id: order.to_param}, valid_session
      expect(response.status).to eq(204)
    end
  end

end
