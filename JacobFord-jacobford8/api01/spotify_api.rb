#we need to be able to work with the json from Spotify


#let's get the most streamed tracks for the week from Spotify
json = RestClient.get('http://charts.spotify.com/api/tracks/most_streamed/global/weekly/latest')
spotify_results = JSON.load json

#I wanted to actually DO something with the data.  We can take a value from the command line
#and see what songs and how many streams an artist has on the list
puts "Enter an artist name: "
lookup = gets.chomp #Sam Smith is incredibly popular right now

#basically recycling my method from class last night.  Let's put the key and value from
#artist_name, track_name and num_streams and put them into an array called "artist_details"
def spotify (spotify_results)
  artist_details = []
  spotify_results['tracks'].each do |x|
    output = {}
    output['artist'] = x['artist_name'] 
    output['track_name'] = x['track_name']
    output['total_streams'] = x['num_streams']  
    artist_details.push(output)
  end
  artist_details #spotify(spotify_results) will output the last thing it runs.  We need artist details, so we make that last.
end

formatted_answer = spotify(spotify_results) 

#This was a doozy.  It's a lot like 'Inception' and it took me like an hour to find this and, incidentally, now I 
#wish I wouldn't have had the idea to do all this to begin with.
#This compares the lookup variable submitted by the user to the "artist" key in the hash
#and outputs the values we asked for to the screen
puts formatted_answer.select {|formatted_answer| formatted_answer["artist"] == lookup}

