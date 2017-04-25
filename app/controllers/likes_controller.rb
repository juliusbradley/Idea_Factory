class LikesController < ApplicationController


    def create
     idea = Idea.find(params[:idea_id])

      like = Like.new(user: current_user, idea: idea)

      if like.save
        redirect_to idea_path(idea), notice: 'Liked question!'
      else
        redirect_to idea_path(idea), alert: like.errors.full_messages.join(', ')
      end
    end

    def destroy
      like = Like.find(params[:id])
      if like.destroy
        redirect_to idea_path(like.idea), notice: 'Un-liked question!'
      else
        redirect_to idea_path(like.idea), alert: like.errors.full_messages.join(', ')
      end
    end
  end
