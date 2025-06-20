--天门阵头文件
--by vivi
--2009-07-15

Include("\\script\\lib\\globalfunctions.lua");
Include("\\script\\lib\\define.lua");
Include("\\script\\lib\\topscorelib.lua");
--Include("\\script\\lib\\xoyobi.lua");
Include("\\script\\lib\\sdb.lua");
Include("\\script\\misc\\observer\\observer_head.lua")

Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\ks2vng\\missions\\mission_award_add_rate_cfg.lua")
THIENMON_LOG_TITLE = "Chien truong Thien Mon Tran"

CampOne_Name = "Qu﹏ T鑞g";
CameTwo_Name = "Qu﹏ Li猽";

ALL_ID = 0;
CampOne_ID = 1;	--武林联盟在mission中阵营
CampTwo_ID = 2;	--武林叛徒在mission中阵营

tCampName = {"Qu﹏ T鑞g","Qu﹏ Li猽"};

CampOne_Type = "camp_player"; --武林联盟阵营类型，包括npc
CampTwo_Type = "camp_enemy";  --武林叛徒阵营类型，包括npc
Neutral_Type = "camp_evil";		--中立npc阵营类型

TMZ_EXP_EXT_RATE = min(VNG_CFG_TMZ_EXP_EXT_ADD_RATE or 0, 2)--经验加成系数
TMZ_JUNGONG_EXT_RATE = min(VNG_CFG_TMZ_JUNGONG_EXT_ADD_RATE or 0, 2)--军功加成系数

tCampType = {
	[0] = "camp_evil",
	[1] = "camp_player",
	[2] = "camp_enemy",};

--===============全局变量==========================
g_NpcName = "<color=green>phi猽 k� tng qu﹏ Qu竎h Qu﹏ B籲g<color>: ";

MAP_ID = 6006;

PLAY_NEED_LV = 70;      --参与最小等级

PLAYER_NEED_NUM = 12;    --对阵双方需要的最少人数
PLAYER_MAX_NUM = 16;    --对阵双方可加入的最大人数

MAX_ROOM_COUNT = 40;   --地图最大可加载数
--local nVersion,nCurGs = GetRealmType();
--if nCurGs == 1 then
--	MAX_ROOM_COUNT = 10;
--end

DEAD_BODY_TIME = 5;			--尸体存在时间

APPEAR_FLAG_POINT = 500; --500分的时候出现大阵旗
BROKEN_FLAG_POINT = 200; --击倒阵旗得到200分
BROKEN_EYE_POINT = 5; --击倒阵眼得到5分
OVER_GAME_POINT = 1000;  --当一方的战阵达到1000分时，对战结束

GIVE_AWARD_MARK = 20; --参加一次的全额积分
MAX_MARK = 6000; --积分上限
MAX_HUFU = 8;  --免费虎符数

CURE_ALL_PLAYER = 0;						--是否治疗所有和平状态的玩家
DRIVE_PLAYER_OUTOF_SHELTER = 1;	--是否打开强制传送后营停留过久的玩家的功能
INVINCIBILITY_TIME = 5;			--传出后营的无敌时间，单位秒

DEATH_SCRIPT = "\\script\\missions\\tianmenzhen\\playerdeath.lua";
NPC_DEATH_SCRIPT = "\\script\\missions\\tianmenzhen\\npc_death.lua";
TMZ_VM_SCRIPT = "\\script\\missions\\tianmenzhen\\tmz_npc.lua";
TMZ_TONG_RELAY_KEY_1 = "TMZ_TONG_SOCRE_RANK"; --在跨服区的排名，每周清
TMZ_TONG_RELAY_KEY_2 = "TMZ_TONG_RANK_SHOW";  --显示在面板上的，即上面的备份
TMZ_TONG_RELAY_KEY_3 = "TMZ_TONG_RELAY_DATA"; --记在本服的数据

--活跃度相关
TMZ_ACTIVE_PVP_DEATH_NUM = 6
TMZ_ACTIVE_PVP_LIMIT = 3
TMZ_ACTIVE_DAMAGE_LIMIT = 200000
TMZ_ACTIVE_HEAL_LIMIT = 100000
TMZ_ACTIVE_PVE_LIMIT = 6
TMZ_ACTIVE_EYE_LIMIT = 1
TMZ_ACTIVE_FLAG_LIMIT = 1

--每日参加限制
TMZ_DAILY_JOIN_LIMIT = 4

--每日领奖限制
TMZ_DAILY_AWARD_LIMIT = 4

--===============任务变量=========================
--在define中定义

--=====================临时变量==================================
PTT_DIE_LOOP = 201;				--记录玩家在战场死亡的时候，当前计时器的循环数
TASK_TEMP_DIE_TIME = 202; --记录玩家死亡时时间，存入GetTime()，用于死后10s后才能出去战场

--===============mission相关======================
MISSION_ID = 54; --mission id
TIMER_ID = 84; --time id
LOG_ID = 404;					--登陆触发器表ID
LOG_TRIGGER_ID = 304;			--登陆触发器自定义ID

FRAME_PER_SECOND = 18;
FRAME_PER_MIN = 60*FRAME_PER_SECOND;

