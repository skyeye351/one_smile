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

  def edit
  end

  def create
    @dog = current_user.dogs.new(dog_params)
    if @dog.save
      redirect_to @dog, success: t("defaults.flash_message.created")
    else
      flash.now[:error] = t("defaults.flash_message.not_created")
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @dog.update(dog_params)
        format.html { redirect_to @dog, notice: "Dog was successfully updated." }
        format.json { render :show, status: :ok, location: @dog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dog.destroy!

    respond_to do |format|
      format.html { redirect_to dogs_path, status: :see_other, notice: "Dog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_dog
      @dog = Dog.find(params[:id])
    end

    def dog_params
      params.require(:dog).permit(:user_id, :name, :breed, :age, :place, :profile_image)
    end
end
