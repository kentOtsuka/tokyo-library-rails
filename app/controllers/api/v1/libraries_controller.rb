class Api::V1::LibrariesController < ApplicationController
  def index
    # N+1問題の解消
    libraries = Library.all.includes(:administration, :services)
    response = []
    libraries.each do |l|
      response << {
        id: l.id
        title: l.name,
        address: l.administration.name + l.address,
        open: l.open_time.strftime("%-H:%M"),
        close: l.close_time.strftime("%-H:%M"),
        seats: l.seats,
        opening_details: l.opening_details,
        close_date_first: l.closed_body_first,
        close_date_second: l.closed_body_second,
        services: l.services,
        comfort: l.comfort,
        clean: l.clean,
        silent: l.silent,
        desk: l.desk,
        crowd: l.crowd,
        quantity: l.quantity,
        position: {
          lat: l.lat.to_f,
          lng: l.lng.to_f
        },
        pinicon: {
          url: 'http://maps.google.co.jp/mapfiles/ms/icons/blue-dot.png',
          scaledSize: { width: 40, height: 40, f: 'px', b: 'px' },
        },
      }
    end
    render json: { libraries: response }
  end

  def update
    library = Library.find(params[:id])
  
    if library
      library.update(quantity: library.quantity + 1)
      library.update(comfort: library.comfort + params[:library][:comfort].to_i)
      library.update(clean: library.clean + params[:library][:clean].to_i)
      library.update(silent: library.silent + params[:library][:silent].to_i)
      library.update(desk: library.desk + params[:library][:desk].to_i)
      library.update(crowd: library.crowd + params[:library][:crowd].to_i)
      render json: { status: 'ok' }
    else
      render json: request.errors, status: :bad_request
    end
  end
end
