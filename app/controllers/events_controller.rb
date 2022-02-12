class EventsController < ApplicationController
  # フラッシュメッセージを Bootstrap 対応させるための設定
  add_flash_types :success, :info, :warning, :danger

  before_action :set_event, only: %i[edit update destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @default_date = params[:default_date].to_date
  end

  def create
    event = Event.new(event_params)

    if event.save!
      redirect_to events_path, success: "イベントの登録に成功しました"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @event.update!(event_params)
      redirect_to events_path, success: "イベントの更新に成功しました"
    else
      render :edit
    end
  end

  def destroy
    @event.destroy

    redirect_to events_path, success: "イベントの削除に成功しました"
  end

  private
  
    def event_params
      params.require(:event).permit(:title, :start_time, :end_time)
    end

    def set_event
      @event = Event.find(params[:id])
    end
end
