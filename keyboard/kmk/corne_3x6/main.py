from kb import KMKKeyboard
from kmk.keys import KC
from kmk.modules.string_substitution import StringSubstitution
from kmk.modules.combos import Chord

keyboard = KMKKeyboard()
keyboard.debug_enabled = False

string_substitution = StringSubstitution(dictionary = {
    ';sc': 'Sertan Canpolat'
})

keyboard.modules.append(string_substitution)

keyboard.set_combos([
    Chord((KC.Y, KC.U), KC.LCTRL(KC.Z)),
    Chord((KC.U, KC.I), KC.LCTRL(KC.LSFT(KC.Z))),
    Chord((KC.F, KC.G), KC.LGUI),
    Chord((KC.H, KC.J), KC.RGUI),
    Chord((KC.F, KC.V), KC.LGUI(KC.V))
])

LOWER = 1
RAISE = 2
FN = 3
MOUSE = 4

_______ = KC.TRNS
XXXXXXX = KC.NO

MEH_LOWER = KC.HT(KC.OS(KC.MEH), KC.MO(LOWER))
LY_RAISE = KC.MO(RAISE)
DEL_FN = KC.LT(FN, KC.DEL)

TAB_LSFT = KC.HT(KC.TAB, KC.LSFT)
QUOT_RSFT = KC.HT(KC.QUOT, KC.RSFT)
CTL_CPS = KC.TD(KC.LCTRL, KC.HT(KC.CAPS, KC.LCTRL))

keyboard.keymap = [
    # DEFAULT
    [
        KC.ESC,     KC.Q,       KC.W,       KC.E,       KC.R,       KC.T,               KC.Y,       KC.U,       KC.I,       KC.O,       KC.P,       KC.BSPC,
        TAB_LSFT,   KC.A,       KC.S,       KC.D,       KC.F,       KC.G,               KC.H,       KC.J,       KC.K,       KC.L,       KC.SCLN,    QUOT_RSFT,
        CTL_CPS,    KC.Z,       KC.X,       KC.C,       KC.V,       KC.B,               KC.N,       KC.M,       KC.COMM,    KC.DOT,     KC.SLSH,    KC.BSLS,
                                            KC.LALT,    MEH_LOWER,  KC.SPC,             KC.ENT,     LY_RAISE,   DEL_FN
    ],

    # LOWER
    [
        XXXXXXX,    KC.EXLM,    KC.AT,      KC.HASH,    KC.DLR,     KC.PERC,            KC.CIRC,    KC.AMPR,    KC.ASTR,    KC.MINS,    KC.EQL,     KC.TILD,
        XXXXXXX,    XXXXXXX,    XXXXXXX,    KC.LCBR,    KC.LBRC,    KC.LPRN,            XXXXXXX,    XXXXXXX,    XXXXXXX,    KC.UNDS,    KC.PLUS,    KC.GRV,
        XXXXXXX,    XXXXXXX,    XXXXXXX,    KC.RCBR,    KC.RBRC,    KC.RPRN,            XXXXXXX,    XXXXXXX,    XXXXXXX,    XXXXXXX,    XXXXXXX,    XXXXXXX,
                                            XXXXXXX,    _______,    XXXXXXX,            XXXXXXX,    XXXXXXX,    XXXXXXX
    ],

    # RAISE
    [
        XXXXXXX,    KC.N1,      KC.N2,      KC.N3,      KC.N4,      KC.N5,              KC.N6,      KC.N7,      KC.N8,      KC.N9,      KC.N0,      _______,
        KC.LSFT,    XXXXXXX,    XXXXXXX,    XXXXXXX,    XXXXXXX,    XXXXXXX,            KC.LEFT,    KC.DOWN,    KC.UP,      KC.RGHT,    XXXXXXX,    KC.RSFT,
        KC.LCTRL,   XXXXXXX,    XXXXXXX,    XXXXXXX,    XXXXXXX,    XXXXXXX,            KC.HOME,    KC.PGDN,    KC.PGUP,    KC.END,     XXXXXXX,    XXXXXXX,
                                            _______,    XXXXXXX,    _______,            XXXXXXX,    _______,    XXXXXXX
    ],

    # FN
    [
        XXXXXXX,    KC.F1,      KC.F2,      KC.F3,      KC.F4,      KC.F5,              KC.F6,      KC.F7,      KC.F8,      KC.F9,      KC.F10,     XXXXXXX,
        XXXXXXX,    XXXXXXX,    XXXXXXX,    XXXXXXX,    KC.F11,     KC.F12,             KC.MPRV,    KC.VOLD,    KC.VOLU,    KC.MNXT,    XXXXXXX,    XXXXXXX,
        KC.RESET,   XXXXXXX,    XXXXXXX,    XXXXXXX,    XXXXXXX,    XXXXXXX,            XXXXXXX,    XXXXXXX,    KC.PSCR,    XXXXXXX,    XXXXXXX,    KC.DEBUG,
                                            XXXXXXX,    XXXXXXX,    XXXXXXX,            XXXXXXX,    XXXXXXX,    _______
    ]
]

if __name__ == '__main__':
    keyboard.go()
