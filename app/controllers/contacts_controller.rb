class ContactsController < ApplicationController
  before_action :ensure_signed_in
  before_action :load_contact, only: [:show, :edit, :update, :destroy]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(create_params)
    @contact.user = currect_user

    if @contact.save
      flash[:notice] = 'Contact created!'
      redirect_to contact_path(@contact)
    else
      flash[:error] = @contact.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit; end

  def update
    if @contact.update(update_params)
      flash[:notice] = 'Contact updated!'
      redirect_to contact_path(@contact)
    else
      flash[:error] = @contact.errors.full_messages.join(', ')
      render :edit
    end
  end

  def index
    @contacts = current_user.contacts
  end

  def show; end

  def destroy
    @contact.destroy!

    flash[:notice] = "#{@contact.name} deleted!"
    redirect_to contacts_path
  end

  private

  def create_params
    params.require(:contact).permit(:name, :company, :department, :title, :email, :phone, :description)
  end

  def update_params
    params.require(:contact).permit(:name, :company, :department, :title, :email, :phone, :description)
  end

  def load_contact
    @contact = current_user.contacts.find(params[:id])
  end
end
