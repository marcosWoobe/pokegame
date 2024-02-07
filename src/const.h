////////////////////////////////////////////////////////////////////////
// OpenTibia - an opensource roleplaying game
////////////////////////////////////////////////////////////////////////
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
////////////////////////////////////////////////////////////////////////

#ifndef __CONST__
#define __CONST__
#include "definitions.h"

enum MagicEffect_t
{
	MAGIC_EFFECT_DRAW_BLOOD	= 0x00,
	MAGIC_EFFECT_LOSE_ENERGY	= 0x01,
	MAGIC_EFFECT_POFF		= 0x02,
	MAGIC_EFFECT_BLOCKHIT		= 0x03,
	MAGIC_EFFECT_EXPLOSION_AREA	= 0x04,
	MAGIC_EFFECT_EXPLOSION_DAMAGE	= 0x05,
	MAGIC_EFFECT_FIRE_AREA		= 0x06,
	MAGIC_EFFECT_YELLOW_RINGS	= 0x07,
	MAGIC_EFFECT_POISON_RINGS	= 0x08,
	MAGIC_EFFECT_HIT_AREA		= 0x09,
	MAGIC_EFFECT_TELEPORT		= 0x0A, //10
	MAGIC_EFFECT_ENERGY_DAMAGE	= 0x0B, //11
	MAGIC_EFFECT_WRAPS_BLUE	= 0x0C, //12
	MAGIC_EFFECT_WRAPS_RED	= 0x0D, //13
	MAGIC_EFFECT_WRAPS_GREEN	= 0x0E, //14
	MAGIC_EFFECT_HITBY_FIRE	= 0x0F, //15
	MAGIC_EFFECT_POISON		= 0x10, //16
	MAGIC_EFFECT_MORT_AREA		= 0x11, //17
	MAGIC_EFFECT_SOUND_GREEN	= 0x12, //18
	MAGIC_EFFECT_SOUND_RED		= 0x13, //19
	MAGIC_EFFECT_POISON_AREA	= 0x14, //20
	MAGIC_EFFECT_SOUND_YELLOW	= 0x15, //21
	MAGIC_EFFECT_SOUND_PURPLE	= 0x16, //22
	MAGIC_EFFECT_SOUND_BLUE	= 0x17, //23
	MAGIC_EFFECT_SOUND_WHITE	= 0x18, //24
	MAGIC_EFFECT_BUBBLES		= 0x19, //25
	MAGIC_EFFECT_CRAPS		= 0x1A, //26
	MAGIC_EFFECT_GIFT_WRAPS	= 0x1B, //27
	MAGIC_EFFECT_FIREWORK_YELLOW	= 0x1C, //28
	MAGIC_EFFECT_FIREWORK_RED	= 0x1D, //29
	MAGIC_EFFECT_FIREWORK_BLUE	= 0x1E, //30
	MAGIC_EFFECT_STUN		= 0x1F, //31
	MAGIC_EFFECT_SLEEP		= 0x20, //32
	MAGIC_EFFECT_WATERCREATURE	= 0x21, //33
	MAGIC_EFFECT_GROUNDSHAKER	= 0x22, //34
	MAGIC_EFFECT_HEARTS		= 0x23, //35
	MAGIC_EFFECT_FIREATTACK	= 0x24, //36
	MAGIC_EFFECT_ENERGY_AREA	= 0x25, //37
	MAGIC_EFFECT_SMALLCLOUDS	= 0x26, //38
	MAGIC_EFFECT_HOLYDAMAGE	= 0x27, //39
	MAGIC_EFFECT_BIGCLOUDS		= 0x28, //40
	MAGIC_EFFECT_ICEAREA		= 0x29, //41
	MAGIC_EFFECT_ICETORNADO	= 0x2A, //42
	MAGIC_EFFECT_ICEATTACK		= 0x2B, //43
	MAGIC_EFFECT_STONES		= 0x2C, //44
	MAGIC_EFFECT_SMALLPLANTS	= 0x2D, //45
	MAGIC_EFFECT_CARNIPHILA	= 0x2E, //46
	MAGIC_EFFECT_PURPLEENERGY	= 0x2F, //47
	MAGIC_EFFECT_YELLOWENERGY	= 0x30, //48
	MAGIC_EFFECT_HOLYAREA		= 0x31, //49
	MAGIC_EFFECT_BIGPLANTS		= 0x32, //50
	MAGIC_EFFECT_CAKE		= 0x33, //51
	MAGIC_EFFECT_GIANTICE		= 0x34, //52
	MAGIC_EFFECT_WATERSPLASH	= 0x35, //53
	MAGIC_EFFECT_PLANTATTACK	= 0x36, //54
	MAGIC_EFFECT_TUTORIALARROW	= 0x37, //55
	MAGIC_EFFECT_TUTORIALSQUARE	= 0x38, //56
	MAGIC_EFFECT_MIRRORHORIZONTAL	= 0x39, //57
	MAGIC_EFFECT_MIRRORVERTICAL	= 0x3A, //58
	MAGIC_EFFECT_SKULLHORIZONTAL	= 0x3B, //59
	MAGIC_EFFECT_SKULLVERTICAL	= 0x3C, //60
	MAGIC_EFFECT_ASSASSIN		= 0x3D, //61
	MAGIC_EFFECT_STEPSHORIZONTAL	= 0x3E, //62
	MAGIC_EFFECT_BLOODYSTEPS	= 0x3F, //63
	MAGIC_EFFECT_STEPSVERTICAL	= 0x40, //64
	MAGIC_EFFECT_YALAHARIGHOST	= 0x41, //65
	MAGIC_EFFECT_BATS		= 0x42, //66
	MAGIC_EFFECT_SMOKE		= 0x43, //67
	MAGIC_EFFECT_INSECTS		= 0x44, //68
	MAGIC_EFFECT_INSECTS2a = 0x45, //69
    MAGIC_EFFECT_INSECTS3a = 0x46, //70
    MAGIC_EFFECT_INSECTS4a = 0x47, //71
    MAGIC_EFFECT_INSECTS4b = 0x48, //72
    MAGIC_EFFECT_INSECTS4c = 0x49, //73
    MAGIC_EFFECT_INSECTS4 = 0x4A, //74
    MAGIC_EFFECT_INSECTS4d = 0x4B, //75
    MAGIC_EFFECT_INSECTS4e = 0x4C, //76
    MAGIC_EFFECT_INSECTS4f = 0x4D, //77
    MAGIC_EFFECT_INSECTS4g = 0x4E, //78
    MAGIC_EFFECT_INSECTS4h = 0x4F, //79
    MAGIC_EFFECT_INSECTS4i = 0x50, //80
    MAGIC_EFFECT_INSECTS4j = 0x51, //81
    MAGIC_EFFECT_INSECTS4k = 0x52, //82
    MAGIC_EFFECT_INSECTS4l = 0x53, //83
    MAGIC_EFFECT_INSECTS4m = 0x54, //84
    MAGIC_EFFECT_INSECTS4n = 0x55, //85
    MAGIC_EFFECT_INSECTS4o = 0x56, //86
    MAGIC_EFFECT_INSECTS4p = 0x57, //87
    MAGIC_EFFECT_INSECTS4q = 0x58, //88
    MAGIC_EFFECT_INSECTS4r = 0x59, //89
    MAGIC_EFFECT_INSECTS4s = 0x5A, //90
    MAGIC_EFFECT_INSECTS4t = 0x5B, //91
    MAGIC_EFFECT_INSECTS4u = 0x5C, //92
    MAGIC_EFFECT_INSECTS4v = 0x5D, //93
    MAGIC_EFFECT_INSECTS4x = 0x5E, //94
    MAGIC_EFFECT_INSECTS4w = 0x5F, //95
    MAGIC_EFFECT_INSECTS4y = 0x60, //96
    MAGIC_EFFECT_INSECTS4z = 0x61, //97
    MAGIC_EFFECT_INSECTS41 = 0x62, //98
    MAGIC_EFFECT_INSECTS42 = 0x63, //99
    MAGIC_EFFECT_INSECTS43 = 0x64, //100
    MAGIC_EFFECT_INSECTS44 = 0x65, //101
    MAGIC_EFFECT_INSECTS45 = 0x66, //102
    MAGIC_EFFECT_INSECTS46 = 0x67, //103
    MAGIC_EFFECT_INSECTS47 = 0x68, //104
    MAGIC_EFFECT_INSECTS48 = 0x69, //105
    MAGIC_EFFECT_INSECTS49 = 0x6A, //106
    MAGIC_EFFECT_INSECTS4a1 = 0x6B, //107
    MAGIC_EFFECT_INSECTS4a2 = 0x6C, //108
    MAGIC_EFFECT_INSECTS4a3 = 0x6D, //109
    MAGIC_EFFECT_INSECTS4a4 = 0x6E, //110
    MAGIC_EFFECT_INSECTS4a5 = 0x6F, //111
    MAGIC_EFFECT_INSECTS4a6 = 0x70, //112
    MAGIC_EFFECT_INSECTS4a7 = 0x71, //113
    MAGIC_EFFECT_INSECTS4a8 = 0x72, //114
    MAGIC_EFFECT_INSECTS4a9 = 0x73, //115
    MAGIC_EFFECT_INSECTS4ab = 0x74, //116
    MAGIC_EFFECT_INSECTS4ac = 0x75, //117
    MAGIC_EFFECT_INSECTS4ad = 0x76, //118
    MAGIC_EFFECT_INSECTS4ae = 0x77, //119
    MAGIC_EFFECT_INSECTS4af = 0x78, //120
    MAGIC_EFFECT_INSECTS4ag = 0x79, //121
    MAGIC_EFFECT_INSECTS4ah = 0x7A, //122
    MAGIC_EFFECT_INSECTS4ai = 0x7B, //123
    MAGIC_EFFECT_INSECTS4aj = 0x7C, //124
    MAGIC_EFFECT_INSECTS4ak = 0x7D, //125
    MAGIC_EFFECT_INSECTS4al = 0x7E, //126
    MAGIC_EFFECT_INSECTS4am = 0x7F, //127
    MAGIC_EFFECT_INSECTS4an = 0x80, //128
    MAGIC_EFFECT_INSECTS4ao = 0x81, //129
    MAGIC_EFFECT_INSECTS4ap = 0x82, //130
    MAGIC_EFFECT_INSECTS4aq = 0x83, //131
    MAGIC_EFFECT_INSECTS4ar = 0x84, //132
    MAGIC_EFFECT_INSECTS4as = 0x85, //133
    MAGIC_EFFECT_INSECTS4at = 0x86, //134
    MAGIC_EFFECT_INSECTS4au = 0x87, //135
    MAGIC_EFFECT_INSECTS4av = 0x88, //136
    MAGIC_EFFECT_INSECTS4ax = 0x89, //137
    MAGIC_EFFECT_INSECTS4aw = 0x8A, //138
    MAGIC_EFFECT_INSECTS4ay = 0x8B, //139
    MAGIC_EFFECT_INSECTS4az = 0x8C, //140
    MAGIC_EFFECT_INSECTS4ba = 0x8D, //141
    MAGIC_EFFECT_INSECTS4bb = 0x8E, //142
    MAGIC_EFFECT_INSECTS4bc = 0x8F, //143
    MAGIC_EFFECT_INSECTS4bd = 0x90, //144
    MAGIC_EFFECT_INSECTS4be = 0x91, //145
    MAGIC_EFFECT_INSECTS4bf = 0x92, //146
    MAGIC_EFFECT_INSECTS4bg = 0x93, //147
    MAGIC_EFFECT_INSECTS4bh = 0x94, //148
    MAGIC_EFFECT_INSECTS4bi = 0x95, //149
    MAGIC_EFFECT_INSECTS4bj = 0x96, //150
    MAGIC_EFFECT_INSECTS4bk = 0x97, //151
    MAGIC_EFFECT_INSECTS4bl = 0x98, //152
    MAGIC_EFFECT_INSECTS4bm = 0x99, //153
    MAGIC_EFFECT_INSECTS4bn = 0x9A, //154
    MAGIC_EFFECT_INSECTS4bo = 0x9B, //155
    MAGIC_EFFECT_INSECTS4bp = 0x9C, //156
    MAGIC_EFFECT_INSECTS4bq = 0x9D, //157
    MAGIC_EFFECT_INSECTS4br = 0x9E, //158
    MAGIC_EFFECT_INSECTS4bs = 0x9F, //159
    MAGIC_EFFECT_INSECTS4bt = 0x100, //160
    MAGIC_EFFECT_INSECTS4bu = 0x101, //161
    MAGIC_EFFECT_INSECTS4bv = 0x102, //162
    MAGIC_EFFECT_INSECTS4bx = 0x103, //163
    MAGIC_EFFECT_INSECTS4bw = 0x104, //164
    MAGIC_EFFECT_INSECTS4by = 0x105, //165
    MAGIC_EFFECT_INSECTS4bz = 0x106, //166
    MAGIC_EFFECT_INSECTS4cac = 0x107, //167
    MAGIC_EFFECT_INSECTS4ca = 0x108, //168
    MAGIC_EFFECT_INSECTS4cb = 0x109, //169
    MAGIC_EFFECT_INSECTS4cc = 0x10A, //170
    MAGIC_EFFECT_INSECTS4cd = 0x10B, //171
    MAGIC_EFFECT_INSECTS4ce = 0x10C, //172
    MAGIC_EFFECT_INSECTS4cf = 0x10D, //173
    MAGIC_EFFECT_INSECTS4cg = 0x10E, //174
    MAGIC_EFFECT_INSECTS4ch = 0x10F, //175
    MAGIC_EFFECT_INSECTS4ci = 0x110, //176
    MAGIC_EFFECT_INSECTS4cj = 0x111, //177
    MAGIC_EFFECT_INSECTS4ck = 0x112, //178
    MAGIC_EFFECT_INSECTS4cl = 0x113, //179
    MAGIC_EFFECT_INSECTS4cm = 0x114, //180
    MAGIC_EFFECT_INSECTS4cn = 0x115, //181
    MAGIC_EFFECT_INSECTS4co = 0x116, //182
    MAGIC_EFFECT_INSECTS4cp = 0x117, //183
    MAGIC_EFFECT_INSECTS4cq = 0x118, //184
    MAGIC_EFFECT_INSECTS4cr = 0x119, //185
    MAGIC_EFFECT_INSECTS4cs = 0x11A, //186
    MAGIC_EFFECT_INSECTS4ct = 0x11B, //187
    MAGIC_EFFECT_INSECTS4cu = 0x11C, //188
    MAGIC_EFFECT_INSECTS4cv = 0x11D, //189
    MAGIC_EFFECT_INSECTSc4x = 0x11E, //190
    MAGIC_EFFECT_INSECTSc4w = 0x11F, //191
    MAGIC_EFFECT_INSECTSc4y = 0x120, //192
    MAGIC_EFFECT_INSECTS4cz = 0x121, //193
    MAGIC_EFFECT_INSECTS4da = 0x122, //194
    MAGIC_EFFECT_INSECTS4db = 0x123, //195
    MAGIC_EFFECT_INSECTS4dc = 0x124, //196
    MAGIC_EFFECT_INSECTS4dd = 0x125, //197
    MAGIC_EFFECT_INSECTS4de = 0x126, //198
    MAGIC_EFFECT_INSECTS4df = 0x127, //199
    MAGIC_EFFECT_INSECTS4dg = 0x128, //201
    MAGIC_EFFECT_INSECTS4dh = 0x129, //202
    MAGIC_EFFECT_INSECTS4di = 0x12A, //203
    MAGIC_EFFECT_INSECTS4dj = 0x12B, //204
    MAGIC_EFFECT_INSECTS4dk = 0x12C, //205
    MAGIC_EFFECT_INSECTS4dl = 0x12D, //206
    MAGIC_EFFECT_INSECTS4dm = 0x12E, //207
    MAGIC_EFFECT_INSECTS4dn = 0x12F, //208
    MAGIC_EFFECT_INSECTS4do = 0x130, //209
    MAGIC_EFFECT_INSECTS4dp = 0x131, //210
    MAGIC_EFFECT_INSECTS4dq = 0x132, //211
    MAGIC_EFFECT_INSECTS4dr = 0x133, //212
    MAGIC_EFFECT_INSECTS4ds = 0x134, //213
    MAGIC_EFFECT_INSECTS4dt = 0x135, //214
    MAGIC_EFFECT_INSECTS4du = 0x136, //215
    MAGIC_EFFECT_INSECTS4dv = 0x137, //216
    MAGIC_EFFECT_INSECTS4dx = 0x138, //217
    MAGIC_EFFECT_INSECTS4dw = 0x139, //218
    MAGIC_EFFECT_INSECTS4dy = 0x13A, //219
    MAGIC_EFFECT_INSECTS4dz = 0x13B, //220
    MAGIC_EFFECT_INSECTS4ea = 0x13C, //221
    MAGIC_EFFECT_INSECTS4eb = 0x13D, //222
    MAGIC_EFFECT_INSECTS4ec = 0x13E, //223
    MAGIC_EFFECT_INSECTS4ed = 0x13F, //224
    MAGIC_EFFECT_INSECTS4ef = 0x140, //225
    MAGIC_EFFECT_INSECTS4eg = 0x141, //226
    MAGIC_EFFECT_INSECTS4eh = 0x142, //227
    MAGIC_EFFECT_INSECTS4ei = 0x143, //228
    MAGIC_EFFECT_INSECTS4ej = 0x144, //229
    MAGIC_EFFECT_INSECTS4ek = 0x145, //230
    MAGIC_EFFECT_INSECTS4el = 0x146, //231
    MAGIC_EFFECT_INSECTS4em = 0x147, //232
    MAGIC_EFFECT_INSECTS4en = 0x148, //233
    MAGIC_EFFECT_INSECTS4eo = 0x149, //234
    MAGIC_EFFECT_INSECTS4ep = 0x14A, //235
    MAGIC_EFFECT_INSECTS4eq = 0x14B, //236
    MAGIC_EFFECT_INSECTS4er = 0x14C, //237
    MAGIC_EFFECT_INSECTS4es = 0x14D, //238
    MAGIC_EFFECT_INSECTS4et = 0x14E, //239
    MAGIC_EFFECT_INSECTS4eu = 0x14F, //240
    MAGIC_EFFECT_INSECTS4ev = 0x150, //241
    MAGIC_EFFECT_INSECTS4ew = 0x151, //242
    MAGIC_EFFECT_INSECTS4ex = 0x152, //243
    MAGIC_EFFECT_INSECTS4ey = 0x153, //244
    MAGIC_EFFECT_INSECTS4ez = 0x154, //245
    MAGIC_EFFECT_INSECTS4fa = 0x155, //246
    MAGIC_EFFECT_INSECTS4fb = 0x156, //247
    MAGIC_EFFECT_INSECTS4fc = 0x157, //248
    MAGIC_EFFECT_INSECTS4fd = 0x158, //249
    MAGIC_EFFECT_INSECTS4fe = 0x159, //250
    MAGIC_EFFECT_INSECTS4ff = 0x15A, //251
    MAGIC_EFFECT_INSECTS4fg = 0x15B, //252
    MAGIC_EFFECT_INSECTS4fh = 0x15C, //253
    MAGIC_EFFECT_INSECTS4fi = 0x15D, //254
    MAGIC_EFFECT_INSECTS4fj = 0x15E, //255
    MAGIC_EFFECT_INSECTS4fk = 0x15F, //256
    MAGIC_EFFECT_INSECTS4fl = 0x160, //257
    MAGIC_EFFECT_INSECTS4fm = 0x161, //258  
    MAGIC_EFFECT_INSECTS4fn = 0x162, //259
    MAGIC_EFFECT_INSECTS4fo = 0x163, //260
	MAGIC_EFFECT_LAST		= 0xFFFF,

