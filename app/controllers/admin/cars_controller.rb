class Admin::CarsController < Admin::BaseController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
    @type = params[:type]
  end

  def edit
    @type = params[:type]
  end

  def create
    @car = @train.cars.new(car_params)
    if @car.save
      redirect_to admin_train_path(@train)
    else
      render :new
    end
  end

  def update
    if @car.update(car_params)
      redirect_to admin_train_path(@train), notice: 'Car was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path, notice: 'Car was successfully destroyed.'
  end

  private
  def set_car
    @car = Car.find(params[:id])
  end
  def set_train
    @train = Train.find(params[:train_id])
  end
  def car_params
    params.require(:car).permit(:number, :type, :train_id,:amount_top_seats, :amount_side_top_seats, :amount_bottom_seats, :amount_side_bottom_seats, :amount_sitting_seats)
  end
end