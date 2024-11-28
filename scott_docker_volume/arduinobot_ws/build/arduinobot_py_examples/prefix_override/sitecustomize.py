import sys
if sys.prefix == '/usr':
    sys.real_prefix = sys.prefix
    sys.prefix = sys.exec_prefix = '/workspaces/scott_udemy_ros2/scott_docker_volume/arduinobot_ws/install/arduinobot_py_examples'