	//for internal use, dont send to client
	MAGIC_EFFECT_NONE		= 0xFFFE,//0x164, // 0xFF
	MAGIC_EFFECT_UNKNOWN		= 0xFFFF//165//0xFFFF
};

enum ShootEffect_t
{
	SHOOT_EFFECT_SPEAR		= 0x00,
	SHOOT_EFFECT_BOLT		= 0x01,
	SHOOT_EFFECT_ARROW		= 0x02,
	SHOOT_EFFECT_FIRE		= 0x03,
	SHOOT_EFFECT_ENERGY		= 0x04,
	SHOOT_EFFECT_POISONARROW	= 0x05,
	SHOOT_EFFECT_BURSTARROW	= 0x06,
	SHOOT_EFFECT_THROWINGSTAR	= 0x07,
	SHOOT_EFFECT_THROWINGKNIFE	= 0x08,
	SHOOT_EFFECT_SMALLSTONE	= 0x09,
	SHOOT_EFFECT_DEATH		= 0x0A, //10
	SHOOT_EFFECT_LARGEROCK	= 0x0B, //11
	SHOOT_EFFECT_SNOWBALL	= 0x0C, //12
	SHOOT_EFFECT_POWERBOLT	= 0x0D, //13
	SHOOT_EFFECT_POISONFIELD	= 0x0E, //14
	SHOOT_EFFECT_INFERNALBOLT	= 0x0F, //15
	SHOOT_EFFECT_HUNTINGSPEAR	= 0x10, //16
	SHOOT_EFFECT_ENCHANTEDSPEAR	= 0x11, //17
	SHOOT_EFFECT_REDSTAR	= 0x12, //18
	SHOOT_EFFECT_GREENSTAR	= 0x13, //19
	SHOOT_EFFECT_ROYALSPEAR	= 0x14, //20
	SHOOT_EFFECT_SNIPERARROW	= 0x15, //21
	SHOOT_EFFECT_ONYXARROW	= 0x16, //22
	SHOOT_EFFECT_PIERCINGBOLT	= 0x17, //23
	SHOOT_EFFECT_WHIRLWINDSWORD	= 0x18, //24
	SHOOT_EFFECT_WHIRLWINDAXE	= 0x19, //25
	SHOOT_EFFECT_WHIRLWINDCLUB	= 0x1A, //26
	SHOOT_EFFECT_ETHEREALSPEAR	= 0x1B, //27
	SHOOT_EFFECT_ICE		= 0x1C, //28
	SHOOT_EFFECT_EARTH		= 0x1D, //29
	SHOOT_EFFECT_HOLY		= 0x1E, //30
	SHOOT_EFFECT_SUDDENDEATH	= 0x1F, //31
	SHOOT_EFFECT_FLASHARROW	= 0x20, //32
	SHOOT_EFFECT_FLAMMINGARROW	= 0x21, //33
	SHOOT_EFFECT_SHIVERARROW	= 0x22, //34
	SHOOT_EFFECT_ENERGYBALL	= 0x23, //35
	SHOOT_EFFECT_SMALLICE	= 0x24, //36
	SHOOT_EFFECT_SMALLHOLY	= 0x25, //37
	SHOOT_EFFECT_SMALLEARTH	= 0x26, //38
	SHOOT_EFFECT_EARTHARROW	= 0x27, //39
	SHOOT_EFFECT_EXPLOSION	= 0x28, //40
	SHOOT_EFFECT_CAKE		= 0x29, //41
	SHOOT_EFFECT_VIK1A		= 0x2A, //42
	SHOOT_EFFECT_VIK1B		= 0x2B, //43
	SHOOT_EFFECT_VIK1C		= 0x2C, //44
	SHOOT_EFFECT_VIK1D		= 0x2D, //45
	SHOOT_EFFECT_VIK1E		= 0x2E, //46
	SHOOT_EFFECT_VIK1F		= 0x2F, //47
	SHOOT_EFFECT_VIK2A		= 0x30, //48
	SHOOT_EFFECT_VIK2B		= 0x31, //49
	SHOOT_EFFECT_VIK2C		= 0x32, //50
	SHOOT_EFFECT_VIK2D		= 0x33, //51
	SHOOT_EFFECT_VIK2E		= 0x34, //52
	SHOOT_EFFECT_VIK2F		= 0x35, //53
	SHOOT_EFFECT_VIK3A		= 0x36, //54
	SHOOT_EFFECT_VIK3B		= 0x37, //55
	SHOOT_EFFECT_VIK3C		= 0x38, //56
	SHOOT_EFFECT_VIK3D		= 0x39, //57
	SHOOT_EFFECT_VIK3E		= 0x3A, //58
	SHOOT_EFFECT_VIK3F		= 0x3B, //59
	SHOOT_EFFECT_VIK4A		= 0x3C, //60
	SHOOT_EFFECT_VIK4B		= 0x3D, //61
	SHOOT_EFFECT_VIK4C		= 0x3E, //62
	SHOOT_EFFECT_VIK4D		= 0x3F, //63
	SHOOT_EFFECT_VIK4E		= 0x40, //64
	SHOOT_EFFECT_VIK4F		= 0x41, //65
	SHOOT_EFFECT_LAST		= 0xFE,

