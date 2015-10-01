 require 'rails_helper'
 
 RSpec.describe Rate, type: :model do

   it { should belong_to :rateable } 
   it { should have_many :topics }
   it { should have_many :posts }
   it { should have_many :ratings}
   
  let(:topic) { create(:topic) }
   let(:user) { create(:user) }
   let(:post) { create(:post) }
   let(:rate) { Rate.create!(severity: 'PG') }
   
   describe "rateable" do
       it "allows th same rating to be used on different topics and posts." do
           topic.rate = rate
           post.rate = rate
           
           expect(topic.rate.severity).to eq('PG')
       end
   end
   
   
 end