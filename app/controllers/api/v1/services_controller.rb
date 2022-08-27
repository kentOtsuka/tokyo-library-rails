class Api::V1::ServicesController < ApplicationController
  def index
    services = Service.all
    response = []
    services.each do |l|
      response << {
        id: l.id,
        body: l.body,
      }
    end
    render json: { services: response }
  end

  def show
    service = Service.find(params[:id])
    response = []
    # N+1問題の解消
    libraries = service.libraries.includes(:administration, :services)
    # 自治体との複数検索
    if params[:administrationId]
      libraries = libraries.where(administration_id: params[:administrationId].split(',').map(&:to_i))
    end
    libraries.each do |l|
      response << {
        title: l.name,
        address: l.administration.name + l.address,
        open: l.open_time.strftime("%-H:%M"),
        close: l.close_time.strftime("%-H:%M"),
        seats: l.seats,
        opening_details: l.opening_details,
        close_date_first: l.closed_body_first,
        close_date_second: l.closed_body_second,
        services: l.services,
        position: {
          lat: l.lat.to_f,
          lng: l.lng.to_f
        },
        pinicon: {
          url: 'http://maps.google.co.jp/mapfiles/ms/icons/green-dot.png',
          scaledSize: { width: 40, height: 40, f: 'px', b: 'px' },
        },
      }
    end
    render json: { libraries: response }
  end
end
