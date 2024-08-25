# vim: ts=4 syn=perl:
# $Id: sample.mmcrc,v 1.2 2000/05/16 12:00:22 mike Exp $ # Bookmarks: 0,0 0,0 0,0 0,0 0,0 0,0 0,0 0,0 0,0 37,422 # Bookmarks: 0,0 0,0 0,0 0,0 0,0 0,0 0,0 0,0 0,0 1,424 # Bookmarks: 0,0 0,0 0,0 0,0 0,0 0,0 0,0 0,0 0,0 0,424; CollapsedSubs: CMD
# Последняя рабочая версия

use Pinger;
use Char;

my $mmc = $ENV{MMC} || $ENV{MMC} || $ENV{HOME} || '.';

# включаем лог в файл $MMC/<дата>.log
my @Time = localtime;
$Time[4]=$Time[4]+1;
my $day=""; if ($Time[3] < 10) { $day = sprintf("%02d",$Time[3]); } else { $day = sprintf("%2d",$Time[3]); }
my $mon=""; if ($Time[4] < 10) { $mon = sprintf("%02d",$Time[4]); } else { $mon = sprintf("%2d",$Time[4]); }
MUD::logopen( sprintf ("./logs/$Char::my_name-%2d-$mon-$day.log", $Time[5]+1900 ) );

CMD::cmd_ticksize(62);CMD::cmd_tickset;

$U::tank = $Char::my_name;
$U::leader = $Char::my_name;

CL::statusconf($Conf::status_type, $Conf::status_height=3);

### Color table
#COLOR              Code
#===========================
# Black             \003A
# Red               \003B
# Green             \003C
# Brown             \003D
# Blue              \003E
# Magenta           \003F
# Light blue        \003G
# Light gray        \003H
# Gray              \003I
# Bright red        \003J
# Bright green      \003K
# Yellow            \003L
# Bright blue       \003M
# Pink              \003N
# Bright blue       \003O
# White             \003P

$U::gods = "\003AGo";
$U::wraith = "\003B";
$U::spectral = "\003C";
$U::sanc = "\003D";
$U::aegis = "\003E";
$U::wall = "\003F";
$U::cloak = "\003G";
$U::darkness = "\003H";
$U::stone = "\003I";
$U::iron = "\003J";

$U::gods = "\003AGw";
$U::brothers = "\003ABv";
$U::bless = "\003ABl";
$U::armor = "\003AAr";
$U::flui = "\003AFl";
$U::lite = "\003AAe";
$U::visage = "\003AVi";
$U::corona = "\003ACo";
$U::stamina = "\003ASt";
$U::regeneration = "\003ARg";
$U::haste = "\003AIh";

$Flags = ' 'x8;

new_svy($U::_ticker, 0, 4);
new_svy($U::gods, 0, 2);
new_svy($U::brothers, 0, 2);
new_svy($U::bless, 0, 2);
new_svy($U::armor, 0, 2);
new_svy($U::flui, 0, 2);
new_svy($U::lite, 0, 2);
new_svy($U::visage, 0, 2);
new_svy($U::corona, 0, 2);
new_svy($U::stamina, 0, 2);
new_svy($U::regeneration, 0, 2);
new_svy($U::haste, 0, 3);
new_svy($U::target, 0, 25);
new_svy($Flags, 1, 9, 9);

##Bless Grace
trig {
  $U::bless = "\003CBl";
} '^You feel righteous\.$', '1000n:SPELLS_MONITORING';

trig {
  $U::bless = "\003ABl";
} '^You feel less righteous\.$', '1000n:SPELLS_MONITORING';

trig {
  $U::bless = "\003LBl";
} '^The \'bless\' spell on you is about to wear off\.$', '1000n:SPELLS_MONITORING';

#Armor Stone skin Petrified armor
trig {
  $U::armor = "\003CPa";
} '^Long petrified bones grow out from your ribcage and encase your body\.$', '1000n:SPELLS_MONITORING';

trig {
  $U::armor = "\003APa";
} '^Your armor of petrified bones crumbles to dust\.$', '1000n:SPELLS_MONITORING';

trig {
  $U::armor = "\003LPa";
} '^The \'petrified armor\' spell on you is about to wear off\.$', '1000n:SPELLS_MONITORING';

#Fluidity
trig {
  $U::flui = "\003CFl";
} '^Your body mass slowly changes from solid to gelatinous\.$', '1000n:SPELLS_MONITORING';

