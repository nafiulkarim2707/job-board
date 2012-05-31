require 'spec_helper'

describe Public::JobsController do
  describe '#by_friendly_name' do
    let!(:job) { FactoryGirl.create(:company) }
    let(:company) { job.company }

    before { get :by_friendly_name,
                 :company_name => company.name.parameterize,
                 :job_title => job.title.parameterize }
    subject { response }

    it { should render_template(:show) }
    [:company, :job].each do |_var|
      it "should assign #{_var}" do
        assigns(_var).should be
      end
    end
  end
end