module Api  
  class DispositivosController < ApplicationController
    
     private

      def dispositivo_params
        params.require(:dispositivo).permit(:name, :local, :lat, :long)
      end

      def query_params
        # this assumes that an dispositivo belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit(:name, :local, :lat, :long)
      end

  end
end  