	//for internal use, dont send to client
	SHOOT_EFFECT_WEAPONTYPE	= 0xFE, //254
	SHOOT_EFFECT_NONE		= 0xFF,
	SHOOT_EFFECT_UNKNOWN	= 0xFFFF
};

enum SpeakClasses
{
	SPEAK_CLASS_NONE	= 0x00,
	SPEAK_CLASS_FIRST 	= 0x01,
	SPEAK_SAY		= SPEAK_CLASS_FIRST,
	SPEAK_WHISPER		= 0x02,
	SPEAK_YELL		= 0x03,
	SPEAK_PRIVATE_PN	= 0x04,
	SPEAK_PRIVATE_NP	= 0x05,
	SPEAK_PRIVATE		= 0x06,
	SPEAK_CHANNEL_Y		= 0x07,
	SPEAK_CHANNEL_W		= 0x08,
	SPEAK_RVR_CHANNEL	= 0x09,
	SPEAK_RVR_ANSWER	= 0x0A,
	SPEAK_RVR_CONTINUE	= 0x0B,
	SPEAK_BROADCAST		= 0x0C,
	SPEAK_CHANNEL_RN	= 0x0D, //red - #c text
	SPEAK_PRIVATE_RED	= 0x0E,	//@name@text
	SPEAK_CHANNEL_O		= 0x0F,
	//SPEAK_UNKNOWN_1		= 0x10,
	SPEAK_CHANNEL_RA	= 0x11,	//red anonymous - #d text
	//SPEAK_UNKNOWN_2		= 0x12,
	SPEAK_MONSTER_SAY	= 0x13,
	SPEAK_MONSTER_YELL	= 0x14,
	SPEAK_CLASS_LAST 	= SPEAK_MONSTER_YELL
};

