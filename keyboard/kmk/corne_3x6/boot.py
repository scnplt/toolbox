import board

from kmk.bootcfg import bootcfg

bootcfg(
    sense=board.GP14,
    midi=False,
    mouse=False,
    storage=False,
    usb_id=('@scnplt', 'crkbd - pico'),
)
