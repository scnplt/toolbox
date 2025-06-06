import board

from kmk.kmk_keyboard import KMKKeyboard as _KMKKeyboard
from kmk.scanners import DiodeOrientation
from kmk.modules.split import Split, SplitType
from kmk.modules.layers import Layers
from kmk.modules.holdtap import HoldTap
from kmk.modules.combos import Combos
from kmk.modules.tapdance import TapDance
from kmk.modules.oneshot import OneShot
from kmk.extensions.media_keys import MediaKeys

class KMKKeyboard(_KMKKeyboard):
    col_pins = (board.GP6, board.GP7, board.GP8, board.GP9, board.GP10, board.GP11)
    row_pins = (board.GP18, board.GP19, board.GP20, board.GP21)
    diode_orientation = DiodeOrientation.COL2ROW

    coord_mapping = [
        0,  1,  2,  3,  4,  5,      29, 28, 27, 26, 25, 24,
        6,  7,  8,  9,  10, 11,     35, 34, 33, 32, 31, 30,
        12, 13, 14, 15, 16, 17,     41, 40, 39, 38, 37, 36,
                    21, 22, 23,     47, 46, 45,
    ]
    
    layers = Layers()
    hold_tap = HoldTap()
    combos = Combos()
    
    tapdance = TapDance()
    tapdance.tap_time = 180
    
    oneshot = OneShot()
    oneshot.tap_time = 180
    
    split = Split(split_type=SplitType.UART, data_pin=board.GP0, data_pin2=board.GP1, use_pio=True, uart_flip=True)
    
    modules = [layers, hold_tap, split, combos, tapdance, oneshot]

    extensions = [MediaKeys()]

    def set_combos(self, combos):
        self.combos.combos = combos
