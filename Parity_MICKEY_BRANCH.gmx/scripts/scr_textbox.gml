///scr_textbox("text", font, key_press, txtSpeed, sfx);

/* 

//----------- ARGUMENTS -----------//

"text" - obviously the string you will pass onto the script
font - the kind of font you want to display on screen
key_press - button assigned to skip text/speed up, move to next slide, start/exit dialogue
txtSpeed - how fast the text will print on screen
sfx - The sound effect you wish to use (type in 'noone' if no sound effect is desired).

*/

//Initialize Vars

txt = argument0;
font = argument1;
key_press = argument2;
txtSpeed = argument3;
sfx = argument4;

//Normalize speed of text
if txtSpeed <= 1 textSpeed = 1;
if txtSpeed >= 15 textSpeed = 15;

//Set speed of text
global.maxPrintTimer = txtSpeed;

//For measuring purposes
draw_set_font(font);

// sample text for spacing purposes
sampleTxt = "sample";
sTxt_height = string_height(sampleTxt)*2;

// Store the txt in a cache "folder" for recalling purposes
if global.txtCache == ""{
    global.txtCache = txt;
}

//Padding for inside dialogue box
var padding = 32;

//Max width & height
max_width = view_wview - (padding*2);
max_height = (view_hview/4)-(.25*(view_hview/4));

// Txt measurements
txt_length = string_length(txt);
txt_width = string_width(txt);

// Placeholder Variables
new_txt = "";
current_txtW = string_width(new_txt);
ntl = string_length(new_txt); // new_txt_length

//Will group wall of text into paragraph (if necessary); Will only run once
if (txt_width > max_width) {
    
    for (i=1; i < txt_length+1; i++)
    {
        new_txt += string_copy(txt,i,1); //do not register enter presses, youre gonna need a temp var
        current_txtW = string_width(new_txt);
        ntl = string_length(new_txt); // new txt length
        
        if current_txtW > max_width
        {
            if string_char_at(new_txt,ntl) == " " {
                new_txt = string_delete(new_txt,ntl,1);
                new_txt += "#";
                new_txt += string_copy(txt,i,1);
                ntl = string_length(new_txt);
                if string_char_at(new_txt,ntl) == " "
                {
                    new_txt = string_delete(new_txt,ntl,1);    
                }
            } else {
                for (n = ntl; string_char_at(new_txt,n) != " "; n--){
                    var num = n;   
                }
                var temp_txt =  string_copy(new_txt,num,30);
                new_txt =  string_delete(new_txt,num,30);
                new_txt += "#";
                new_txt += temp_txt;           
            }
        }
    }
}

//Conversion
if new_txt != "" {txt = new_txt; txt_width = string_width(txt);}

//Variable for next part...
new_txt_height = string_height_ext(txt,sTxt_height,max_width);

//Will divide paragraph of text and place remaining characters into a placeholder variable
//will run as many times as necessary. The smaller the string argument passed, the fewer times this will run.
if (new_txt_height > max_height){
    new_txt = txt; // conversion once more
    new_txt_height = string_height_ext(new_txt,sTxt_height,max_width);
    
    // put into place holder
     while(new_txt_height > max_height)
     {
        var tempChar = string_copy(new_txt,string_length(new_txt),1);
        global.temp_placeholderTxt += tempChar;
        new_txt = string_delete(new_txt,string_length(new_txt),1);
        new_txt_height = string_height_ext(new_txt,sTxt_height,max_width);
     }
     //Reverse order
     while(string_length(global.temp_placeholderTxt) > 0){
        global.placeholderTxt += string_copy(global.temp_placeholderTxt,string_length(global.temp_placeholderTxt),1);
        global.temp_placeholderTxt = string_delete(global.temp_placeholderTxt,string_length(global.temp_placeholderTxt),1);
     }
}

//Final Conversion
if new_txt != "" {txt = new_txt;}

//If you can skip/speed up the text...
if !keyboard_check(key_press)
{
    if global.maxPrintTimer >= 1 global.maxPrintTimer = 0;
} else {
    global.maxPrintTimer = txtSpeed;
} 

//txt_length = string_length(txt);

// Print stuff out from txt
if global.printTimer <= 0 && (global.txtIndex < txt_length+1) {
    global.display_txt += string_copy(txt,global.txtIndex,1);
    global.printTimer = global.maxPrintTimer;
    global.txtIndex++;

    //If you've included a sound effect, then play the sound effect (duh!)
    if sfx != noone {    
        //Sound Effects
        var charSFX = global.display_txt;
        charSFX = string_char_at(global.display_txt,string_length(global.display_txt));
        
        if charSFX != " " {
            if audio_is_playing(sfx)
            {
                audio_stop_sound(sfx);
                audio_play_sound(sfx,5,false);
            }
            audio_sound_gain(sfx,.1,0);
            audio_play_sound(sfx,5,false);
        }
    }
}

//Move onto next slide of text or exit dialogue
if global.txtIndex >= txt_length && key_press
{
    global.display_txt = "";
    txt = global.placeholderTxt;
    global.placeholderTxt = "";
    global.temp_placeholderTxt = "";
    global.txtIndex = 1;
    global.maxPrintTimer = txtSpeed;
}

//Timer for speed at which characters print on screen
if global.printTimer > 0 global.printTimer--;

// Draw Variables
draw_set_font(font);

// Draw dialogue box
draw_set_alpha(0.5);
draw_set_color(c_blue);
draw_rectangle(view_xview,((view_yview+view_hview)-max_height)-(padding*1.5),(view_xview + view_wview),view_yview+view_hview,false);
draw_set_alpha(1);

// Rectangle Borders
var bw = 4; // Border width
draw_set_color(c_white);
draw_line_width(view_xview, ((view_yview+view_hview)-max_height)-(padding*1.5), view_xview, (view_yview+view_hview), bw);
draw_line_width(view_xview-(bw/2), ((view_yview+view_hview)-max_height)-(padding*1.5), view_xview+view_wview, ((view_yview+view_hview)-max_height)-(padding*1.5), bw);
draw_line_width(view_xview+view_wview-bw/2, ((view_yview+view_hview)-max_height)-(padding*1.5), view_xview+view_wview-bw/2, (view_yview+view_hview), bw);
draw_line_width(view_xview, (view_yview+view_hview)-bw/2, view_xview+view_wview, (view_yview+view_hview)-bw/2, bw);



// Draw Text On Screen
draw_set_color(c_white);
draw_text_ext(view_xview+padding,((view_yview+view_hview)-max_height)-(padding/2),global.display_txt,sTxt_height,max_width);

// Quit Dialogue/Textbox Event
if txt == "" && global.placeholderTxt == ""{
    global.tboxActive = false;
    txt = global.txtCache;
    global.txtCache = "";
}

return txt;
