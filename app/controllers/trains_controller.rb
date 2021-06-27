class TrainsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def train_params
  end
end
