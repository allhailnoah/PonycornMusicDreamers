Navi - a message library for LOVE
written by litearc
LOVE forum topic: https://love2d.org/forums/viewtopic.php?f=5&t=9265

-------------
~~~ Intro ~~~
-------------
Hi everyone, thanks for downloading Navi, a message system I wrote for LOVE.
Navi refers to the little fairy from Zelda who interrupts you randomly with
different messages, hence the title of the library. Navi lets you create
messages like those found in most RPGs. It has many features and is fairly easy
to use (I hope). The tutorial can get you started, but if you plan to use this
in a game, it may help to read through everything so you know what is and isn't
featured in the library. The demo which shows off many of these features may
also help. If you would like any features to be implemented, let me know and if
it's easy enough, I'll add them in. Also, don't forget to report bugs! This was
written in LOVE v0.8.0, but it should work in older versions.

----------------
~~~ Tutorial ~~~
----------------
Before we start, I want to make a quick note about the way Navi is packaged.
Navi uses various resources that are shared with other libraries, so I packaged
these resources into an object called 'arc'. Thus, to use Navi, you need to
first load the 'arc' module.

To use Navi:

1.  Load the required libraries:
    
    arc_path = 'arc/'
    require(arc_path .. 'arc')
    _navi = require(arc_path .. 'navi')

    The global variable 'arc_path' is the directory the modules are stored in
    with respect to 'main.lua'.

2.  Setup 'arc' by including the following calls inside the 'love' functions:

    function love.keypressed(k)
        arc.set_key(k)
    end

    function love.update(dt)
        arc.check_keys(dt)
    end
    
    function love.draw()
        arc.clear_key()
    end

    This assumes the default 'love.run()' function, so it may differ if you're
    using a custom function. The important thing is to call the 'arc' functions
    in the following order: arc.set_key(), arc.check_keys(), arc.clear_key()

3.  Create a Navi message:

    msg = _navi:new('Hello world!')
    
4.  Play the message by including a call in 'love.draw()':

    msg:play(0,0)
    
    This call needs to be included above 'arc.clear_key()'.
    
You should see a message pop up in the top-left of the screen. There are a lot
of options you can specify to modify the message. If you leave them out as you
did here, then default values are filled in. The reference below explains Navi's
various features and how to use them.

-----------------------
~~~ Class Functions ~~~
-----------------------

_navi:new(s, opt)
(_navi): The constructor function used to create a message.

    s       (string): String to display. It can contain 'formatters'
            that are not displayed but instead have some effect on the message.
            (see the 'Formatters' section).
    opt     (table): (optional) Table of options to control various aspects of
            the message. If options are left out, default values are used (see
            'Options' section).

_navi:init()
Initializes the message to make it ready for use. It is automatically called by
the constructor, but if you want to replay the message, you can call it again.

_navi:play(x, y)
Plays out the message.
    x,y     The x and y display coordinates of the message.

_navi:is_over()
(boolean): Returns whether the message is done playing out.

_navi:get_pick()
(number): Returns the choice picked by the player. If the message has no
choices or if called before a choice is selected, it returns nil.

_navi.play_list(m, x, y)
Plays out a list of messages sequentially.
    m       (array of _navi objects): List of messages to play out.
    x,y     The x and y display coordinates of the messeges.

------------------
~~~ Formatters ~~~
------------------

Formatters are pieces of string that are not displayed but instead have some
effect on the message.

    Formatter       Description
    ----------------------------------------------------------------------------
    |cRRGGBBAA      Changes the text color. The color is defined by the
                    letter-pairs. RR: red, GG: green, BB: blue, AA: alpha.
    |c{name}        Changes the text color (alternate way). The color is
                    looked up in the table 'arc.col'. i.e. "|c{red}" changes the
                    text color to 'arc.col.red'.
    
    |n              Inserts a newline.
    
    |m              Continues the message in the next message box This
                    formatting option only works with the option 'nrows'.
    
    |!              Pauses the message until the 'arc.btn.ent' key is pressed.
    
    |,              Pauses the message (short).
    |:              Pauses the message (long).
                    The pauses are equal to the time it takes to display a
                    certain number of characters, and so, are message-speed
                    dependent. You can define the # of characters in 'arc.cfg'

---------------
~~~ Options ~~~
---------------

