class PlaylistsController < ApplicationController
  def create
    Playlist.create(playlist_params)
    redirect_to songs_path
  end
  private
    def playlist_params
      params.require(:playlist).permit(:song_id).merge(user: current_user)
    end
end