enum MessageClasses
{
	MSG_CLASS_FIRST			= 0x12,
	MSG_STATUS_CONSOLE_RED		= MSG_CLASS_FIRST, /*Red message in the console*/
	MSG_EVENT_ORANGE		= 0x13, /*Orange message in the console*/
	MSG_STATUS_CONSOLE_ORANGE	= 0x14, /*Orange message in the console*/
	MSG_STATUS_WARNING		= 0x15, /*Red message in game window and in the console*/
	MSG_EVENT_ADVANCE		= 0x16, /*White message in game window and in the console*/
	MSG_EVENT_DEFAULT		= 0x17, /*White message at the bottom of the game window and in the console*/
	MSG_STATUS_DEFAULT		= 0x18, /*White message at the bottom of the game window and in the console*/
	MSG_INFO_DESCR			= 0x19, /*Green message in game window and in the console*/
	MSG_STATUS_SMALL		= 0x1A, /*White message at the bottom of the game window"*/
	MSG_STATUS_CONSOLE_BLUE		= 0x1B, /*Blue message in the console*/
	MSG_CLASS_LAST			= MSG_STATUS_CONSOLE_BLUE
};

enum MapMarks_t
{
	MAPMARK_TICK		= 0x00,
	MAPMARK_QUESTION	= 0x01,
	MAPMARK_EXCLAMATION	= 0x02,
	MAPMARK_STAR		= 0x03,
	MAPMARK_CROSS		= 0x04,
	MAPMARK_TEMPLE		= 0x05,
	MAPMARK_KISS		= 0x06,
	MAPMARK_SHOVEL		= 0x07,
	MAPMARK_SWORD		= 0x08,
	MAPMARK_FLAG		= 0x09,
	MAPMARK_LOCK		= 0x0A,
	MAPMARK_BAG		= 0x0B,
	MAPMARK_SKULL		= 0x0C,
	MAPMARK_DOLLAR		= 0x0D,
	MAPMARK_REDNORTH	= 0x0E,
	MAPMARK_REDSOUTH	= 0x0F,
	MAPMARK_REDEAST		= 0x10,
	MAPMARK_REDWEST		= 0x11,
	MAPMARK_GREENNORTH	= 0x12,
	MAPMARK_GREENSOUTH	= 0x13
};

