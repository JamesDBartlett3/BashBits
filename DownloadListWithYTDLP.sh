# loop through a CSV file and download each url using yt-dlp
# Example: ./DownloadListWithYTDLP.sh ./url_list.csv

# check if a file was passed
if [ -z "$1" ]; then
  echo "No file passed"
  exit 1
fi

# check if the file exists and is a CSV file
if [ ! -f "$1" ] || [[ ! "$1" == *.csv ]]; then
  echo "File does not exist or is not a CSV file"
  exit 1
fi

# loop through the file and download each url with yt-dlp
while IFS=, read -r url; do
  yt-dlp "$url"
done < "$1"