PEACE_TIME = 5*FRAME_PER_SECOND;--等待玩家人数开启计时器的报时间隔，5秒
PEACE_TIMER_LOOP = (15*FRAME_PER_MIN/PEACE_TIME)-1;--等待玩家人数开启计时器报时次数（15分钟）
READY_TIME = 5*FRAME_PER_SECOND;--开战准备时间计时器的报时间隔，5秒
READY_TIMER_LOOP = (1*FRAME_PER_MIN/READY_TIME)-1;--开战准备时间计时器报时次数（1分钟）
FIGHT_TIME = 15*FRAME_PER_SECOND;			--打仗时间计时器的报时间隔，15秒
FIGHT_TIMER_LOOP = (40*FRAME_PER_MIN/FIGHT_TIME)-1;	--打仗时间计时器的报时次数（40分钟）
WAITOUT_TIME = 15*FRAME_PER_SECOND;		--等待结束时间计时器的报时间隔
WAITOUT_TIMER_LOOP = (0.5*FRAME_PER_MIN/WAITOUT_TIME)-1; --等待结束时间计时器的报时次数（半分钟）

--==============公用missionV变量===================
MV_TMZ_LOAD = 1;   --是否已经加载开启
MV_TMZ_STATE = 2;  --记录战场的状态
MV_TMZ_MAP_ID = 3;        --本场天门阵的MAPID
MV_TMZ_MAP_INDEX = 4;    --本场天门阵的MAP索引
MV_TMZ_CAMPONE_EYE = 5; --记录当前阵营一的阵眼数
MV_TMZ_CAMPTWO_EYE = 6; --记录当前阵营二的阵眼数
MV_TMZ_CAMPONE_POINT = 7; --记录当前阵营一的战阵时间（积分）
MV_TMZ_CAMPTWO_POINT = 8; --记录当前阵营二的战阵时间（积分）
MV_TMZ_APPEAR_FLAG = 9;   --记录是否已创建大战旗
MV_TMZ_WINNER_CAMP = 10;   --记录谁赢了
MV_TMZ_SHOWDATA_IDX = 11;  --记录本次对阵在TMZ_ShowData中第几项
MV_TIMER_LOOP = 12;				--记录TIMER的报时次数
MV_TMZ_LOG_TIME = 13;     --记录开启的时间 格式：%m%d%H%M%S
MV_TMZ_GAME_LOOP = 14;    --记录GetGameLoop()
MV_TMZ_ERROR_NUM = 15;    --记录重新创建触发器的次数，达到一定次数将去除场地
MV_TMZ_TONG_CAMPONE_MAX = 16; --阵营一帮会可进去最大人数
MV_TMZ_TONG_CAMPTWO_MAX = 17; --阵营二帮会可进去最大人数
MV_TMZ_TONG_CAMPONE_USEFUL = 18; --阵营一有效参与对阵的人数
MV_TMZ_TONG_CAMPTWO_USEFUL = 19; --阵营二有效参与对阵的人数
MV_TMZ_TONG_CAMPONE_SCORE = 20;--阵营一当前对阵积分
MV_TMZ_TONG_CAMPTWO_SCORE = 21;--阵营二当前对阵积分
MV_TMZ_TONG_CAMPONE_LV = 22;--阵营一当前对阵等级
MV_TMZ_TONG_CAMPTWO_LV = 23;--阵营二当前对阵等级
MV_TMZ_TONG_CAMPONE_WEEK_WIN = 24;--阵营一本周对战胜场数
MV_TMZ_TONG_CAMPTWO_WEEK_WIN = 25;--阵营二本周对战胜场数
MV_TMZ_TONG_CAMPONE_WEEK_LOSE = 26;--阵营一本周对战负场数
MV_TMZ_TONG_CAMPTWO_WEEK_LOSE = 27;--阵营二本周对战负场数
MV_TMZ_TONG_CAMPONE_TOTAL_WIN = 28;--阵营一总对战胜场数
MV_TMZ_TONG_CAMPTWO_TOTAL_WIN = 29;--阵营二总对战胜场数
MV_TMZ_TONG_CAMPONE_TOTAL_LOSE = 30;--阵营一总对战负场数
MV_TMZ_TONG_CAMPTWO_TOTAL_LOSE = 31;--阵营二总对战负场数
MV_TMZ_TONG_CAMPONE_LAST_WIN = 32;--阵营一上场胜负
MV_TMZ_TONG_CAMPTWO_LAST_WIN = 33;--阵营二上场胜负
MV_TMZ_TONG_CAMPONE_HUFU = 34;--阵营一虎符数
MV_TMZ_TONG_CAMPTWO_HUFU = 35;--阵营二虎符数

--==============公用missionS变量===================
MV_TMZ_TONG_CAMPONE_NAME = 1; --记录阵营一帮会名字
MV_TMZ_TONG_CAMPTWO_NAME = 2; --记录阵营二帮会名字

--==============常量：战场的状态===================
MS_STATE_PEACE = 0;				--等待人数阶段
MS_STATE_READY = 1;				--准备状态，人数齐等待开战阶段
MS_STATE_FIGHT = 2;				--开战状态
MS_STATE_COMPLETE = 3;		--战争结束状态

tPositionNpcA = {
--最后为物品掉落率
	{"Hoa Nam H�","Hoa Nam H�",1792,3745},
	{"Hoa Nam ti觰 蕌","Hoa Nam ti觰 蕌",1791,3742},
	{"Hoa Nam ti觰 蕌","Hoa Nam ti觰 蕌",1785,3743},
	{"S鉯 c竔","S鉯 c竔",1780,3341},
	{"S鉯 con","S鉯 con",1786,3349},
	{"S鉯 con","S鉯 con",1781,3352},
	{"Ti觰 t芻 ","Ti觰 t芻 ",1770,3656},
	{"Ti觰 t芻 ","Ti觰 t芻 ",1765,3658},
	{"Ti觰 t芻 ","Ti觰 t芻 ",1772,3657},
	{"L� Qu�","L� Qu�",1767,3416},
	{"Th竔 Tu蕁","Th竔 Tu蕁",1768,3423},
	{"La Kinh","La Kinh",1759,3419},
	{{50,150,250,350},{"u kh�",2,1,3849},{"D﹜ bu閏 ng鵤",2,1,3850},{"B譶h nhi猲 li謚",2,1,3849},{"V� chu鑙",2,1,3850}},
};

