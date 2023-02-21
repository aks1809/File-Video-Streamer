import imagezmq
from queue import Queue
from threading import Thread

import logging
from logging.handlers import RotatingFileHandler
from dotenv import load_dotenv
import datetime
import os
load_dotenv()

queuing_logger = logging.getLogger("queuing_logger")
queuing_logger.setLevel(logging.DEBUG)
queuing_logger.propagate = False  # wont show output on console
formatter = logging.Formatter(
    '%(asctime)s [%(levelname)8s:%(name)1s] %(message)s', datefmt='%Y-%m-%d %H:%M:%S')
queuing_handler = RotatingFileHandler("./model_logs/queuing_log.log",
                                    maxBytes=int(os.getenv("MAXBYTES_LOGGER")),
                                    backupCount=int(
                                        os.getenv("BACKUPCOUNT_LOGGER")),)
queuing_handler.setFormatter(formatter)
queuing_logger.addHandler(queuing_handler)

class ImageQServer:
    def __init__(self, tcp_port, queueSize=128):
        self.stopped = False
        self.image_hub = None
        self.queue = Queue(maxsize=queueSize)
        self.tcp_port = tcp_port

    def start(self):
        self.image_hub = imagezmq.ImageHub(
            open_port=f"tcp://127.0.0.1:{self.tcp_port}")
        t = Thread(target=self.update, args=())
        t.daemon = True
        t.start()
        return self

    def update(self):
        while True:  # show streamed images until Ctrl-C
            if self.stopped:
                break
            rpi_name, image = self.image_hub.recv_image()
            # if self.is_active.get(rpi_name, 0) == 1:
            #     if self.extract_frame.get(rpi_name, 0) == 1:
            queuing_logger.info(f"Putting frame in queue for ----- {rpi_name}")
            self.queue.put({
                "name": rpi_name,
                "frame": image
            })
            self.image_hub.send_reply(b'OK')
            

    def read(self):
        ct = 1
        image_res = []
        # print(f"Q size: {self.queue.qsize()}")
        while (ct > 0 and self.queue.qsize() > 0):
            if self.stopped:
                break
            image_res.append(self.queue.get())
            ct -= 1
        return image_res

    def stop(self):
        self.stopped = True
        self.queue = None
