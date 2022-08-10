let g:arduino_cmd = "/usr/local/bin/arduino"
let g:arduino_home_dir = "~/.arduino15"
let g:arduino_dir = "/usr/local/share/arduino"
let g:arduino_build_path = "{project_dir}/build"
let g:arduino_run_headless = 1
"let g:arduino_board = 'arduino:avr:pro:cpu=8MHzatmega328' 
"let g:arduino_programmer = 'arduino:avrispmkii'
let g:arduino_serial_cmd = 'screen {port} {baud}'
let g:arduino_auto_baud = 1  " Searches script for Serial.begin() for baudrate
let g:arduino_serial_port = '/dev/ttyUSB0'

nnoremap <buffer> <leader>am :ArduinoVerify<CR>
nnoremap <buffer> <leader>au :ArduinoUpload<CR>
nnoremap <buffer> <leader>ad :ArduinoUploadAndSerial<CR>
nnoremap <buffer> <leader>ab :ArduinoChooseBoard<CR>
nnoremap <buffer> <leader>ap :ArduinoChooseProgrammer<CR>