tPositionNpcB = {
	{"Ngi g�","Ngi g�",1863,3419},
	{"Ngi g�","Ngi g�",1691,3636},
	{{200,400,600,800},{"B蓎 k裵",2,1,3851},{"D﹜ bu閏 ng鵤",2,1,3850},{"B譶h nhi猲 li謚",2,1,3849},{"V� chu鑙",2,1,3850}}	
};

tPositionNpcC = {
	{"T� Tam D躰h","T� Tam D躰h",1898,3557},
	{"L� Nh� Nng","L� Nh� Nng",1890,3559},
	{"M筩 Kinh Phong","M筩 Kinh Phong",1903,3598},
	{"Vong h錸 Dng Di猲 Li謙","Vong h錸 Dng Di猲 Li謙",1654,3325},
	{"L� Tu莕 S琻","L� Tu莕 S琻",1661,3519},
	{"Чi vng S礽 Phong","Чi vng S礽 Phong",1646,3487},
	{"Nh� vng V� Nng","Nh� vng V� Nng",1666,3488},
	{{200},{"M玭 ph竔 竚 ti猽",2,1,3852}}
};

tPositionNpcS = {
	{"Cng o La La","Cng o La La"},
	{{1844,3621},{1841,3633},{1834,3628},{1835,3619},{1839,3612},{1842,3614},{1716,3627},{1712,3635},{1704,3631},{1704,3619},{1709,3612},
	 {1714,3613},{1729,3446},{1726,3436},{1717,3442},{1718,3452},{1718,3452},{1729,3456},{1854,3430},{1850,3442},{1844,3439},{1843,3426},
	 {1848,3418},{1853,3421}},	
};

tPositionNpcBOSS = { -- 别超过四个
	{{"Cu錸g tng Minh Nh藅","Cu錸g tng Minh Nh藅",1776,3528},{3,25,250},{150,TASKID_TMZ_BOSS}},
	{{"Ng魕 tng 竚 Nguy謙","Ng魕 tng 竚 Nguy謙",1776,3528},{0,10,0},{50,TASKID_TMZ_BOSS}},
};

--道具效果
tPositionBox = {--模板名 npc名 状态名称 效果描述 魔法属性字符串 数值 持续时间
	{"Gi� v� kh�","Gi� v� kh�",1787,3508,"D騨g M穘h","t╪g l鵦 c玭g k輈h 100%, duy tr� 30 gi﹜","state_p_attack_percent_add",100,30,"state_m_attack_percent_add",100,30},
	{"Gi� v� kh�","Gi� v� kh�",1754,3543,"D騨g M穘h","t╪g l鵦 c玭g k輈h 100%, duy tr� 30 gi﹜","state_p_attack_percent_add",100,30,"state_m_attack_percent_add",100,30},
	{"Gi� khi猲","Gi� khi猲",1775,3411,"Hung h穘","T╪g l鵦 ph遪g ng� 100%, duy tr� 30 gi﹜","state_receive_half_damage",100,30},
	{"L� th秓 dc","L� th秓 dc",1775,3666,"Tr� thng","M鏸 gi﹜ h錳 ph鬰 10% sinh m謓h, duy tr� 30 gi﹜","state_life_per_per8f",500,30},
	{"Gi祔 gi�","Gi祔 gi�",1851,3527,"Ng魕 b�","萵 th﹏, duy tr� 30 gi﹜","state_illusion_latent",0,30},
	{"Gi祔 gi�","Gi祔 gi�",1686,3528,"Ng魕 b�","萵 th﹏, duy tr� 30 gi﹜","state_illusion_latent",0,30},
};

tPositionNpcEye = {--模板名、npc名、坐标点
	[0] = {
		{"C竛 c� 1","Sinh M玭 (ch璦 chi誱 l躰h)",1840,3622},
		{"C竛 c� 2","T� M玭 (ch璦 chi誱 l躰h)",1710,3626},
		{"C竛 c� 3","C秐h M玭 (ch璦 chi誱 l躰h)",1724,3447},
		{"C竛 c� 4","Di謙 M玭 (ch璦 chi誱 l躰h)",1849,3431},		
	},
	[1] = {
		{"Sinh m玭 t輒","Sinh M玭 ("..CampOne_Name..")",1840,3622},
		{"T� m玭 t輒","T� M玭 ("..CampOne_Name..")",1710,3626},
		{"C秐h m玭 t輒","C秐h M玭 ("..CampOne_Name..")",1724,3447},
		{"Di謙 m玭 t輒","Di謙 M玭 ("..CampOne_Name..")",1849,3431},				
	},
	[2] = {
		{"Sinh m玭 lam","Sinh M玭 ("..CameTwo_Name..")",1840,3622},
		{"T� m玭 lam","T� M玭 ("..CameTwo_Name..")",1710,3626},
		{"C秐h m玭 lam","C秐h M玭 ("..CameTwo_Name..")",1724,3447},
		{"Di謙 m玭 lam","Di謙 M玭 ("..CameTwo_Name..")",1849,3431},				
	},	
};

