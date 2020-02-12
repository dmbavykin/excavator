# frozen_string_literal: true

class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all.includes(:excavator)
  end

  def show
    @ticket = Ticket.find(params[:id])
  end
end
