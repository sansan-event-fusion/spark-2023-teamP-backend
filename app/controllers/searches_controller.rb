class SearchesController < ApplicationController
    def search
        recruitments = Recruitment.all
        recruitments = recruitments.where("title LIKE ?", "%ハッカソン%")
        render json:{ status:200, recruitments: recruitments}
    end
end
