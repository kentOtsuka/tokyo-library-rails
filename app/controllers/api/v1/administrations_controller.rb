class Api::V1::AdministrationsController < ApplicationController
  def index
    administrations = Administration.all
    response = []
    administrations.each do |l|
      response << {
        id: l.id,
        name: l.name,
      }
    end
    render json: { administrations: response }
  end

  def show
    response = []
    # 自治体の複数検索
    if params[:ids]
      # サービスも踏まえた詳細検索
      if params[:serviceId]
        service = Service.find(params[:serviceId])
        libraries = service.libraries.where(administration_id:  params[:ids].split(',').map(&:to_i)).includes(:administration)
      else
        libraries = Library.where(administration_id:  params[:ids].split(',').map(&:to_i)).includes(:administration, :services)
      end
    else
      # サービスも踏まえた詳細検索
      if params[:serviceId]
        service = Service.find(params[:serviceId])
        libraries = service.libraries.where(administration_id: params[:id])
      else
        administration = Administration.find(params[:id])
        libraries = administration.libraries.includes(:services)
      end
    end
    libraries.each do |l|
      response << {
        id: l.id,
        title: l.name,
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
