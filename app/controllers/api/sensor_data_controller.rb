module Api  
  class SensorDataController < ApplicationController
    
     private

      def sensor_data_params
        params.require(:sensor_data).permit(:ruido, :dispositivo_id)
      end

      def query_params
        # this assumes that an sensor_data belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit(:ruido, :dispositivo_id)
      end

  end
end  