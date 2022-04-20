# redis json
import json
import redis

r = redis.StrictRedis(host='localhost', port=6379, db=0)

images= [
    {'type':'big', 'url':'....'},
    {'type':'big', 'url':'....'},
    {'type':'big', 'url':'....'},
]

# Convert python dict to JSON str and save to Redis
json_images = json.dumps(images)
r.set('images', json_images)

# Read saved JSON str from Redis and unpack into python dict
unpacked_images = json.loads(r.get('images'))
images == unpacked_images

# notes
1. get ticks: ``