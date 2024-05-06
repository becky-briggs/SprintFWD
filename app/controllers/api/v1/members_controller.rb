# frozen_string_literal: true

module Api
  module V1
    class MembersController < ApplicationController
      before_action :set_member, only: %i[show update update_team destroy]

      # GET /api/v1/members
      def index
        @members = if params[:team_id]
                     Team.find_by(id: params[:team_id]).members
                   elsif params[:project_id]
                     Project.find_by(id: params[:project_id]).members
                   else
                     Member.all
                   end

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

      # PATCH /api/v1/members/1/update_team
      def update_team
        @member.update!(team_id: update_team_params[:team_id])
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
        params.permit(:first_name, :last_name, :city, :state, :country, :team_id, :project_id)
      end

      def update_team_params
        params.permit(:team_id)
      end
    end
  end
end
