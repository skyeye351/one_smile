class DogsController < ApplicationController
  before_action :set_dog, only: %i[ show edit update destroy ]

  def index
    @dogs = current_user.dogs
  end

  def show
  end

  def new
    @dog = Dog.new
  end

  def create
    if @dog.save
      redirect_to @dog, success: t("defaults.flash_message.created", item: Dog.model_name.human)
    else
      flash.now[:error] = t("defaults.flash_message.not_created", item: Dog.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @dog.update(dog_params)
      redirect_to @dog, success: t("defaults.flash_message.updated", item: Dog.model_name.human)
    else
      flash.now[:error] = t("defaults.flash_message.not_updated", item: Dog.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dog.destroy
    redirect_to dogs_path, success: t("defaults.flash_message.deleted", item: Dog.model_name.human), status: :see_other
  end

  private
    def set_dog
      @dog = Dog.find(params[:id])
    end

    def dog_params
      params.require(:dog).permit(:user_id, :name, :breed, :age, :place, :profile_image)
    end
end