enum FluidColors_t
{
	FLUID_EMPTY	= 0x00,
	FLUID_BLUE	= 0x01,
	FLUID_RED	= 0x02,
	FLUID_BROWN	= 0x03,
	FLUID_GREEN	= 0x04,
	FLUID_YELLOW	= 0x05,
	FLUID_WHITE	= 0x06,
	FLUID_PURPLE	= 0x07
};

enum FluidTypes_t
{
	FLUID_NONE		= FLUID_EMPTY,
	FLUID_WATER		= FLUID_BLUE,
	FLUID_BLOOD		= FLUID_RED,
	FLUID_BEER		= FLUID_BROWN,
	FLUID_SLIME		= FLUID_GREEN,
	FLUID_LEMONADE		= FLUID_YELLOW,
	FLUID_MILK		= FLUID_WHITE,
	FLUID_MANA		= FLUID_PURPLE,

	FLUID_LIFE		= FLUID_RED + 8,
	FLUID_OIL		= FLUID_BROWN + 8,
	FLUID_URINE		= FLUID_YELLOW + 8,
	FLUID_COCONUTMILK	= FLUID_WHITE + 8,
	FLUID_WINE		= FLUID_PURPLE + 8,

	FLUID_MUD		= FLUID_BROWN + 16,
	FLUID_FRUITJUICE	= FLUID_YELLOW + 16,

	FLUID_LAVA		= FLUID_RED + 24,
	FLUID_RUM		= FLUID_BROWN + 24,
	FLUID_SWAMP		= FLUID_GREEN + 24,
};

const uint8_t reverseFluidMap[] =
{
	FLUID_EMPTY,
	FLUID_WATER,
	FLUID_MANA,
	FLUID_BEER,
	FLUID_EMPTY,
	FLUID_BLOOD,
	FLUID_SLIME,
	FLUID_EMPTY,
	FLUID_LEMONADE,
	FLUID_MILK
};

enum ClientFluidTypes_t
{
	CLIENTFLUID_EMPTY	= 0x00,
	CLIENTFLUID_BLUE	= 0x01,
	CLIENTFLUID_PURPLE	= 0x02,
	CLIENTFLUID_BROWN_1	= 0x03,
	CLIENTFLUID_BROWN_2	= 0x04,
	CLIENTFLUID_RED		= 0x05,
	CLIENTFLUID_GREEN	= 0x06,
	CLIENTFLUID_BROWN	= 0x07,
	CLIENTFLUID_YELLOW	= 0x08,
	CLIENTFLUID_WHITE	= 0x09
};