trig {
  $U::flui = "\003AFl";
} '^Your body returns to its natural solid state\.$', '1000n:SPELLS_MONITORING';

trig {
  $U::flui = "\003LFl";
} '^The \'(greater )?fluidity\' spell on you is about to wear off\.$', '1000n:SPELLS_MONITORING';

#Haste Improved haste
trig {
  $U::haste = "\003CIh";
} '^You seem to move in very fast motion\.$', '1000n:SPELLS_MONITORING';

trig {
  $U::haste = "\003AIh";
} '^Woof, you feel so tired!$', '1000n:SPELLS_MONITORING';

trig {
  $U::haste = "\003LIh";
} '^The \'(improved )?haste\' spell on you is about to wear off\.$', '1000n:SPELLS_MONITORING';

#Shield of faith Sanctuary Wall Aegis Flesh golem
trig {
  $U::lite = "\003CAe";
} '^You are surrounded by a radiant light\.$', '1000n:SPELLS_MONITORING';

trig {
  $U::lite = "\003AAe";
} '^The radiant sphere around your body fades\.$', '1000n:SPELLS_MONITORING';

trig {
  $U::lite = "\003LAe";
} '^The \'aegis\' spell on you is about to wear off\.$', '1000n:SPELLS_MONITORING';

#Visage
trig {
  $U::visage = "\003CVi";
} '^(Your skin shrivels and sags as you take on a hideous undead visage)|(Your skin becomes beautifully pale as you take on an elegant undead visage)\.$', '1000n:SPELLS_MONITORING';

trig {
  $U::visage = "\003AVi";
} '^Your visage returns to normal\.$', '1000n:SPELLS_MONITORING';

trig {
  $U::visage = "\003LVi";
} '^The \'undead visage\' spell on you is about to wear off\.$', '1000n:SPELLS_MONITORING';

#Gods of war Lion chorus
trig {
  $U::gods = "\003CGw";
} '^Your song engulfs you into the spirit of battle!$', '1000n:SPELLS_MONITORING';

trig {
  $U::gods = "\003AGw";
} '^The song ends and you are less inspired by the deeds of the war gods\.$', '1000n:SPELLS_MONITORING';

#Brothers in va
trig {
  $U::brothers = "\003CBv";
} '^You are greatly inspired by your song!$', '1000n:SPELLS_MONITORING';

trig {
  $U::brothers = "\003ABv";
} '^As the song ends, a calm feeling overtakes your party\.$', '1000n:SPELLS_MONITORING';

#Corona
trig {
  $U::corona = "\003CCo";
} '^(You feel more magically charged\.)|(You are overcome in magical ability!)$', '1000n:SPELLS_MONITORING';

trig {
  $U::corona = "\003ACo";
} '^You feel less magically charged\.$', '1000n:SPELLS_MONITORING';

trig {
  $U::corona = "\003LCo";
} '^The \'corona\' spell on you is about to wear off\.$', '1000n:SPELLS_MONITORING';

#Stamina
trig {
  $U::stamina = "\003CSt";
} '^A feeling of increased power courses through your body\.$', '1000n:SPELLS_MONITORING';

trig {
  $U::stamina = "\003ASt";
} '^You feel less resilient\.$', '1000n:SPELLS_MONITORING';

trig {
  $U::stamina = "\003LSt";
} '^The \'stamina\' spell on you is about to wear off\.$', '1000n:SPELLS_MONITORING';

#Regeneration
trig {
  $U::regeneration = "\003CRg";
} '^You suddenly feel incredibly healthy and vigorous!$', '1000n:SPELLS_MONITORING';

trig {
  $U::regeneration = "\003ARg";
} '^You suddenly feel slightly less healthy\.\.\.$', '1000n:SPELLS_MONITORING';

trig {
  $U::regeneration = "\003LRg";
} '^The \'regeneration\' spell on you is about to wear off\.$', '1000n:SPELLS_MONITORING';

# Особо опасные ситуации. Такие проблемы показываются в строке состояния
my %flags = (
  P => 0,                 #poison
  W => 1,                 #web
  B => 2,                 #bash
  C => 3,
  S => 4,                 #Silence
  R => 5,
  D => 6,
  Z => 7,
);

sub Fset(*) {
  substr($Flags, $flags{$_[0]}, 1) = $_[0] if defined $flags{$_[0]};
}

