# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < ApplicationController
      before_action :set_project, only: %i[show update destroy add_member]

      # GET /api/v1/projects
      def index
        @projects = Project.all

        render json: @projects
      end

      # GET /api/v1/projects/1
      def show
        render json: @project
      end

      # POST /api/v1/projects
      def create
        @project = Project.create!(project_params)
        render json: @project, status: :created
      end

      # PATCH/PUT /api/v1/projects/1
      def update
        @project.update!(project_params)
        render json: @project, status: :ok
      end

      # DELETE /api/v1/projects/1
      def destroy
        @project.destroy!
        head :no_content
      end

      # POST /api/v1/projects/1
      def add_member
        member = Member.find(add_member_params[:member_id])
        @project.members << member
        @project.save!
        render json: { message: "Member #{member.id} was successfully added to Project #{@project.id}." }, status: :ok
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_project
        @project = Project.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def project_params
        params.permit(:name)
      end

      def add_member_params
        params.permit(:member_id)
      end
    end
  end
end