const uint8_t fluidMap[] =
{
	CLIENTFLUID_EMPTY,
	CLIENTFLUID_BLUE,
	CLIENTFLUID_RED,
	CLIENTFLUID_BROWN_1,
	CLIENTFLUID_GREEN,
	CLIENTFLUID_YELLOW,
	CLIENTFLUID_WHITE,
	CLIENTFLUID_PURPLE
};

enum SquareColor_t
{
	SQ_COLOR_NONE = 256,
	SQ_COLOR_BLACK = 0,
};

enum TextColor_t
{
	TEXTCOLOR_BLUE		= 5,
	TEXTCOLOR_GREEN		= 18,
	TEXTCOLOR_TEAL		= 35,
	TEXTCOLOR_LIGHTGREEN	= 66,
	TEXTCOLOR_DARKBROWN	= 78,
	TEXTCOLOR_LIGHTBLUE	= 89,
	TEXTCOLOR_DARKPURPLE	= 112,
	TEXTCOLOR_BROWN		= 120,
	TEXTCOLOR_GREY		= 129,
	TEXTCOLOR_DARKRED	= 144,
	TEXTCOLOR_DARKPINK	= 152,
	TEXTCOLOR_PURPLE	= 154,
	TEXTCOLOR_DARKORANGE	= 156,
	TEXTCOLOR_RED		= 180,
	TEXTCOLOR_PINK		= 190,
	TEXTCOLOR_ORANGE	= 192,
	TEXTCOLOR_DARKYELLOW	= 205,
	TEXTCOLOR_YELLOW	= 210,
	TEXTCOLOR_WHITE		= 215,
	TEXTCOLOR_WATER     = 11,
	TEXTCOLOR_NORMAL    = 128,
	TEXTCOLOR_FIRE2      = 180,
	TEXTCOLOR_FIGHTING  = 114,
	TEXTCOLOR_FLYING    = 131,
	TEXTCOLOR_GRASS     = 66,
	TEXTCOLOR_POISON    = 147,
	TEXTCOLOR_ELECTRIC  = 210,
	TEXTCOLOR_GROUND    = 126,
	TEXTCOLOR_PSYCHIC   = 149,
	TEXTCOLOR_ROCK      = 120,
	TEXTCOLOR_ICE       = 35,
	TEXTCOLOR_BUG       = 18,
	TEXTCOLOR_DRAGON    = 220,
	TEXTCOLOR_GHOST     = 219,
	TEXTCOLOR_NONE		= 255,
	TEXTCOLOR_UNKNOWN	= 256
};

enum Icons_t
{
    ICON_TEST = 0, 
	ICON_NONE = 0,
	ICON_POISON = 1 << 0,
	ICON_BURN = 1 << 1,
	ICON_ENERGY = 1 << 2,
	ICON_DRUNK = 1 << 3,
	ICON_MANASHIELD = 1 << 4,
	ICON_PARALYZE = 1 << 5,
	ICON_HASTE = 1 << 6,
	ICON_SWORDS = 1 << 7,
	ICON_DROWNING = 1 << 8,
	ICON_FREEZING = 1 << 9,
	ICON_DAZZLED = 1 << 10,
	ICON_CURSED = 1 << 11,
	ICON_BUFF = 1 << 12,
	ICON_PZ = 1 << 13,
	ICON_PROTECTIONZONE = 1 << 14
};

enum WeaponType_t
{
	WEAPON_NONE = 0,
	WEAPON_SWORD = 1,
	WEAPON_CLUB = 2,
	WEAPON_AXE = 3,
	WEAPON_SHIELD = 4,
	WEAPON_DIST = 5,
	WEAPON_WAND = 6,
	WEAPON_AMMO = 7,
	WEAPON_FIST = 8
};

enum Ammo_t
{
	AMMO_NONE = 0,
	AMMO_BOLT = 1,
	AMMO_ARROW = 2,
	AMMO_SPEAR = 3,
	AMMO_THROWINGSTAR = 4,
	AMMO_THROWINGKNIFE = 5,
	AMMO_STONE = 6,
	AMMO_SNOWBALL = 7
};

enum AmmoAction_t
{
	AMMOACTION_NONE,
	AMMOACTION_REMOVECOUNT,
	AMMOACTION_REMOVECHARGE,
	AMMOACTION_MOVE,
	AMMOACTION_MOVEBACK
};

enum WieldInfo_t
{
	WIELDINFO_LEVEL = 1,
	WIELDINFO_MAGLV = 2,
	WIELDINFO_VOCREQ = 4,
	WIELDINFO_PREMIUM = 8
};

enum Skulls_t
{
	SKULL_NONE = 0,
	SKULL_YELLOW = 1,
	SKULL_GREEN = 2,
	SKULL_WHITE = 3,
	SKULL_RED = 4,
	SKULL_BLACK = 5,
	SKULL_LAST = SKULL_BLACK
};

enum PartyShields_t
{
	SHIELD_NONE = 0,
	SHIELD_WHITEYELLOW = 1,
	SHIELD_WHITEBLUE = 2,
	SHIELD_BLUE = 3,
	SHIELD_YELLOW = 4,
	SHIELD_BLUE_SHAREDEXP = 5,
	SHIELD_YELLOW_SHAREDEXP = 6,
	SHIELD_BLUE_NOSHAREDEXP_BLINK = 7,
	SHIELD_YELLOW_NOSHAREDEXP_BLINK = 8,
	SHIELD_BLUE_NOSHAREDEXP = 9,
	SHIELD_YELLOW_NOSHAREDEXP = 10,
	SHIELD_WHITEYELLOWDUEL = 11,
	SHIELD_WHITEBLUEDUEL = 12,
	SHIELD_BLUEDUEL = 13,
	SHIELD_YELLOWDUEL = 14,
	SHIELD_LAST = SHIELD_YELLOWDUEL
};

enum CreatureIcons_t
{
    CREATURE_ICON_NONE = 0,
    CREATURE_ICON_CHAT = 1,
    CREATURE_ICON_TRADE = 2,
    CREATURE_ICON_QUEST = 3,
    CREATURE_ICON_TRADE_QUEST = 4,
    CREATURE_ICON_STAR = 5,
    CREATURE_ICON_BATTLE = 6,
    CREATURE_ICON_SKULL = 7
};