sub Fclear(*) {
  substr($Flags, $flags{$_[0]}, 1) = ' ' if defined $flags{$_[0]};
}

trig {
  $: = "\003J$_";
  Fset P;
} '^You feel very sick\\.$', "n:HIGHLIGHT";

trig {
  $: = "\003J$_";
  Fset P;
} '^You feel burning poison in your blood, and suffer\\.$', "n:HIGHLIGHT";

trig {
  $: = "\003J$_";
  Fset W;
} '^You are covered in sticky webs!$', "n:HIGHLIGHT";

trig {
  $: = "\003L=== $_ ===";
  sendl('st') if $U::autostand;
  Fset B;
} q(^[A-Za-z ',]+ kick knocks you back a few feet and you fall to the ground\\.$), "g:HIGHLIGHT";

trig {
  $: = "\003L=== $_ ===";
  sendl('st') if $U::autostand;
  Fset B;
} '^The momentum of your kick brings you crashing to the ground\\.$', "g:HIGHLIGHT";

trig {
  $: = "\003L=== $_ ===";
  sendl('st') if $U::autostand;
  Fset B;
} '^You are sent sprawling', "n:HIGHLIGHT";

trig {
  $: = "\003J$_";
  Fset C;
} '^You fall under the influence of', "n:HIGHLIGHT";

trig {
  $: = "\003J$_";
  Fset S;
} '^You suddenly lose all feeling of your mouth and tongue\\.$', "n:HIGHLIGHT"; #ispravit' na silence


# Окончание проблем
trig {
  $: = "\003C$_";
  Fclear P;
} '^A warm feeling runs through your body\\.$', "n:HIGHLIGHT";

trig {
  $: = "\003C$_";
  Fclear W;
} '^You break free of the webs!$', "n:HIGHLIGHT";

trig {
  $: = "\003C$_";
  Fclear W;
} '^Many spiders crawl upon you and start removing the webs\.\.\.$', "n:HIGHLIGHT";

#GROUP TRIGGERS AND ALIASES
trig {
  if (($1 eq $U::leader) and (($2 eq $U::prefix." ") or ($U::prefix eq ""))) { sendl("|\r\ncast 'word of recall'"); }
} '^(\w+) -- \'([\s\S]*)recall\'$',"2000n:GROUP";

trig {
  if (($1 eq $U::leader) and (($2 eq $U::prefix." ") or ($U::prefix eq ""))) { sendl("|\r\ncast 'undead visage'"); }
} '^(\w+) -- \'([\s\S]*)visage\'$',"2000n:GROUP";

trig {
  if (($1 eq $U::leader) and (($2 eq $U::prefix." ") or ($U::prefix eq ""))) { sendl("|\r\ncast 'mindbar'"); }
} '^(\w+) -- \'([\s\S]*)mindbar\'$',"2000n:GROUP";

trig {
  if (($1 eq $U::leader) and (($2 eq $U::prefix." ") or ($U::prefix eq ""))) { sendl("|\r\ncast 'spectral shield'"); }
} '^(\w+) -- \'([\s\S]*)spectrals\'$',"2000n:GROUP";

trig {
  if ($1 eq "word of recall") { sendl("|\r\ncast 'word of recall'"); }
  if ($1 eq "undead visage") { sendl("|\r\ncast 'undead visage'"); }
  if ($1 eq "mindbar") { sendl("|\r\ncast 'mindbar'"); }
  if ($1 eq "spectral shield") { sendl("|\r\ncast 'spectral shield'"); }
} 'You failed to cast \'([a-z ]+)\'',"2000n:GROUP";

trig {
  if (($1 eq $U::leader) and (($2 eq $U::prefix." ") or ($U::prefix eq ""))) { sendl("|\r\nentrench"); }
} '^(\w+) -- \'([\s\S]*)entrench\'$',"2000n:GROUP";

trig {
  sendl("|\r\nentrench");	
} '^You fail in your attempt to dig in\\.$',"2000n:GROUP";


trig {
  if (($1 eq $U::leader) and (($2 eq $U::prefix." ") or ($U::prefix eq ""))) { sendl("rem chopper\r\ndrop all.chopper"); }
} '^(\w+) -- \'([\s\S]*)drop choppers\'$',"2000n:GROUP";

trig {
  if (($1 eq $U::leader) and (($2 eq $U::prefix." ") or ($U::prefix eq ""))) { sendl("enter portal"); }
} '^(\w+) -- \'([\s\S]*)portal\'$',"2000n:GROUP";

trig {
  if (($1 eq $U::leader) and (($2 eq $U::prefix." ") or ($U::prefix eq ""))) { sendl("enter archway"); }
} '^(\w+) (enters the glowing archway and disappears from sight)|(enters the archway and disappears from sight)\\.$',"2000n:GROUP";

trig {
  if (($1 eq $U::leader) and (($2 eq $U::prefix." ") or ($U::prefix eq ""))) { sendl("enter portal"); }
} '^(\w+) (steps through the portal and disappears!)|(has just entered the portal\\.)$',"2000n:GROUP";

trig {
  if (($1 eq $U::leader) and (($2 eq $U::prefix." ") or ($U::prefix eq ""))) { $U::target = "$3" }
} '^(\w+) -- \'([\s\S]*)target ([a-zA-Z0-9\.\-]+)\'',"2000n:GROUP";

trig {
  if (($1 eq $U::leader) and (($2 eq $U::prefix." ") or ($U::prefix eq ""))) { sendl("wake\r\nstand"); }
} '^(\w+) -- \'([\s\S]*)all up\'',"2000n:GROUP";

trig {
  if (($1 eq $U::leader) and (($2 eq $U::prefix." ") or ($U::prefix eq ""))) { sendl("sleep"); }
} '^(\w+) -- \'([\s\S]*) catch\'',"2000n:GROUP";

trig {
  if (($1 eq $U::leader) and (($2 eq " ".$U::prefix) or ($U::prefix eq ""))) { sendl("sneak\r\nsneak\r\nsneak"); }
} '^(\w+) -- \'([\s\S]*) sneak\'',"2000n:GROUP";

trig {
  if (($1 eq $U::leader) and (($2 eq " ".$U::prefix) or ($U::prefix eq ""))) { sendl("stalk"); }
} '^(\w+) -- \'([\s\S]*) stalk\'',"2000n:GROUP";

trig {
  sendl("stalk");
} '^Your attempt to stalk fails\.$',"2000n:GROUP";

sub CMD::cmd_target {
  $U::target = $_[0];
}

sub CMD::cmd_gtarget {
  $U::target = $_[0];
  sendl("gt target $U::target")
}

sub CMD::cmd_leader {
  $U::leader = $_[0];
  $U::prefix = $_[1];
}

sub CMD::cmd_tank {
  $U::tank = $_[0];
}

sub CMD::cmd_holdfrontline {
  $Char::holdfrontline=!($Char::holdfrontline);
  if ($Char::holdfrontline) { echo("I will hold front line!"); } else { echo("I will watch group from back!"); };
}

trig {
  if (!($Char::holdfrontline)) { sendl("|");sendl("man back"); }
} '^Your front line collapses!  Your group is thrown into chaos!$|^You stumble as you try to move to the rear of the group\.$',"2000n:GROUP";

trig {
  if ($1 eq $U::tank) { sendl("warcry $2"); }
} '^(\w+) yells \'(.+)\'$',"2000n:GROUP";




#modnii track
alias { $U::trackmob=$_[0];sendl("track $U::trackmob") } tra;
alias { $U::trackmob=$U::target;sendl("track $U::trackmob") } trat;

trig {
  sendl("$1");sendl("track $U::trackmob");
} 'lead (\w+)ward\.$', "2000n:SWALK";

#PINGER
hook {Pinger::ping_proceed; } "tick";

sub CMD::cmd_pingerhelp {
  echo("/pingtome");
  echo("/pingtogroup");
  echo("/showstatus");
  echo("/addmob");
  echo("/showlist");
  echo("/showlistback");
  echo("/remmobname");
  echo("/showmobname");
};

sub CMD::cmd_pingtome { Pinger::ping_to_me; };
sub CMD::cmd_pingtogroup { Pinger::ping_to_group; };
sub CMD::cmd_showstatus { Pinger::show_status; };
sub CMD::cmd_addmob { Pinger::add_mob(@_); };
sub CMD::cmd_showlist { Pinger::show_list(); };
sub CMD::cmd_showlistback { Pinger::show_list_background() };
sub CMD::cmd_remmobname { Pinger::del_mob_by_name(@_); };
sub CMD::cmd_showmobname { Pinger::show_mob_name(@_); };

#Тикер
#Погода
trig {CMD::cmd_tickset;Pinger::ping_proceed;} '^It starts to rain', "1000n:TICK";
trig {CMD::cmd_tickset;Pinger::ping_proceed;} '^The rain stopped', "1000n:TICK";
trig {CMD::cmd_tickset;Pinger::ping_proceed;} '^The sky is getting', "1000n:TICK";
trig {CMD::cmd_tickset;Pinger::ping_proceed;} '^The sun slowly', "1000n:TICK";
trig {CMD::cmd_tickset;Pinger::ping_proceed;} '^The night has begun', "1000n:TICK";
trig {CMD::cmd_tickset;Pinger::ping_proceed;} '^The sun rises', "1000n:TICK";
trig {CMD::cmd_tickset;Pinger::ping_proceed;} '^The clouds disappear', "1000n:TICK";
trig {CMD::cmd_tickset;Pinger::ping_proceed;} '^Lightning starts', "1000n:TICK";
trig {CMD::cmd_tickset;Pinger::ping_proceed;} '^The day has begun', "1000n:TICK";
trig {CMD::cmd_tickset;Pinger::ping_proceed;} '^The lightning has stopped', "1000n:TICK";

trig {
  if ($U::sleeping eq 3) {
    sendl ("wake\r\ndri $Char::water_container\r\nslee")
  }
  else {
    sendl ("dri $Char::water_container")
  }
} '^You are thirsty', "1000n:COMM";

trig {
  if ($U::sleeping eq 3) { sendl ("wake\r\nstand") };
} '^As the room closes up around you', "1000n:COMM";

#Триггеры на вставание\сидение :)
trig {
 $U::sleeping = 0;
} '^You stand up\\.', "1000n:COMM";

trig {
 $U::sleeping = 0;
} '^You stop resting, and stand up\\.', "1000n:COMM";

trig {
 $U::sleeping = 1;
} '^You wake, and sit up\\.', "1000n:COMM";

trig {
 $U::sleeping = 2;
} '^You sit down and rest your tired bones\\.', "1000n:COMM";

trig {
 $U::sleeping = 3;
} '^You go to sleep\\.', "1000n:COMM";

alias {sendl("wake\r\nstand");} "was";

alias {
  if ($_[0] =~ /^([a-zA-Z0-9\.\-]+)$/) {
    CMD::cmd_target($_[0]);sendl("deathgrip $U::target");
  } else {sendl("deathgrip $U::target");}
} "dd";

alias {
  if ($_[0] =~ /^([a-zA-Z0-9\.\-]+)$/) {
    CMD::cmd_target($_[0]);sendl("wraithtouch $U::target");
  } else {sendl("wraithtouch $U::target");}
} "wt";

alias {
  if ($_[0] ne "") {
    sendl("strike $_[0]");
  } else {sendl("strike")}
} "ss";

alias {
	   sendl("strike $U::target")
} "sst";

alias {
       sendl("backstab $U::target")
} "bt";

alias {sendl("look $U::target");} "lt";
alias {sendl("kill $U::target");} "kt";

#COMBAT
alias { sendl("cast 'fireball' @_[0]") } "fb";
alias { sendl("cast 'fireball' $U::target") } "fbt";
alias { sendl("cast 'dispel evil' @_[0]") } "de";
alias { sendl("cast 'dispel evil' $U::target") } "det";
alias { sendl("cast 'acid blast' @_[0]") } "ab";
alias { sendl("cast 'acid blast' $U::target") } "abt";
alias { sendl("cast 'firewind' @_[0]") } "fw";
alias { sendl("cast 'firewind' $U::target") } "fwt";
alias { sendl("cast 'web' @_[0]") } "web";
alias { sendl("cast 'web' $U::target") } "webt";
alias { sendl("cast 'disi' @_[0]") } "disi";
alias { sendl("cast 'disi' $U::target") } "dist";
alias { sendl("cast 'ice ray' @_[0]") } "ir";
alias { sendl("cast 'ice ray' $U::target") } "irt";
alias { sendl("cast 'ice strom'") } "is";
alias { sendl("cast 'blindness' @_[0]") } "bld";
alias { sendl("cast 'blindness' $U::target") } "bldt";
alias { sendl("cast 'curse' @_[0]") } "cs";
alias { sendl("cast 'curse' $U::target") } "cst";
alias { sendl("cast 'demon bind' @_[0]") } "db";
alias { sendl("cast 'demon bind' $U::target") } "dbt";
alias { sendl("cast 'demon touch' @_[0]") } "dt";
alias { sendl("cast 'demon touch' $U::target") } "dtt";
alias { sendl("cast 'demon touch' @_[0]") } "dt";
alias { sendl("cast 'demon touch' $U::target") } "dtt";
alias { sendl("cast 'weaken' @_[0]") } "wk";
alias { sendl("cast 'weaken' $U::target") } "wkt";
alias { sendl("cast 'faerie fire' $U::target") } "ff";

#ENCHANT
alias { sendl("cast 'spell shield' @_[0] 40") } "sshield";
alias { sendl("cast 'spectral shield'") } "spectral";
alias { sendl("cast 'wraithform'") } "wra";
alias { sendl("cast 'resist web'") } "rsw";

alias { $victim = $Char::my_name;
  if (@_[0] ne "") { $victim = @_[0]; };
  sendl("cast 'infravision' $victim"); } "infra";
alias { $victim = $Char::my_name;
  if (@_[0] ne "") { $victim = @_[0]; };
  sendl("cast 'fly' $victim");} "fly";
alias { $victim = $Char::my_name;
  if (@_[0] ne "") { $victim = @_[0]; };
  sendl("cast '$Char::bless' $victim");} "bl";
alias { $victim = $Char::my_name;
  if (@_[0] ne "") { $victim = @_[0]; };
  sendl("cast '$Char::armor' $victim");} "stone";
alias {
  sendl("cast 'improved haste'");
} "ihaste";
alias { $victim = $Char::my_name;
  if (@_[0] ne "") { $victim = @_[0]; };
  sendl("cast '$Char::lite' $victim"); } "lite";
alias { $victim = $Char::my_name;
  if (@_[0] ne "") { $victim = @_[0]; };
  sendl("cast 'wall' $victim"); } "wall";
alias { $victim = $Char::my_name;
  if (@_[0] ne "") { $victim = @_[0]; };
  sendl("cast 'dark cloak' $victim"); } "cloak";
alias { $victim = $Char::my_name;
  if (@_[0] ne "") { $victim = @_[0]; };
  sendl("cast 'invisibility' $victim"); } "invis";
alias { $victim = $Char::my_name;
  if (@_[0] ne "") { $victim = @_[0]; };
  sendl("cast 'water breathing' $victim"); } "wb";
alias { $victim = $Char::my_name;
  if (@_[0] ne "") { $victim = @_[0]; };
  sendl("cast 'darkness' $victim"); } "dark";
alias { $victim = $Char::my_name;
  if (@_[0] ne "") { $victim = @_[0]; };
  sendl("cast 'regeneration' $victim"); } "rg";

alias { sendl("cast '$Char::flui' $Char::my_name") } "flui";
alias { sendl("cast 'glamour' $Char::my_name") } "glamour";
alias { sendl("cast 'undead visage' $Char::my_name") } "visage";
alias { sendl("cast 'detect magic' $Char::my_name") } "dm";
alias { sendl("cast 'detect evil' $Char::my_name") } "dev";
alias { sendl("cast 'detect good' $Char::my_name") } "deg";
alias { sendl("cast 'detect invis' $Char::my_name") } "di";
alias { sendl("cast 'sense life' $Char::my_name") } "dl";
alias { sendl("cast 'darksight' $Char::my_name") } "ds";
alias { sendl("cast 'protection from evil' $Char::my_name") } "pfe";
alias { sendl("cast 'str'") } "str";
alias { sendl("cast 'unholy str'") } "ustr";
alias { sendl("cast 'aerial servant'") } "kom";
alias { sendl("cast 'mindbar'") } "mind";
alias { sendl("cast 'silence' @_[0]") } "sil";
alias { sendl("cast 'feast'") } "feast";

alias { sendl("cast 'locate object' @_[0]") } "locate";
alias { sendl("cast 'sleep' @_[0]") } "sleep";
alias { sendl("cast 'dark mace'") } "mace";
alias { sendl("cast 'cheat death'") } "cheat";
alias { sendl("cast 'familiar' @_[0]") } "fam";
alias { sendl("cast 'force field' @_[0]") } "field";
alias { sendl("cast 'gate' @_[0]") } "gate";
alias { sendl("cast 'passage' @_[0]") } "passage";
alias { sendl("cast 'lloyds beacon' @_[0]") } "llb";
alias { sendl("cast 'raise dead' @_[0]") } "raise";
alias { sendl("cast 'vision' @_[0]") } "vis";
alias { sendl("cast 'word of recall'") } "wrr";
alias { sendl("cast 'create food'\nget food\neat food") } "cfood";
alias { sendl("cast 'create water' $Char::water_container\ndri water") } "cwater";
alias { sendl("cast 'summon undead' @_[0]") } "call";
#HEAL AND REMOVE EFFECTS
alias { if (@_[0] ne "") { sendl("cast 'dispel magic' @_[0]"); } } "dism";
alias { sendl("cast 'dispel magic' $U::target") } "dismt";
alias { sendl("cast 'cure blind' @_[0]") } "cblind";

alias { $victim = $Char::my_name;
  if (@_[0] ne "") { $victim = @_[0]; };
  sendl("cast 'greater heal' $victim");} "gh";
alias { $victim = $Char::my_name;
  if (@_[0] ne "") { $victim = @_[0]; };
  sendl("cast 'heal' $victim");} "h";
alias { $victim = $Char::my_name;
  if (@_[0] ne "") { $victim = @_[0]; };
  sendl("cast 'restoration' $victim");} "rt";
alias { $victim = $Char::my_name;
  if (@_[0] ne "") { $victim = @_[0]; };
  sendl("cast 'refresh' $victim");} "refresh";
alias { $victim = $Char::my_name;
  if (@_[0] ne "") { $victim = @_[0]; };
  sendl("cast 'remove curse' $victim");} "rcurse";
alias { $victim = $Char::my_name;
  if (@_[0] ne "") { $victim = @_[0]; };
  sendl("cast 'remove poison' $victim");} "rpoison";

alias { sendl("cast 'greater heal' $U::tank") } "ght";
alias { sendl("cast 'heal' $U::tank") } "ht";
alias { sendl("cast 'restoration' $U::tank") } "rtt";

alias {
  if ($_[0] =~ /^(\d+)\.$/) {
    sendl("cast 'embalm' $1.corpse");
    return;
  }
  if ($_[0] =~ /^\d+$/) {
    for (my $i = 2; $i <= $_[0]; $i++) {
      sendl("cast 'embalm' $i.corpse");
    }
  }
  sendl("cast 'embalm' corpse");
} "embalm";


#bard songs
#lion chorus
alias  {
  if ($Char::bard_prime) {
    sendl("play 'lion chorus'");
  } else {
    sendl("sing 'lion chorus'")
  }
} "lion";

#wealth and glory

#call of the cuillen
#brothers in arms
alias  {
  if ($Char::bard_prime) {
    sendl("play 'brothers in $Char::brothers'");
  } else {
    sendl("sing 'brothers in $Char::brothers'")
  }
} "bro";

#beyond the shadows
#sanctuary for the soul
alias  {
  if ($Char::bard_prime) {
    sendl("play 'march of the heroes'");
  } else {
    sendl("sing 'march of the heroes'")
  }
} "march";
#fare thee well
alias  {
  if ($Char::bard_prime) {
    sendl("play 'dreams of the castle'");
  } else {
    sendl("sing 'dreams of the castle'")
  }
} "dreams";
alias  {
  if ($Char::bard_prime) {
    sendl("play 'gods of war'");
  } else {
    sendl("sing 'gods of war'")
  }
} "gods";

# Фолловерсы за работой
alias {
  if ( @_[0] eq '' ) { 
    sendl("order followers kill $U::target"); 
  } else {
    sendl("order followers kill @_[0]"); 
  };
} "ofk";

alias {
  if ( @_[0] eq '' ) { 
    sendl("order followers assist $U::tank"); 
  }  else { 
    sendl("order followers assist @_[0]"); 
  };
} "ofa";

alias { sendl("order followers @_"); } "of";

alias { sendl("order followers flee"); } "off";

trig {
 sendl("strike");
} '^Your strike at', "2000n-:AUTOSTRIKE";

trig {
 sendl("strike");
} '^You land a powerful strike into', "2000n-:AUTOSTRIKE";

trig {
 sendl("counter");
} '^You cease your counterattack stance.$|^You fumble your counter-attack stance\.$', "2000n:AUTOCOUNTER";

alias {
  sendl("cast 'knock' @_[0] @_[1]\r\n\ope @_[0] @_[1]");
} "knock";


MUD::conn "game.slothmud.org", 6101;