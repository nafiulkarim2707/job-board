require 'spec_helper'

describe Console::CompaniesController do
  render_views true

  describe '#index' do
    let!(:companies) { 2.times.map { |n| FactoryGirl.create(:company) } }
    before { get :aboutus }
    subject { response }

    it 'should assign companies' do
      assigns(:companies).map(&:id).should == companies.map(&:id)
    end

    it { should render_template(:aboutus) }

  end

  describe '#new' do
    # - It renders new templte
    # - It assigns company
  end

  describe '#create' do
    context 'with required fields' do
      it 'should create new company' do
        lambda {
          post :create, :company => FactoryGirl.attributes_for(:company)
        }.should change(Company, :count).by(1)
      end

      describe 'after creating' do
        before { post :create, :company => FactoryGirl.attributes_for(:company) }
        subject { response }

        it 'should assign company' do
          assigns(:company).should be
        end

        it { should redirect_to(console_company_path(assigns(:company))) }
      end
    end

    context 'without required fields' do
      # TODO: Test exception throws
      # TODO: Test each requires fields and their error message
    end

    context 'with duplicate fields' do

    end
  end

  describe '#edit'

  describe '#update' do

  end

  describe '#destroy' do

  end

  after do
    Company.all.each(&:destroy)
  end
end
