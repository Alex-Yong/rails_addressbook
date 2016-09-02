require 'rails_helper'

RSpec.describe Contact, type: :model do
  it 'is a thing' do
    expect{Contact.new}.to_not raise_error
  end

  it 'can create a person and be saved' do
    @contact = Contact.new
    @contact.given_name = "Alex"
    @contact.family_name = "Yong"
    @contact.email_address = "a@gmail.com"
    @contact.address = "123 happy ln."
    expect(@contact.save).to eq true
    c2 = Contact.find_by_given_name("Alex")
    expect(c2.given_name).to eq "Alex"
  end
end
