import logging

# Configure logging to write to app.log
logging.basicConfig(
    filename='app.log',  # Log file name
    level=logging.DEBUG,  # Capture DEBUG and above messages
    format='%(asctime)s - %(levelname)s - %(message)s',
    datefmt='%Y:%m:%d %H:%M:%S',
    filemode='w'  # 'w' overwrites log file each run, use 'a' to append
)