class SongsController < ApplicationController
    before_action :get_song, only: [:show, :edit, :update, :destroy]

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def show
    end

    def edit
    end

    def create
        @song = Song.new(song_params)
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end
    
    def update
        clone_song = @song
        clone_song.update(song_params)
        
        if clone_song.valid?
            @song.update(song_params)
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        @song.destroy
        redirect_to songs_path
    end


    private

    def get_song
        @song = Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end

end