tPositionNpcFlag = {--模板名、npc名、坐标点 
	[1] = {
		{"Tr薾 k� t輒","Чi tr薾 k� ("..CampOne_Name..")",1820,3347},
		{"B筰 k� t輒","Tr薾 K� h� t鎛 ("..CampOne_Name..")",1820,3347},		
	},
	[2] = {
		{"Tr薾 k� lam","Чi tr薾 k� ("..CameTwo_Name..")",1737,3726},
		{"B筰 k� lam","Tr薾 K� h� t鎛 ("..CameTwo_Name..")",1737,3726},		
	},
};

--八个佛的位置
tPositionFo = {
	{"Nga Mi ti觰 s� t� 1","Nga Mi ti觰 s� t� ",1907,3367,1645,3666},
	{"Nga Mi ti觰 s� t� 2","Nga Mi ti觰 s� t� ",1913,3367,1652,3665},
	{"Nga Mi ti觰 s� t� 3","Nga Mi ti觰 s� t� ",1908,3390,1652,3689},
	{"Nga Mi ti觰 s� t� 4","Nga Mi ti觰 s� t� ",1914,3389,1642,3687}
}

tPositionCamp = { --后营复活点 前营战场点 仓库管理员 离开npc 上阵npc
	{{1912,3377},{{1855,3435},{1831,3335}},{1901,3356},{1891,3349},{1891,3361}},
	{{1643,3675},{{1703,3618},{1725,3737}},{1664,3715},{1657,3709},{1660,3689}},
};

--界面显示
--TMZ_ShowData = TMZ_ShowData or {
--	CurN = 0,
--	name = "天门阵",
--	title = {"姓名","阵营","流派","杀人数","死亡数","阵眼"},
--	szFormat = "%-17s%-9s%-9s%-7s%-7s%-6s",
--};
--TMZ_LoadData();

--经验翻倍的物品
tAwardItem = 
{
	[0] = {},
	[1] = {"Qu﹏ C玭g Chng",2,1,9999,1},
	[2] = {"Qu﹏ C玭g Чi",2,1,9998,1},
	[3] = {"Qu﹏ C玭g Huy Ho祅g",2,1,9977,1},
	[4] = {"qu﹏ c玭g chng vinh d� ",2,1,30642,1},
};
tMocRuong = 
{
	[0] = {"Kh玭g", 1},
	[1] = {"Qu﹏ C玭g Chng", 3},
	[2] = {"Qu﹏ C玭g Чi", 6},
	[3] = {"Qu﹏ C玭g Huy Ho祅g", 10},
	[4] = {"VIP", 0},	
};


g_tWinExtraAward =--胜方专属奖励
{
	{ {"Thi誸 Tinh c蕄 1", {2,1,30533,1}, nil,nil, {1, 100}}, 2400},
	{ {"Thi誸 Tinh c蕄 2", {2,1,30534,1}, nil,nil, {1, 100}}, 500},
	{ {"Thi誸 Tinh c蕄 3", {2,1,30535,1}, nil,nil, {1, 100}}, 100},
	{ {"Ma o Th筩h c蕄 1", {2,1,30428,1}, nil,nil, {1, 100}}, 600},
	{ {"Ma Чo Th筩h c蕄 2", {2,1,30429,1}, nil,nil, {1, 100}}, 300},
	{ {"Ma o Th筩h c蕄 3", {2,1,30430,1}, nil,nil, {1, 100}}, 100},
    {{MA_GiveMoney, {10000}}, 3000},
    {{MA_GiveMoney, {40000}}, 2000},
    {{MA_GiveMoney, {100000}}, 900},
    {{MA_GiveMoney, {1000000}}, 100},
};

--Qu﹏ C玭g
tbQuanCong_HP = {
	[0] = {400, 200},
	[1] = {800, 400},
	[2] = {2000, 900},
	[3] = {4000, 1800},
	[4] = {4800, 2400},
}

--必给奖励
g_tWinExtraAward2 = {
	[0] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,400,1},--军功
			{1,"Hu﹏ chng anh h飊g",{2,1,30499,2},0,1},
			--{1,"勇士徽章",{2,1,30498,1},0,1},
		},
	},
	[1] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,800,1},--军功
			{1,"Hu﹏ chng anh h飊g",{2,1,30499,3},0,1},
			--{1,"勇士徽章",{2,1,30498,1},0,1},
		},
	},
	[2] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,2000,1},--军功
			{1,"Hu﹏ chng anh h飊g",{2,1,30499,4},0,1},
			--{1,"勇士徽章",{2,1,30498,1},0,1},
		},
	},
	[3] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,4000,1},--军功
			{1,"Hu﹏ chng anh h飊g",{2,1,30499,5},0,1},
			--{1,"勇士徽章",{2,1,30498,1},0,1},
		},
	},
	[4] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,4800,1},--军功
			{1,"Hu﹏ chng anh h飊g",{2,1,30499,6},0,1},
			--{1,"勇士徽章",{2,1,30498,1},0,1},
		},
	},
};
g_tLoseExtraAward2 = {
	[0] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,200,1},--军功
			--{1,"勇士徽章",{2,1,30498,1},0,1},
		},
	},
	[1] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,400,1},--军功
			--{1,"勇士徽章",{2,1,30498,2},0,1},
			{1,"Hu﹏ chng anh h飊g",{2,1,30499,1},0,1},
		},
	},
	[2] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,900,1},--军功
			--{1,"勇士徽章",{2,1,30498,3},0,1},
			{1,"Hu﹏ chng anh h飊g",{2,1,30499,2},0,1},
		},
	},
	[3] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,1800,1},--军功
			--{1,"勇士徽章",{2,1,30498,4},0,1},
			{1,"Hu﹏ chng anh h飊g",{2,1,30499,3},0,1},
		},
	},
	[4] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{32,2400,1},--军功
			--{1,"勇士徽章",{2,1,30498,5},0,1},
			{1,"Hu﹏ chng anh h飊g",{2,1,30499,4},0,1},
		},
	},
};

