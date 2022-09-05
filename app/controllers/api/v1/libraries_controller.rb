class Api::V1::LibrariesController < ApplicationController
  def index
    # N+1問題の解消
    libraries = Library.all.includes(:administration, :services)
    response = []
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
          url: 'http://maps.google.co.jp/mapfiles/ms/icons/blue-dot.png',
          scaledSize: { width: 40, height: 40, f: 'px', b: 'px' },
        },
      }
    end
    render json: { libraries: response }
  end

  def update
    @library = Library.find(params[:id])
    if @library.update(library_param)
    else
    end
  end

  private
    def library_params
      params.require(:library).permit(:clean, :comfort, :silent, :desk, :crowd)
    end
end
