# -*- coding: utf-8 -*-
import json
import requests
import sys
import time

API_KEY = "350b583f9208df7653208e892864ca65"
WEATHER_PATH = '/home/amcg/.local/share/weatherreport'
LAT = "32.6099"
LON = "-85.4808"

def notify():
  with open(WEATHER_PATH) as f:
    print(f.read().strip())
  sys.exit(0)

def update():
  response = None
  try:
    response = requests.get(
        "http://api.openweathermap.org/data/2.5/onecall?" +
        "lat=" + LAT + "&lon=" + LON +"&units=metric&appid=" + API_KEY)
  except:
    pass
  if not response:
    fail()
  report = json.loads(response.text)
  temp = round(report['current']['temp'])
  feels_like = round(report['current']['feels_like'])
  humidity = report['current']['humidity']
  uvi = report['current']['uvi']
  weather_main = report['daily'][0]['weather'][-1]['main']
  weather_description = report['daily'][0]['weather'][-1]['description']
  daily_max = round(report['daily'][0]['temp']['max'])
  daily_min = round(report['daily'][0]['temp']['min'])
  with open(WEATHER_PATH, 'w') as f:
    f.write("Forecast:\t\t{}\n".format(weather_main))
    f.write("Description:\t\t{}\n".format(weather_description.title()))
    f.write("Temperature:\t{}°\n".format(temp))
    f.write("Feels Like:\t\t{}°\n".format(feels_like))
    f.write("High:\t\t\t{}°\n".format(daily_max))
    f.write("Low:\t\t\t{}°\n".format(daily_min))
    f.write("Humidity:\t\t{}%\n".format(humidity))
    f.write("UV Index:\t\t{}\n".format(uvi))
  print("{}%  ↑  {}°  ↓  {}°".format(humidity, daily_max, daily_min))
  return True

def fail():
  with open(WEATHER_PATH, 'w') as f:
    f.write("Weather Unavailable")
  print("Weather Unavailable")
  sys.exit(1)

def main():
  if len(sys.argv) == 2 and sys.argv[1] == "notify":
    notify()
  else:
    update()

if __name__ == '__main__':
  main()