tbNormalAward = 
{
	[0] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,4000000,1},
			--{1,"星痕碎片",{2,1,30299,2},0,1},
			--{1,"英雄勋章",{2,1,30499,0},0,1},
		},
	},
	[1] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,6000000,1},
			--{1,"天外流星",{2,1,30321,1},0,1},
			--{1,"英雄勋章",{2,1,30499,1},0,1},
		},
	},
	[2] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,9000000,1},
			--{1,"天外流星",{2,1,30321,2},0,1},
			--{1,"英雄勋章",{2,1,30499,2},0,1},
		},
	},
	[3] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,12000000,1},
			--{1,"天外流星",{2,1,30321,4},0,1},
			--{1,"英雄勋章",{2,1,30499,3},0,1},
		},
	},
	[4] = 
	{
		nBagLimit = 1,
		nWeightLimit = 0,
		tbAward =
		{
			{2,18000000,1},
			--{1,"天外流星",{2,1,30321,4},0,1},
			--{1,"英雄勋章",{2,1,30499,3},0,1},
		},
	},
}
 tbAcvtiveDesc = 
{
	{"<color=green>C蕄 th蕄<color>", "<color=green>T莔 thng<color>",},
	{"<color=green>C蕄 h� trung<color>", "<color=green>B譶h thng<color>",},
	{"<color=yellow>C蕄 trung<color>", "<color=yellow>Tng i t鑤<color>",},
	{"<color=yellow>C蕄 thng trung<color>", "<color=yellow>D騨g m穘h<color>",},
	{"<color=red>C蕄 cao<color>", "<color=red>L蕐 1 ch鋓 10<color>",},
	{"<color=red>C蕄 si猽 cao<color>", "<color=red>L蕄 l竛h s竛g ng阨<color>",},
}

tbAcvtiveWinAward = 
{
	[1] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
		},
	},
	[2] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,6000000,1},
			--{28,180,1},--真气
			--{1,"星痕碎片",{2,1,30299,3},0,1},
		},
	},
	[3] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,9000000,1},
			--{28,240,1},--真气
			--{1,"星痕碎片",{2,1,30299,6},0,1},
		},
	},
	[4] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,12000000,1},
			--{28,300,1},--真气
			--{1,"星痕碎片",{2,1,30299,12},0,1},
			--{1,"天外流星",{2,1,30321,1},0,1},
		},
	},
	[5] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,14400000,1},
			--{28,360,1},--真气
			--{1,"星痕碎片",{2,1,30299,18},0,1},
			--{1,"天外流星",{2,1,30321,2},0,1},
		},
	},
	[6] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,18000000,1},
			--{28,420,1},--真气
			--{1,"星痕碎片",{2,1,30299,24},0,1},
			--{1,"天外流星",{2,1,30321,4},0,1},
		},
	},
}

tbAcvtiveLossAward = 
{
	[1] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
		},
	},
	[2] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,2000000,1},
			--{28,60,1},--真气
			--{1,"星痕碎片",{2,1,30299,1},0,1},
		},
	},
	[3] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,3000000,1},
			--{28,80,1},--真气
			--{1,"星痕碎片",{2,1,30299,2},0,1},
		},
	},
	[4] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,4000000,1},
			--{28,100,1},--真气
			--{1,"星痕碎片",{2,1,30299,4},0,1},
		},
	},
	[5] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,4800000,1},
			--{28,120,1},--真气
			--{1,"星痕碎片",{2,1,30299,6},0,1},
		},
	},
	[6] = 
	{
		nBagLimit = 0,
		nWeightLimit = 0,
		tbAward =
		{
			{2,6000000,1},
			--{28,140,1},--真气
			--{1,"星痕碎片",{2,1,30299,8},0,1},
			--{1,"天外流星",{2,1,30321,1},0,1},
		},
	},
}

