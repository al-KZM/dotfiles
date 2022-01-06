acpi_file="/sys/class/leds/tpacpi::kbd_backlight/brightness"
if [[ $(cat $acpi_file) = 0 ]]
then
    echo 1 > $acpi_file
else
    echo 0 > $acpi_file
fi
