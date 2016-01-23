require 'serialport'

TTY_DEVICE = "/dev/tty.usbmodem14121"
BAUD_RATE = 9600
DATA_BITS = 8
STOP_BITS = 1
PARITY = SerialPort::NONE
sp = SerialPort.new(TTY_DEVICE, BAUD_RATE, DATA_BITS, STOP_BITS, PARITY)

lines = ARGF.read.split("\n")
lines.each do |line|
  sp.write(line.chomp.delete(' ') + "\n")
  sleep(0.1)
end
sp.write("#");