tAwardCloth = {
	--1为第1套 2为第2套 3为第3套 4为第4套
	--先分部位再分套装（第1套有两套）最后分体型
	--名字 id 兑换所需要积分 最后一列是兑换龙凤装备所需要的积分
	[1] = {
		{{{"C鰑 Dng Qu竛",0,103,3032,0,3200},{"C鰑 Dng Qu竛",0,103,3038,0,3200},{"C鰑 Dng Qu竛",0,103,3044,0,3200},{"C鰑 Dng Qu竛",0,103,3050,0,3200}},{{"C鰑 Dng Qu竛",0,103,3035,0,3200},{"C鰑 Dng Qu竛",0,103,3041,0,3200},{"C鰑 Dng Qu竛",0,103,3047,0,3200},{"C鰑 Dng Qu竛",0,103,3053,0,3200}}},
		{{{"C鰑 Dng Y",0,100,3032,0,3200},{"C鰑 Dng Y",0,100,3038,0,3200},{"C鰑 Dng Y",0,100,3044,0,3200},{"C鰑 Dng Y",0,100,3050,0,3200}},{{"C鰑 Dng Y",0,100,3035,0,3200},{"C鰑 Dng Y",0,100,3041,0,3200},{"C鰑 Dng Y",0,100,3047,0,3200},{"C鰑 Dng Y",0,100,3053,0,3200}}},
		{{{"C鰑 Dng trang",0,101,3032,0,3200},{"C鰑 Dng trang",0,101,3038,0,3200},{"C鰑 Dng trang",0,101,3044,0,3200},{"C鰑 Dng trang",0,101,3050,0,3200}},{{"C鰑 Dng trang",0,101,3035,0,3200},{"C鰑 Dng trang",0,101,3041,0,3200},{"C鰑 Dng trang",0,101,3047,0,3200},{"C鰑 Dng trang",0,101,3053,0,3200}}},
	},
	[2] = {
		{{{"Tinh Kh綾-C鰑 Dng Nh藅 Qu竛",0,103,3033,1600,1600},{"Tinh Kh綾-C鰑 Dng Nh藅 Qu竛",0,103,3039,1600,1600},{"Tinh Kh綾-C鰑 Dng Nh藅 Qu竛",0,103,3045,1600,1600},{"Tinh Kh綾-C鰑 Dng Nh藅 Qu竛",0,103,3051,1600,1600}},{{"Tinh Kh綾-C鰑  Nguy謙 Qu竛",0,103,3036,1600,1600},{"Tinh Kh綾-C鰑  Nguy謙 Qu竛",0,103,3042,1600,1600},{"Tinh Kh綾-C鰑  Nguy謙 Qu竛",0,103,3048,1600,1600},{"Tinh Kh綾-C鰑  Nguy謙 Qu竛",0,103,3054,1600,1600}}},
		{{{"Tinh Kh綾-C鰑 Dng H醓 Y",0,100,3033,1600,1600},{"Tinh Kh綾-C鰑 Dng H醓 Y",0,100,3039,1600,1600},{"Tinh Kh綾-C鰑 Dng H醓 Y",0,100,3045,1600,1600},{"Tinh Kh綾-C鰑 Dng H醓 Y",0,100,3051,1600,1600}},{{"Tinh Kh綾-C鰑  Th駓 Y",0,100,3036,1600,1600},{"Tinh Kh綾-C鰑  Th駓 Y",0,100,3042,1600,1600},{"Tinh Kh綾-C鰑  Th駓 Y",0,100,3048,1600,1600},{"Tinh Kh綾-C鰑  Th駓 Y",0,100,3054,1600,1600}}},
		{{{"Tinh Kh綾-C鰑 Dng Long Trang",0,101,3033,1600,1600},{"Tinh Kh綾-C鰑 Dng Long Trang",0,101,3039,1600,1600},{"Tinh Kh綾-C鰑 Dng Long Trang",0,101,3045,1600,1600},{"Tinh Kh綾-C鰑 Dng Long Trang",0,101,3051,1600,1600}},{{"Tinh Kh綾-C鰑  Ph鬾g Trang",0,101,3036,1600,1600},{"Tinh Kh綾-C鰑  Ph鬾g Trang",0,101,3042,1600,1600},{"Tinh Kh綾-C鰑  Ph鬾g Trang",0,101,3048,1600,1600},{"Tinh Kh綾-C鰑  Ph鬾g Trang",0,101,3054,1600,1600}}},
	},
	[3] = {
		{{{"Thi猲 Ngh躠-C鰑 Dng Nh藅 Qu竛",0,103,3034,1600,0},{"Thi猲 Ngh躠-C鰑 Dng Nh藅 Qu竛",0,103,3040,1600,0},{"Thi猲 Ngh躠-C鰑 Dng Nh藅 Qu竛",0,103,3046,1600,0},{"Thi猲 Ngh躠-C鰑 Dng Nh藅 Qu竛",0,103,3052,1600,0},},{{"Thi猲 Ngh躠-C鰑  Nguy謙 Qu竛",0,103,3037,1600,0},{"Thi猲 Ngh躠-C鰑  Nguy謙 Qu竛",0,103,3043,1600,0},{"Thi猲 Ngh躠-C鰑  Nguy謙 Qu竛",0,103,3049,1600,0},{"Thi猲 Ngh躠-C鰑  Nguy謙 Qu竛",0,103,3055,1600,0}}},
		{{{"Thi猲 Ngh躠-C鰑 Dng H醓 Y",0,100,3034,1600,0},{"Thi猲 Ngh躠-C鰑 Dng H醓 Y",0,100,3040,1600,0},{"Thi猲 Ngh躠-C鰑 Dng H醓 Y",0,100,3046,1600,0},{"Thi猲 Ngh躠-C鰑 Dng H醓 Y",0,100,3052,1600,0}},{{"Thi猲 Ngh躠-C鰑  Th駓 Y",0,100,3037,1600,0},{"Thi猲 Ngh躠-C鰑  Th駓 Y",0,100,3043,1600,0},{"Thi猲 Ngh躠-C鰑  Th駓 Y",0,100,3049,1600,0},{"Thi猲 Ngh躠-C鰑  Th駓 Y",0,100,3055,1600,0}}},
		{{{"Thi猲 Ngh躠-C鰑 Dng Long Trang",0,101,3034,1600,0},{"Thi猲 Ngh躠-C鰑 Dng Long Trang",0,101,3040,1600,0},{"Thi猲 Ngh躠-C鰑 Dng Long Trang",0,101,3046,1600,0},{"Thi猲 Ngh躠-C鰑 Dng Long Trang",0,101,3052,1600,0}},{{"Thi猲 Ngh躠-C鰑  Ph鬾g Trang",0,101,3037,1600,0},{"Thi猲 Ngh躠-C鰑  Ph鬾g Trang",0,101,3043,1600,0},{"Thi猲 Ngh躠-C鰑  Ph鬾g Trang",0,101,3049,1600,0},{"Thi猲 Ngh躠-C鰑  Ph鬾g Trang",0,101,3055,1600,0}}},
	},
	[4] = {
		{{{"Long Щng T� H秈 Qu竛",0,103,3056,0},{"Long Щng T� H秈 Qu竛",0,103,3057,0},{"Long Щng T� H秈 Qu竛",0,103,3058,0},{"Long Щng T� H秈 Qu竛",0,103,3059,0}},{{"Ph鬾g V� C鰑 Thi猲 Qu竛",0,103,3060,0},{"Ph鬾g V� C鰑 Thi猲 Qu竛",0,103,3061,0},{"Ph鬾g V� C鰑 Thi猲 Qu竛",0,103,3062,0},{"Ph鬾g V� C鰑 Thi猲 Qu竛",0,103,3063,0}}},
		{{{"Long Щng T� H秈 Y",0,100,3056,0},{"Long Щng T� H秈 Y",0,100,3057,0},{"Long Щng T� H秈 Y",0,100,3058,0},{"Long Щng T� H秈 Y",0,100,3059,0}},{{"Ph鬾g V� C鰑 Thi猲 Y",0,100,3060,0},{"Ph鬾g V� C鰑 Thi猲 Y",0,100,3061,0},{"Ph鬾g V� C鰑 Thi猲 Y",0,100,3062,0},{"Ph鬾g V� C鰑 Thi猲 Y",0,100,3063,0}}},
		{{{"Long Щng T� H秈 Trang",0,101,3056,0},{"Long Щng T� H秈 Trang",0,101,3057,0},{"Long Щng T� H秈 Trang",0,101,3058,0},{"Long Щng T� H秈 Trang",0,101,3059,0}},{{"Ph鬾g V� C鰑 Thi猲 Trang",0,101,3060,0},{"Ph鬾g V� C鰑 Thi猲 Trang",0,101,3061,0},{"Ph鬾g V� C鰑 Thi猲 Trang",0,101,3062,0},{"Ph鬾g V� C鰑 Thi猲 Trang",0,101,3063,0}}},
	},
};

