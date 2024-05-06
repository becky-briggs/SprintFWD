# frozen_string_literal: true

module Api
  module V1
    class MembersController < ApplicationController
      before_action :set_member, only: %i[show update destroy]

      # GET /api/v1/members
      def index
        @members = Member.all

        render json: @members
      end

      # GET /api/v1/members/1
      def show
        render json: @member
      end

      # POST /api/v1/members
      def create
        @member = Member.create!(member_params)
        render json: @member, status: :created
      end

      # PATCH/PUT /api/v1/members/1
      def update
        @member.update!(member_params)
        render json: @member, status: :ok
      end

      # DELETE /api/v1/members/1
      def destroy
        @member.destroy!
        head :no_content
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_member
        @member = Member.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def member_params
        params.permit(:first_name, :last_name, :city, :state, :country, :team_id)
      end
    end
  end
end