enum item_t
{
	ITEM_FIREFIELD		= 1492,
	ITEM_FIREFIELD_SAFE	= 1500,

	ITEM_POISONFIELD	= 1496,
	ITEM_POISONFIELD_SAFE	= 1503,

	ITEM_ENERGYFIELD	= 1495,
	ITEM_ENERGYFIELD_SAFE	= 1504,

	ITEM_MAGICWALL		= 1497,
	ITEM_MAGICWALL_SAFE	= 11095,

	ITEM_WILDGROWTH		= 1499,
	ITEM_WILDGROWTH_SAFE	= 11096,

	ITEM_DEPOT		= 2594,
	ITEM_LOCKER		= 2589,
	ITEM_GLOWING_SWITCH	= 11060,

	ITEM_MALE_CORPSE	= 6080,
	ITEM_FEMALE_CORPSE	= 6081,

	ITEM_MEAT		= 2666,
	ITEM_HAM		= 2671,
	ITEM_GRAPE		= 2681,
	ITEM_APPLE		= 2674,
	ITEM_BREAD		= 2689,
	ITEM_ROLL		= 2690,
	ITEM_CHEESE		= 2696,

	ITEM_FULLSPLASH		= 2016,
	ITEM_SMALLSPLASH	= 2019,

	ITEM_PARCEL		= 2595,
	ITEM_PARCEL_STAMPED	= 2596,
	ITEM_LETTER		= 2597,
	ITEM_LETTER_STAMPED	= 2598,
	ITEM_LABEL		= 2599,

	ITEM_WATERBALL_SPLASH	= 7711,
	ITEM_WATERBALL		= 7956,

	ITEM_HOUSE_TRANSFER	= 1968 //read-only
};

enum PlayerFlags
{
	PlayerFlag_CannotUseCombat = 0,			//2^0 = 1
	PlayerFlag_CannotAttackPlayer,			//2^1 = 2
	PlayerFlag_CannotAttackMonster,			//2^2 = 4
	PlayerFlag_CannotBeAttacked,			//2^3 = 8
	PlayerFlag_CanConvinceAll,			//2^4 = 16
	PlayerFlag_CanSummonAll,			//2^5 = 32
	PlayerFlag_CanIllusionAll,			//2^6 = 64
	PlayerFlag_CanSenseInvisibility,		//2^7 = 128
	PlayerFlag_IgnoredByMonsters,			//2^8 = 256
	PlayerFlag_NotGainInFight,			//2^9 = 512
	PlayerFlag_HasInfiniteMana,			//2^10 = 1024
	PlayerFlag_HasInfiniteSoul,			//2^11 = 2048
	PlayerFlag_HasNoExhaustion,			//2^12 = 4096
	PlayerFlag_CannotUseSpells,			//2^13 = 8192
	PlayerFlag_CannotPickupItem,			//2^14 = 16384
	PlayerFlag_CanAlwaysLogin,			//2^15 = 32768
	PlayerFlag_CanBroadcast,			//2^16 = 65536
	PlayerFlag_CanEditHouses,			//2^17 = 131072
	PlayerFlag_CannotBeBanned,			//2^18 = 262144
	PlayerFlag_CannotBePushed,			//2^19 = 524288
	PlayerFlag_HasInfiniteCapacity,			//2^20 = 1048576
	PlayerFlag_CanPushAllCreatures,			//2^21 = 2097152
	PlayerFlag_CanTalkRedPrivate,			//2^22 = 4194304
	PlayerFlag_CanTalkRedChannel,			//2^23 = 8388608
	PlayerFlag_TalkOrangeHelpChannel,		//2^24 = 16777216
	PlayerFlag_NotGainExperience,			//2^25 = 33554432
	PlayerFlag_NotGainMana,				//2^26 = 67108864
	PlayerFlag_NotGainHealth,			//2^27 = 134217728
	PlayerFlag_NotGainSkill,			//2^28 = 268435456
	PlayerFlag_SetMaxSpeed,				//2^29 = 536870912
	PlayerFlag_SpecialVIP,				//2^30 = 1073741824
	PlayerFlag_NotGenerateLoot,			//2^31 = 2147483648
	PlayerFlag_CanTalkRedChannelAnonymous,		//2^32 = 4294967296
	PlayerFlag_IgnoreProtectionZone,		//2^33 = 8589934592
	PlayerFlag_IgnoreSpellCheck,			//2^34 = 17179869184
	PlayerFlag_IgnoreEquipCheck,			//2^35 = 34359738368
	PlayerFlag_CannotBeMuted,			//2^36 = 68719476736
	PlayerFlag_IsAlwaysPremium,			//2^37 = 137438953472
	PlayerFlag_CanAnswerRuleViolations,		//2^38 = 274877906944
	PlayerFlag_39,	//ignore			//2^39 = 549755813888	//not used by us
	PlayerFlag_ShowGroupNameInsteadOfVocation,	//2^40 = 1099511627776
	PlayerFlag_HasInfiniteStamina,			//2^41 = 2199023255552
	PlayerFlag_CannotMoveItems,			//2^42 = 4398046511104
	PlayerFlag_CannotMoveCreatures,			//2^43 = 8796093022208
	PlayerFlag_CanReportBugs,			//2^44 = 17592186044416
	PlayerFlag_45,	//ignore			//2^45 = 35184372088832	//not used by us
	PlayerFlag_CannotBeSeen,			//2^46 = 70368744177664
	PlayerCustomFlag_IsWalkable,                //2^46 = 16777216

    PlayerCustomFlag_CanWalkthrough,            //2^47 = 33554433

	PlayerFlag_LastFlag
};

