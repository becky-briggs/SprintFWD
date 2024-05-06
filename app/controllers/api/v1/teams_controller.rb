# frozen_string_literal: true

module Api
  module V1
    class TeamsController < ApplicationController
      before_action :set_team, only: %i[show update destroy]

      # GET /api/v1/teams
      def index
        @teams = Team.all

        render json: @teams
      end

      # GET /api/v1/teams/1
      def show
        render json: @team
      end

      # POST /api/v1/teams
      def create
        @team = Team.create!(team_params)
        render json: @team, status: :created
      end

      # PATCH/PUT /api/v1/teams/1
      def update
        @team.update!(team_params)
        render json: @team, status: :ok
      end

      # DELETE /api/v1/teams/1
      def destroy
        @team.destroy!
        head :no_content
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_team
        @team = Team.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def team_params
        params.permit(:name)
      end
    end
  end
end
