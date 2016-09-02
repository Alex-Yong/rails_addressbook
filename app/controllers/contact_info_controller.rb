class ContactInfoController < ApplicationController
  def create
  end

  def contactlist

    @contact = Contact.new
    @contact.given_name = params[:given_name].capitalize!
    @contact.family_name = params[:family_name].capitalize!
    @contact.email_address = params[:email_address]
    @contact.address = params[:address]
    @contact.save

    @phone = Phone.new
    @phone.number = params[:primary_phone]
    @contact.phones << @phone
    #do the same thing for secondary and emergency phones
    @primary_phone.save

    if @contact.save
      redirect_to '/contact_info/contactlist_show'
    else
      render "contact cannot be saved"
    end

  end

  def contactlist_show
    @contacts = Contact.all.order(:id)
  end

  def sort_last
    @contacts = Contact.all.order(:family_name)
    render '/contact_info/contactlist_show'
  end

  def update
    @update = Contact.find(params[:update_id])
  end

  def updated_info
    @updated_info = Contact.find(params[:id])
    @updated_info.given_name = params[:given_name]
    @updated_info.family_name = params[:family_name]
    @updated_info.email_address = params[:email_address]
    @updated_info.address = params[:address]
    @updated_info.save
    redirect_to '/contact_info/contactlist_show'
  end

  def destroy
    @destroy = Contact.find(params[:destroy_id])
    @destroy.destroy
    redirect_to '/contact_info/contactlist_show'
  end
end #end class