enum PlayerCustomFlags
{
	PlayerCustomFlag_AllowIdle = 0,				//2^0 = 1
	PlayerCustomFlag_CanSeePosition,			//2^1 = 2
	PlayerCustomFlag_CanSeeItemDetails,			//2^2 = 4
	PlayerCustomFlag_CanSeeCreatureDetails,			//2^3 = 8
	PlayerCustomFlag_NotSearchable,				//2^4 = 16
	PlayerCustomFlag_GamemasterPrivileges,			//2^5 = 32
	PlayerCustomFlag_CanThrowAnywhere,			//2^6 = 64
	PlayerCustomFlag_CanPushAllItems,			//2^7 = 128
	PlayerCustomFlag_CanMoveAnywhere,			//2^8 = 256
	PlayerCustomFlag_CanMoveFromFar,			//2^9 = 512
	PlayerCustomFlag_CanLoginMultipleCharacters,		//2^10 = 1024 (account flag)
	PlayerCustomFlag_HasFullLight,				//2^11 = 2048
	PlayerCustomFlag_CanLogoutAnytime,			//2^12 = 4096 (account flag)
	PlayerCustomFlag_HideLevel,				//2^13 = 8192
	PlayerCustomFlag_IsProtected,				//2^14 = 16384
	PlayerCustomFlag_IsImmune,				//2^15 = 32768
	PlayerCustomFlag_NotGainSkull,				//2^16 = 65536
	PlayerCustomFlag_NotGainUnjustified,			//2^17 = 131072
	PlayerCustomFlag_IgnorePacification,			//2^18 = 262144
	PlayerCustomFlag_IgnoreLoginDelay,			//2^19 = 524288
	PlayerCustomFlag_CanStairhop,				//2^20 = 1048576
	PlayerCustomFlag_CanTurnhop,				//2^21 = 2097152
	PlayerCustomFlag_IgnoreHouseRent,			//2^22 = 4194304
	PlayerCustomFlag_CanWearAllAddons,			//2^23 = 8388608

	PlayerCustomFlag_LastFlag
};

// OTCv8 features (from src/client/const.h)
enum GameFeature
{
	GameProtocolChecksum = 1,
	GameAccountNames = 2,
	GameChallengeOnLogin = 3,
	GamePenalityOnDeath = 4,
	GameNameOnNpcTrade = 5,
	GameDoubleFreeCapacity = 6,
	GameDoubleExperience = 7,
	GameTotalCapacity = 8,
	GameSkillsBase = 9,
	GamePlayerRegenerationTime = 10,
	GameChannelPlayerList = 11,
	GamePlayerMounts = 12,
	GameEnvironmentEffect = 13,
	GameCreatureEmblems = 14,
	GameItemAnimationPhase = 15,
	GameMagicEffectU16 = 16,
	GamePlayerMarket = 17,
	GameSpritesU32 = 18,
	GameTileAddThingWithStackpos = 19,
	GameOfflineTrainingTime = 20,
	GamePurseSlot = 21,
	GameFormatCreatureName = 22,
	GameSpellList = 23,
	GameClientPing = 24,
	GameExtendedClientPing = 25,
	GameDoubleHealth = 28,
	GameDoubleSkills = 29,
	GameChangeMapAwareRange = 30,
	GameMapMovePosition = 31,
	GameAttackSeq = 32,
	GameBlueNpcNameColor = 33,
	GameDiagonalAnimatedText = 34,
	GameLoginPending = 35,
	GameNewSpeedLaw = 36,
	GameForceFirstAutoWalkStep = 37,
	GameMinimapRemove = 38,
	GameDoubleShopSellAmount = 39,
	GameContainerPagination = 40,
	GameThingMarks = 41,
	GameLooktypeU16 = 42,
	GamePlayerStamina = 43,
	GamePlayerAddons = 44,
	GameMessageStatements = 45,
	GameMessageLevel = 46,
	GameNewFluids = 47,
	GamePlayerStateU16 = 48,
	GameNewOutfitProtocol = 49,
	GamePVPMode = 50,
	GameWritableDate = 51,
	GameAdditionalVipInfo = 52,
	GameBaseSkillU16 = 53,
	GameCreatureIcons = 54,
	GameHideNpcNames = 55,
	GameSpritesAlphaChannel = 56,
	GamePremiumExpiration = 57,
	GameBrowseField = 58,
	GameEnhancedAnimations = 59,
	GameOGLInformation = 60,
	GameMessageSizeCheck = 61,
	GamePreviewState = 62,
	GameLoginPacketEncryption = 63,
	GameClientVersion = 64,
	GameContentRevision = 65,
	GameExperienceBonus = 66,
	GameAuthenticator = 67,
	GameUnjustifiedPoints = 68,
	GameSessionKey = 69,
	GameDeathType = 70,
	GameIdleAnimations = 71,
	GameKeepUnawareTiles = 72,
	GameIngameStore = 73,
	GameIngameStoreHighlights = 74,
	GameIngameStoreServiceType = 75,
	GameAdditionalSkills = 76,
	GameDistanceEffectU16 = 77,
	GamePrey = 78,
	GameDoubleMagicLevel = 79,

	GameExtendedOpcode = 80,
	GameMinimapLimitedToSingleFloor = 81,
	GameSendWorldName = 82,

	GameDoubleLevel = 83,
	GameDoubleSoul = 84,
	GameDoublePlayerGoodsMoney = 85,
	GameCreatureWalkthrough = 86,
	GameDoubleTradeMoney = 87,
	GameSequencedPackets = 88,
	GameTibia12Protocol = 89,

	// 90-99 otclientv8 features
	GameNewWalking = 90,
	GameSlowerManualWalking = 91,

	GameItemTooltip = 93,

	GameBot = 95,
	GameBiggerMapCache = 96,
	GameForceLight = 97,
	GameNoDebug = 98,
	GameBotProtection = 99,

	// Custom features for customer
	GameFasterAnimations = 101,
	GameCenteredOutfits = 102,
	GameSendIdentifiers = 103,
	GameWingsAndAura = 104,
	GamePlayerStateU32 = 105,
	GameOutfitShaders = 106,

	// advanced features
	GamePacketSizeU32 = 110,
	GamePacketCompression = 111,

	LastGameFeature = 120
};

//Reserved player storage key ranges
//[10000000 - 20000000]
#define PSTRG_RESERVED_RANGE_START	10000000
#define PSTRG_RESERVED_RANGE_SIZE	10000000

//[1000 - 1500]
#define PSTRG_OUTFITS_RANGE_START	(PSTRG_RESERVED_RANGE_START + 1000)
#define PSTRG_OUTFITS_RANGE_SIZE	500

//[1500 - 2000]
#define PSTRG_OUTFITSID_RANGE_START	(PSTRG_RESERVED_RANGE_START + 1500)
#define PSTRG_OUTFITSID_RANGE_SIZE	500

#define NETWORKMESSAGE_MAXSIZE 49180
#define IPBAN_FLAG 128
#define LOCALHOST 2130706433

#define IS_IN_KEYRANGE(key, range) (key >= PSTRG_##range##_START && ((key - PSTRG_##range##_START) < PSTRG_##range##_SIZE))
#endif

