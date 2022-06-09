from picamera import PiCamera, Color
from time import sleep
from datetime import datetime
import socket


# init camera
camera = PiCamera()
try:
    camera.resolution = (3280, 2464)
    # less resolution but full sensor 1640x1232
    # full resolution: 3280x2464

    # off auto night nightpreview backlight spotlight sports snow beach verylon>
    camera.exposure_mode = 'antishake'

    # off auto sunlight cloudy shade tungsten fluorescent incandescent flash ho>
    camera.awb_mode = 'horizon'

    # init subtitle
    camera.annotate_text_size = 50
    camera.annotate_background = Color('blue')
    camera.annotate_foreground = Color('yellow')

    date_time = datetime.now().strftime("%Y-%m-%d_%H-%M-%S-%f")
    print('date: ' + date_time)
    
    # getting hostname for labeling the fotos
    name = socket.gethostname()

    camera.annotate_text = name + ": " + date_time
    camera.capture('/home/pi/'+ name + '_' + date_time + '.jpg')
finally:
    camera.close