Options control a wide range of different aspects of the message. If an option
isn't specified, a default value is assigned. This happens inside '_navi:new()'
at the very top. The default values are hard-coded in.

    Option          Description
    ----------------------------------------------------------------------------
    w               (number): Width used to wrap the text. Note: if 'face'
                    is specified, the width is decreased so that the total box
                    width remains the same.
    wbox            (number): Width of the message box.
                    Note: Don't use both 'w' and 'wbox' options together.
                    If you set one, the other is automatically calculated.
        
    x,y             (number): The x and y shifts of the display coordinates.
                    Note: Display coordinates refer to the position of the text,
                    not the message box. i.e. if (x=0, y=0) and the message is
                    displayed at (0,0), the top-left point of the text will be
                    at (0,0).
                
    alx             (string): Horizontal text alignment inside the message box.
                    This doesn't change the position of the box, but only the
                    text inside the box.
                    alx = 'l': left, 'm': middle, 'r': right
    
    alxb,alyb       (string): Message box alignment about the display coordinates.
                    alxb = 'l': left, 'm': middle, 'r': right.
                    alyb = 't': top, 'm': middle, 'b': bottom
                
    wait            (number OR nil): If wait == nil, the message ends once
                    'arc.btn.ent' is pressed. If wait is a number, the message
                    ends after 'wait' seconds.
    
    skip            (boolean): Controls whether the message can be skipped by
                    pressing 'arc.btn.ent'.
                    skip = true: skippable, false: not skippable
    
    msg_spd         (number): The number of characters per second to display.
    
    instant         (boolean): Controls whether the message displays instantly.
                    instant = true: instant, false: not instant
    
    box             (boolean): Controls whether a message box is displayed.
                    box = true: show message box, false: don't show message box
    
    box_anim        (boolean): Controls whether to show an open/close animation
                    for the message box.
                    box_anim = true: show animation, false: don't show animation
    
    name            (string OR nil): Shows a name above the message. If used,
                    the message starts on the next line. If name == nil, no name
                    is shown.
    
    face            (Image OR nil): Shows a picture next to the message.
    
    face_pos        (string): Side of the message the 'face' picture appears on.
                    face_pos = 'l': left side, 'r': right side
                
    face_border     (boolean): Controls whether to draw a border around the face.
                    face_border = true: draw border, false: don't draw border
    
    blinker         (boolen): Controls whether to show a message blinker, which
                    indicates when to press the 'arc.btn.ent' key.
                    blinker = true: show blinker, false: don't show blinker
    
    scroll          (boolean): Controls whether the message scrolls. If 'nrows'
                    is set and the message spans multiple boxes, this option
                    scrolls the message up after each box completes.
                    scroll = true: scroll messages, false: don't scroll messages
    
    choices         (array of strings OR nil): List of choices to pick from at
                    the end of the message.
    
    nvchs           (number): Number of choices the message box holds. If this
                    is less than the number of choices, a scroll bar appears to
                    indicate the non-displayed choices.
    
    nrows           (number): Number of rows of message box holds. If this is
                    less than the number of rows in the message, the message is
                    split into multiple boxes.

---------------------
~~~ Customization ~~~
---------------------

Customizing Navi requires changing resource files (i.e. font file) or editing
small bits of code (or both), depending on what you want to do.

    Property    How to edit
    ----------------------------------------------------------------------------
    font        Set 'arc.fn' to your own font.
    
    cursor      Set 'arc.img.cursor' to your own image.
                Note: you may need to change arc.cfg.cur_dx and arc.cfg.cur_dy
                to position the cursor properly with respect to the text.
                (also, see 'draw.cursor()' in 'draw.lua')
                
    blinker     Set 'arc.img.blinker' to your own image.
                (also, see '_navi:show_blinker()' in 'navi.lua')
    
    window      Edit 'draw.window()' in 'draw.lua'

The positions of various items in the message box are set in '_navi:set_pos()'
in 'navi.lua'. You can edit the code here to further customize the way
messages look, but only if you know what you're doing. I won't go into the
details, but it isn't too difficult to figure out.

-------------
~~~ Notes ~~~
-------------

The Navi library isn't "smart" - it executes calls without performing any
checks. For example:

    -   It uses whatever options are specified, even if they don't make sense
        together. i.e.
        (choices=nil, nvchs=4)
        (box=false, box_anim=true)
        (using the formatter "|m" and nrows=nil)
    
    -   It doesn't check if the color arc.col[name] exists when the formatter
        "|c{name}" is used.
        
    -   It doesn't scale a face picture when it doesn't fit in the message box,
        so the picture will extend beyond the box boundaries.

This library doesn't check for such 'mistakes', so they aren't handled in any
elegant way, partly so you can catch those mistakes and fix them (and partly
because I'm lazy).

------------------------
~~~ Acknowledgements ~~~
------------------------

Anyway, that's it! Thanks to the LOVE developers for creating such a great
program and to the LOVE community for their support and interest.