class PaymentsController < ApplicationController
  expose(:payments)
  expose(:payment)

  before_action :authenticate_user!
end