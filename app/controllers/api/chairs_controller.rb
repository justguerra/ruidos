module Api  
  class ChairsController < ApplicationController
    
     private

      def chair_params
        params.require(:chair).permit(:active)
      end

      def query_params
        # this assumes that an chair belongs to an artist and has an :artist_id
        # allowing us to filter by this
        params.permit(:active)
      end

  end
end  