tAwardWeapon = {
	[2] = {{"L璾 Ly Gi韎 o",0,3,8890,800,5200},{"Tinh Kh綾-L璾 Ly Gi韎 o",0,3,8892,2600,2600},{"Thi猲 Ngh躠-L璾 Ly Gi韎 o",0,3,8894,2600,0},{"C鰑 Ch﹗-L璾 Ly Gi韎 o",0,3,8932,0,670,1}},
	[3] = {{"Kinh L玦 Thi襫 Trng",0,8,8908,800,5200},{"Tinh Kh綾-Kinh L玦 Thi襫 Trng",0,8,8909,2600,2600},{"Thi猲 Ngh躠-Kinh L玦 Thi襫 Trng",0,8,8910,2600,0},{"C鰑 Ch﹗-Kinh L玦 Thi襫 Trng",0,8,8934,0,672,1}},
	[4] = {{"L玦  Nang Th�",0,0,8872,800,5200},{"Tinh Kh綾-L玦  Nang Th�",0,0,8874,2600,2600},{"Thi猲 Ngh躠-L玦  Nang Th�",0,0,8876,2600,0},{"C鰑 Ch﹗-L玦  Nang Th�",0,0,8933,0,672,1}},
	[6] = {{" Dng Xuy猲 秐h",0,1,8878,800,5200},{"Tinh Kh綾- Dng Xuy猲 秐h",0,1,8879,2600,2600},{"Thi猲 Ngh躠- Dng Xuy猲 秐h",0,1,8880,2600,0},{"C鰑 Ch﹗- Dng Xuy猲 秐h",0,1,8935,0,671,1}},
	[8] = {{"T� H祅  Ki誱",0,2,8881,800,5200},{"Tinh Kh綾-T� H祅  Ki誱",0,2,8884,2600,2600},{"Thi猲 Ngh躠-T� H祅  Ki誱",0,2,8887,2600,0},{"C鰑 Ch﹗-T� H祅  Ki誱",0,2,8936,0,672,1}},
	[9] = {{"C鰑 Ho祅 B鑙 C莔",0,10,8917,800,5200},{"Tinh Kh綾-C鰑 Ho祅 B鑙 C莔",0,10,8918,2600,2600},{"Thi猲 Ngh躠-C鰑 Ho祅 B鑙 C莔",0,10,8919,2600,0},{"C鰑 Ch﹗-C鰑 Ho祅 B鑙 C莔",0,10,8937,0,672,1}},
	[11] = {{"Quy L﹏ H� Th�",0,0,8873,800,5200},{"Tinh Kh綾-Quy L﹏ H� Th�",0,0,8875,2600,2600},{"Thi猲 Ngh躠-Quy L﹏ H� Th�",0,0,8877,2600,0},{"C鰑 Ch﹗-Quy L﹏ H� Th�",0,0,8938,0,670,1}},
	[12] = {{"Tr蕁 Ng筼 C玭",0,5,8899,800,5200},{"Tinh Kh綾-Tr蕁 Ng筼 C玭",0,5,8900,2600,2600},{"Thi猲 Ngh躠-Tr蕁 Ng筼 C玭",0,5,8901,2600,0},{"C鰑 Ch﹗-Tr蕁 Ng筼 C玭",0,5,8939,0,671,1}},
	[14] = {{"Thu莕 Phong Ki誱",0,2,8882,800,5200},{"Tinh Kh綾-Thu莕 Phong Ki誱",0,2,8885,2600,2600},{"Thi猲 Ngh躠-Thu莕 Phong Ki誱",0,2,8888,2600,0},{"C鰑 Ch﹗-Thu莕 Phong Ki誱",0,2,8940,0,672,1}},
	[15] = {{"Tinh u Chuy觧 B髏",0,9,8911,800,5200},{"Tinh Kh綾-Tinh u Chuy觧 B髏",0,9,8913,2600,2600},{"Thi猲 Ngh躠-Tinh u Chuy觧 B髏",0,9,8915,2600,0},{"C鰑 Ch﹗-Tinh u Chuy觧 B髏",0,9,8941,0,673,1}},
	[17] = {{"Ph� Qu﹏ Tr薾 Thng",0,6,8902,800,5200},{"Tinh Kh綾-Ph� Qu﹏ Tr薾 Thng",0,6,8903,2600,2600},{"Thi猲 Ngh躠-Ph� Qu﹏ Tr薾 Thng",0,6,8904,2600,0},{"C鰑 Ch﹗-Ph� Qu﹏ Tr薾 Thng",0,6,8942,0,670,1}},
	[18] = {{"Truy M謓h Cung",0,4,8896,800,5200},{"Tinh Kh綾-Truy M謓h Cung",0,4,8897,2600,2600},{"Thi猲 Ngh躠-Truy M謓h Cung",0,4,8898,2600,0},{"C鰑 Ch﹗-Truy M謓h Cung",0,4,8943,0,671,1}},
	[20] = {{"Thi謕 C鑤 Huy誸 o",0,7,8905,800,5200},{"Tinh Kh綾-Thi謕 C鑤 Huy誸 o",0,7,8906,2600,2600},{"Thi猲 Ngh躠-Thi謕 C鑤 Huy誸 o",0,7,8907,2600,0},{"C鰑 Ch﹗-Thi謕 C鑤 Huy誸 o",0,7,8944,0,671,1}},
	[21] = {{"Luy謓 H錸 Huy誸 Tr秓",0,11,8920,800,5200},{"Tinh Kh綾-Luy謓 H錸 Huy誸 Tr秓",0,11,8922,2600,2600},{"Thi猲 Ngh躠-Luy謓 H錸 Huy誸 Tr秓",0,11,8924,2600,0},{"C鰑 Ch﹗-Luy謓 H錸 Huy誸 Tr秓",0,11,8945,0,673,1}},
	[23] = {{"Ng� Thi猲 Phong Ki誱",0,2,8883,800,5200},{"Tinh Kh綾-Ng� Thi猲 Phong Ki誱",0,2,8886,2600,2600},{"Thi猲 Ngh躠-Ng� Thi猲 Phong Ki誱",0,2,8889,2600,0},{"C鰑 Ch﹗-Ng� Thi猲 Phong Ki誱",0,2,8946,0,672,1}},
	[25] = {{"Th莕 Di謒 Thi猲 o",0,3,8891,800,5200},{"Tinh Kh綾-Th莕 Di謒 Thi猲 o",0,3,8893,2600,2600},{"Thi猲 Ngh躠-Th莕 Di謒 Thi猲 o",0,3,8895,2600,0},{"C鰑 Ch﹗-Th莕 Di謒 Thi猲 o",0,3,8947,0,670,1,1}},
	[26] = {{"Th莕 Phong Ph竛 B髏",0,9,8912,800,5200},{"Tinh Kh綾-Th莕 Phong Ph竛 B髏",0,9,8914,2600,2600},{"Thi猲 Ngh躠-Th莕 Phong Ph竛 B髏",0,9,8916,2600,0},{"C鰑 Ch﹗-Th莕 Phong Ph竛 B髏",0,9,8948,0,673,1}},
	[27] = {{"Th莕 Linh Ch� Tr秓",0,11,8921,800,5200},{"Tinh Kh綾-Th莕 Linh Ch� Tr秓",0,11,8923,2600,2600},{"Thi猲 Ngh躠-Th莕 Linh Ch� Tr秓",0,11,8925,2600,0},{"C鰑 Ch﹗-Th莕 Linh Ch� Tr秓",0,11,8949,0,671,1}},
	[29] = {{"Linh Lung Chi",0,13,8929,800,5200},{"Tinh Kh綾-Linh Lung Chi",0,13,8930,2600,2600},{"Thi猲 Ngh躠-Linh Lung Chi",0,13,8931,2600,0},{"C鰑 Ch﹗-Linh Lung Chi",0,13,8950,0,671,1}},
	[30] = {{"C鰑 Ti猽 S竜",0,12,8926,800,5200},{"Tinh Kh綾-C鰑 Ti猽 S竜",0,12,8927,2600,2600},{"Thi猲 Ngh躠-C鰑 Ti猽 S竜",0,12,8928,2600,0},{"C鰑 Ch﹗-C鰑 Ti猽 S竜",0,12,8951,0,673,1}},
};

tTongScoreLv = {
	{150,1,8},
	{190,2,12},
	{99999,3,16},
};

--- Add Qu﹏ C玭g -
tbQuanCongTMT =
{
	{300,100},
	{600,200},
	{1500,500},
	{3000,1000},
	{3600, 1200},
}
