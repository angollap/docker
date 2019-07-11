docker run -d -it -p 4000:80 pythonappenv:v1
sleep 15s
curl http://10.55.2.208:4000
