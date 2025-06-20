--天门阵开启npc
--by vivi
--2009-07-16

Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua")
Include("\\script\\lib\\message.lua")
Include("\\script\\task\\world\\task_award.lua");
Include("\\script\\online\\chuyen_sinh\\translife_npc.lua");
Include("\\script\\global\\battlefield_callback.lua")
Include("\\script\\online_activites\\award.lua")
Include ("\\script\\meridian\\meridian_award_zhenqi.lua")--奖励真气的接口
Include("\\script\\online\\olympic\\oly_head.lua")
--追回字帖大作战
Include("\\script\\online\\dazitie\\dzt_head.lua")
Include("\\script\\vng\\nhiemvudonghanh\\donghanh_head.lua")
Include("\\script\\vng\\config\\vng_feature.lua")
Include("\\script\\online\\collect_card\\cc_head.lua")
Include("\\script\\online\\award_head.lua")
Include("\\settings\\static_script\\global\\merit.lua")
Include("\\settings\\static_script\\missions\\base\\mission_award_base.lua")
Include("\\script\\vng\\award\\feature_award.lua")
Include("\\script\\missions\\tianmenzhen\\runtime_data_stat.lua")

g_szThisFile = "\\script\\missions\\tianmenzhen\\tmz_npc.lua";
g_RealmNpcName = "<color=green>Tng Gi竜 Qu竎h Qu﹏ Di <color>: ";

function main()
	--==========天门阵后续任务===================
		if GetTask(1401) == 136 then
			Talk(1,"",g_NpcName.."Nh� l阨 M閏 tng qu﹏  n鉯, th藅 s� ta  l藀 n猲 tr薾 ph竝. Thi誹 hi謕 c� th� tham gia th� nghi謒 m閠 tr薾, chi課 th緉g r錳 h穣 n t譵 ta");
			SetTask(1401,137);
			GivePlayerExp(SkeyTianmenzhen,"guojunpen")
			TaskTip("Chi課 th緉g 1 l莕 Thi猲 M玭 Tr薾.");
			return 0;
		elseif GetTask(1401) == 137 and GetTask(TASKID_TMZ_PLAY_POINT) >= OVER_GAME_POINT then
			Talk(1,"",g_NpcName.."Xem ra c竎 h�  r� c竎h b祔 b� Thi猲 M玭 Tr薾 r錳, h穣 mau v� b萴 b竜 v韎 M閏 tng qu﹏ 甶.");
			SetTask(1401,138);
			GivePlayerExp(SkeyTianmenzhen,"yanwushengli")
			TaskTip("V� b萴 b竜 v韎 M閏 Qu� Anh");
			return 0;
		end
	--============================================
	if GetMapTemplate(SubWorld) == 350 then		--襄阳功能NPC取消
		Talk(1,"",g_RealmNpcName.."Thi猲 M玭 Tr薾 hi謓  頲 chuy觧 n <color=red>Th祅h Й (231/229) v� Чi L� (179/179)<color>!")
	else
		local strtab = {
			"Жng k� tham gia Thi猲 M玭 Tr薾 c� nh﹏/tmz_single_join",
			"Жng k� tham gia Thi猲 M玭 Tr薾 t� i/tmz_team_join",
			"Nh薾 ph莕 thng Thi猲 M玭 Tr薾/tmz_get_award",
			"Xem thu閏 t輓h trang b� m韎/#Sale(147,100,1)",
			"Gi韎 thi謚 Thi猲 M玭 Tr薾/tmz_about_detail",
			"Kh玭g c� g�!/gf_DoNothing"
			};
		if GLB_TMZ_BiWuCheck() == 1 then
			tinsert(strtab,4,"T� v� Thi猲 M玭 Tr薾 bang h閕 xuy猲 server/tmz_about_tong");
		end
		Say(g_NpcName.."Giang s琻 i T鑞g ta 產ng t譶h c秐h v﹜ nguy t� ngo筰 t閏, nam nhi i trng phu sao c� th� khoanh tay ng nh譶! Thi誹 hi謕 n t譵 ta c� vi謈 chi?",
			getn(strtab),
			strtab)	
	end
end

function tmz_tong_callback_2(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local tbTmzTong = SDB(szkey,0,0,3);
	local strTongName = GetTongName();
	local nHufu =  tbTmzTong[strTongName][8] or MAX_HUFU;
	strtab = {
		"B竜 danh tham gia/#tmz_tong_join(1)",
		"S� d鬾g 20 Ti猽 Dao Ng鋍 b竜 danh tham gia/#tmz_tong_join(2)",
		"Gi韎 thi謚 i tr薾/tmz_tong_detail",
		"Лa ta tr� v�/tmz_tong_back",
		"Kh玭g c� g�!/gf_DoNothing",	
	};
	local strMsg = "Qu� bang c遪 d� Thi猲 M玭 H� Ph� 蕁 l� <color=yellow>"..nHufu.."<color>, m鏸 l莕 b竜 danh c莡 ti猽 hao 1."
	Say(g_RealmNpcName.."C竎 v� thi誹 hi謕, khi  v祇 n y th� ph秈 nghe l謓h ta! K� l祄 tr竔 l謓h, x� theo qu﹏ ph竝!"..strMsg,
		getn(strtab),
		strtab);	
end

function tmz_single_join()
	if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
		if GetTask(701) > 0 then
			Talk(1,"","H穣 n g苝 Ti觰 Phng  tham gia nh gi� qu﹏ h祄, nh薾 qu﹏ c玭g qu﹏ h祄 tu莕 n祔 v� i m韎 qu﹏ h祄. Sau  n g苝 ta ");
			return 0;	
		end
		if GetTask(701) < 0 then
			Talk(1,"","H穣 n g苝 Ti觰 Ng鋍  tham gia nh gi� qu﹏ h祄, nh薾 qu﹏ c玭g qu﹏ h祄 tu莕 n祔 v� i m韎 qu﹏ h祄. Sau  n g苝 ta ");
			return 0;	
		end
	end
	--时间限制
	local nTime = tonumber(date("%H%M"));
	if (not ((1100 <= nTime and nTime < 1300) or (1700 <= nTime and nTime < 1900) or (2200 <= nTime and nTime <= 2359))) then
		Talk(1,"",g_NpcName.."Di詎 v� ch璦 m�, t� 11:00-13:00, 17:00-19:00 ho芻 22:00-23:00 h穣 quay l筰 b竜 danh tham gia");
		return 0;
	end
	
	--加入等级限制
	local nLv = GetLevel();
	if nLv < PLAY_NEED_LV then
		Talk(1,"",g_NpcName.."L莕 di詎 v� n祔 kh玭g ph秈 t莔 thng, thi誹 hi謕 tr� ngi non da kh� tr竛h kh醝 thng vong. C竎 h� t n c蕄 <color=yellow>70<color> h穣 n tham gia.");
		return 0
	end
	--入流派才给进
	local nCheckRoute = gf_CheckPlayerRoute()
	if nCheckRoute == 0 then
		Talk(1,"",g_NpcName.."C竎 h� v蒼 ch璦 gia nh藀 m玭 ph竔, kh玭g th� tham gia.");
		return 0;
	end
	--加入是否领取了上一场战场的奖励
	if GetTask(TASKID_TMZ_PLAY_RESULT) > 0 then
		Talk(1,"",g_NpcName.."Thi誹 hi謕 v蒼 ch璦 nh薾 ph莕 thng l莕 tham gia trc, h穣 nh薾 thng trc 甶.");
		return 0;
	end 
	if GetTeamSize() > 1 then
		Talk(1,"",g_NpcName.."H穣 t譵 ch� t� i n b竜 danh v韎 ta.");
		return 0;
	end
	
	if GetPKValue() >= 10 then
		Talk(1,"",g_NpcName.."C竎 h� s竧 kh� qu� n苙g (PK>10), n誹 tham gia v祇 Thi猲 M玭 Tr薾 s� m筺g h鋋 s竧 th﹏,  ngh� t辬h t﹎ l筰 h穣 n t譵 ta b竜 danh tham gia");
		return 0;
	end
	
	-- 每天进入限制
	if GetTask(TASKID_TMZ_PLAY_NUM) >= TMZ_DAILY_JOIN_LIMIT then
		Talk(1,"",g_NpcName..format("M鏸 ng祔 m鏸 ngi ch� 頲 tham gia <color=green>%d<color> tr薾 Di詎 V�, c竎 h� h穣 quay l筰 v祇 ng祔 mai.",TMZ_DAILY_JOIN_LIMIT));
		return 0;
	end
	
	if GetCash() < 30000 then
		Talk(1,"","Чi hi謕 kh玭g c� 3 v祅g")
		return
	end
	
	local nWaiting = 0;
	if GetTime() - GetTask(TASKID_TMZ_JOIN_TIME) < 5*60 then
		nWaiting = 1; --整装状态
	end
	local nCurMapId = TMZ_GetSuitMap(1,nWaiting);
	local nCityMapId = GetWorldPos()
	if nCurMapId ~= 0 then
		local nCurN = mf_GetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,nCurMapId);
		if mf_GetPlayerCount(MISSION_ID,CampOne_ID,nCurMapId) <= mf_GetPlayerCount(MISSION_ID,CampTwo_ID,nCurMapId) then
			mf_JoinMission(MISSION_ID,CampOne_ID,nCurMapId);
			SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
			TMZ_Write_TableData(nCurN,CampOne_ID,0,0,0);
		else
			mf_JoinMission(MISSION_ID,CampTwo_ID,nCurMapId);
			SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
			TMZ_Write_TableData(nCurN,CampTwo_ID,0,0,0);
		end
	else --没有合适的，新开一个
		local nRoomID,nRoomIdx,nRoomCount = TMZ_FindIdleRoom();
		if nRoomID == 0 then
			Talk(1,"",g_NpcName.."T蕋 c� c竎 b秐   y, h穣 quay l筰 sau.");
			return 0;
		end;
		if mf_OpenMission(MISSION_ID,nRoomID) == 1 then
			local ShowTable = {
				name = TMZ_ShowData.name,
				title = TMZ_ShowData.title,
				szFormat = TMZ_ShowData.szFormat,
				data = {},			
				szMsg = format("T� l� chi誱 tr薾: <color=yellow>%s[%d]<color>: <color=pink>[%d]%s<color>",tCampName[1],0,0,tCampName[2]),
			};
			initTopScore(ShowTable);
			TMZ_ShowData.CurN = TMZ_ShowData.CurN + 1;
			TMZ_ShowData[TMZ_ShowData.CurN] = ShowTable;
			TMZ_SaveData();
			mf_SetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,TMZ_ShowData.CurN,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_LOAD,1,nRoomID);	
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_ID,nRoomID,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_INDEX,nRoomIdx,nRoomID);
			mf_JoinMission(MISSION_ID,CampOne_ID,nRoomID);
			SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
			TMZ_Write_TableData(TMZ_ShowData.CurN,CampOne_ID,0,0,0);
			
			_stat_on_misson_open()
		end
	end
	Pay(30000)
	_stat_when_join(1)
	
	--cdkey活动
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_PVP_Set(3)");	
	end);
end

function tmz_team_join()
	if GetTask(TSK_TRANS_POINT_ALLOW) == 0 then
		if GetTask(701) > 0 then
			Talk(1,"","H穣 n g苝 Ti觰 Phng  tham gia nh gi� qu﹏ h祄, nh薾 qu﹏ c玭g qu﹏ h祄 tu莕 n祔 v� i m韎 qu﹏ h祄. Sau  n g苝 ta ");
			return 0;	
		end
		if GetTask(701) < 0 then
			Talk(1,"","H穣 n g苝 Ti觰 Ng鋍  tham gia nh gi� qu﹏ h祄, nh薾 qu﹏ c玭g qu﹏ h祄 tu莕 n祔 v� i m韎 qu﹏ h祄. Sau  n g苝 ta ");
			return 0;	
		end
	end
	--时间限制
	local nTime = tonumber(date("%H%M"));
	if (not ((1100 <= nTime and nTime < 1300) or (1700 <= nTime and nTime < 1900) or (2100 <= nTime and nTime < 2300))) then
		Talk(1,"",g_NpcName.."Di詎 v� v蒼 ch璦 chu萵 b� xong, thi誹 hi謕 h穣 quay l筰 v祇 11: 00 ~ 13: 00 ho芻 17: 00~19: 00 ho芻 21: 00~23: 00 tham gia chi課 trng.");
		return 0;
	end
	
	local nTeamNumber = GetTeamSize();
	local sCapTainName = GetCaptainName();
	if nTeamNumber < 1 or nTeamNumber > 3 then
		Talk(1,"",g_NpcName.."B竜 danh Thi猲 M玭 Tr薾 c� th� theo t� i 3 ngi ho芻 c� nh﹏ tham gia");
		return 0;
	end
	if GetName() ~= sCapTainName then
		Talk(1,"",g_NpcName.."T� i c莕 i trng n b竜 danh.");
		return 0;
	end
	if tmz_AreaCheck() == 0 then
		Talk(1,"",g_NpcName.."Trong i ng� c� th祅h vi猲 v緉g m苩 ");
		return 0;
	end
	if tmz_LvCheck() == 0 then
		Talk(1,"",g_NpcName.."Trong i ng� c� th祅h vi猲 ch璦 t c蕄 70.");
		return 0;
	end
	if tmz_AwardCheck() == 0 then
		Talk(1,"",g_NpcName.."Trong i ng� c� th祅h vi猲 ch璦 nh薾 ph莕 thng l莕 tham gia trc");
		return 0;
	end
	if tmz_TeamRouteCheck() == 0 then
		Talk(1,"",g_NpcName.."Trong i ng� c� th祅h vi猲 ch璦 gia nh藀 m玭 ph竔");
		return 0;
	end
	if tmz_TeamCashCheck() == 0 then
		tmz_TeamTalk(g_NpcName)
		return 0
	end
	
	if tmz_PkValueCheck() == 0 then
		Talk(1,"",g_NpcName.."Trong i ng� c� th祅h vi猲 s竧 kh� qu� n苙g (PK>10), kh玭g th� v祇");
		return 0;		
	end
	-- 每天进入限制
	if tmz_CheckJoinLimitCount() == 0 then
		Talk(1,"",g_NpcName..format("Trong i ng� c� ngi  tham gia <color=green>%d<color> tr薾 di詎 v� r錳.",TMZ_DAILY_JOIN_LIMIT));
		return 0;
	end
	local nWaiting = 0;
	if tmz_ZhengZhuangCheck() == 0 then
		nWaiting = 1;
	end
	local nCurMapId = TMZ_GetSuitMap(nTeamNumber,nWaiting);
	local nOldIndex = PlayerIndex; 
	local nCityMapId = GetWorldPos()
	if nCurMapId ~= 0 then
		local nCurN = mf_GetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,nCurMapId);
		if mf_GetPlayerCount(MISSION_ID,CampOne_ID,nCurMapId) <= mf_GetPlayerCount(MISSION_ID,CampTwo_ID,nCurMapId)then
			for i=1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i); 
				mf_JoinMission(MISSION_ID,CampOne_ID,nCurMapId);
				SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
				TMZ_Write_TableData(nCurN,CampOne_ID,0,0,0);
			end
			PlayerIndex = nOldIndex;
		else
			for i=1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i);						
				mf_JoinMission(MISSION_ID,CampTwo_ID,nCurMapId);
				SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
				TMZ_Write_TableData(nCurN,CampTwo_ID,0,0,0);
			end
			PlayerIndex = nOldIndex;
		end
	else --没有合适的，新开一个
		local nRoomID,nRoomIdx,nRoomCount = TMZ_FindIdleRoom();
		if nRoomID == 0 then
			Talk(1,"",g_NpcName.."T蕋 c� c竎 b秐   y, h穣 quay l筰 sau.");
			return 0;
		end;
		if mf_OpenMission(MISSION_ID,nRoomID) == 1 then
			local ShowTable = {
				name = TMZ_ShowData.name,
				title = TMZ_ShowData.title,
				szFormat = TMZ_ShowData.szFormat,
				data = {},			
				szMsg = format("T� l� chi誱 tr薾: <color=yellow>%s[%d]<color>: <color=pink>[%d]%s<color>",tCampName[1],0,0,tCampName[2]),
			};
			initTopScore(ShowTable);
			TMZ_ShowData.CurN = TMZ_ShowData.CurN + 1;
			TMZ_ShowData[TMZ_ShowData.CurN] = ShowTable;
			TMZ_SaveData();
			mf_SetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,TMZ_ShowData.CurN,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_LOAD,1,nRoomID);	
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_ID,nRoomID,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_INDEX,nRoomIdx,nRoomID);
			for i=1, GetTeamSize() do
				PlayerIndex = GetTeamMember(i);							
				mf_JoinMission(MISSION_ID,CampOne_ID,nRoomID);
				SetTask(TASKID_TMZ_ENROLL_MAPID,nCityMapId)
				TMZ_Write_TableData(TMZ_ShowData.CurN,CampOne_ID,0,0,0);
			end
			PlayerIndex = nOldIndex;
			
			_stat_on_misson_open()
		end
	end	
	tmz_TeamPay()
	_stat_when_join(GetTeamSize() or 2)
	
	--cdkey活动
	gf_TeamOperateEX(function () 
		SendScript2VM("\\script\\function\\cdkey\\ck_head.lua", "_ck_BZBD_PVP_Set(3)");	
	end);
end

-- 在进入前判断所有队员是否在同一个城里
function tmz_AreaCheck()
	local nTeamSize = 0
	local nMapid = GetWorldPos()	--随便取一个队员的worldpos
	local nOldIndex = PlayerIndex
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetWorldPos() == nMapid then
			nTeamSize = nTeamSize + 1
		end
	end
	PlayerIndex = nOldIndex
	if GetTeamSize() == nTeamSize then
		return 1, nTeamSize
	else
		return 0, nTeamSize
	end
end

function tmz_LvCheck()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nLv = GetLevel();
		if nLv < PLAY_NEED_LV then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;
end

function tmz_AwardCheck()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetTask(TASKID_TMZ_PLAY_RESULT) > 0 then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	
end

function tmz_ZhengZhuangCheck()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetTime() - GetTask(TASKID_TMZ_JOIN_TIME) < 5*60 then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	
end

function tmz_TeamRouteCheck()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nCheckRoute = gf_CheckPlayerRoute();
		if nCheckRoute == 0 then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	
end

function  tmz_TeamCashCheck()
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nCash = GetCash()
		if nCash < 30000 then
			return 0
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	
end

 function tmz_TeamTalk(g_NpcName)
 	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		Talk(1,"",g_NpcName.."Trong i ng� c� th祅h vi猲 ch璦 c� 3 v祅g");
	end
	PlayerIndex = nOldIndex;
 end

function  tmz_TeamPay()
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		Pay(30000)
	end
	PlayerIndex = nOldIndex;
end


function tmz_PkValueCheck()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		local nPk = GetPKValue();
		if nPk >= 10 then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;			
end

function tmz_TongMemberCheck()
	local nOldIndex = PlayerIndex;
	local strTongName = "";
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if i == 1 then
			strTongName = GetTongName();
		else
			if strTongName ~= GetTongName() then
				PlayerIndex = nOldIndex;
				return 0;
			end
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	 
end

function tmz_CheckJoinLimitCount()
	local nTeamSize = 0;
	local nOldIndex = PlayerIndex;
	for i=1, GetTeamSize() do
		PlayerIndex = GetTeamMember(i)
		if GetTask(TASKID_TMZ_PLAY_NUM) >= TMZ_DAILY_JOIN_LIMIT then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end
	PlayerIndex = nOldIndex;
	return 1;	
end

--奖励的全额经验
function tmz_Award_Base_Exp()
	local nExp = 0;
	local nLv = GetLevel();
	local tExpType = {{75,80,85,90,100},{nLv^3/3,(100+(nLv-75)*20)*10000/3,(280+(nLv-80)*24)*10000/3,(400+(nLv-85)*28)*10000/3,5120000/3}};
	for i = 1,getn(tExpType[1]) do
		if nLv < tExpType[1][i] then
			nExp = tExpType[2][i];
			break;
		end
	end
	return nExp
end

--经验衰减系数1
function tmz_Award_Exp_Arg()
	local nExpArg = 0;
	local nNum = GetTask(TASKID_TMZ_PLAY_NUM)+1;
	if nNum <= 8 then
		nExpArg = 1-(1/512)*(nNum-4)^2;
	else
		nExpArg = 0.5;
	end
	return nExpArg;
end

--积分衰减系数1
function tmz_Award_Mark_Arg()
	local tNumArg = {{9,8,7,6,5,4,3,2,1},{0,0.2,0.3,0.6,0.6,0.8,1,0.8,0.7}};
	local nMarkArg = 0;
	local nNum = GetTask(TASKID_TMZ_PLAY_NUM)+1;
	for i = 1,getn(tNumArg[1]) do
		if nNum >= tNumArg[1][i] then
			nMarkArg = tNumArg[2][i];
			break;
		end
	end
	return nMarkArg;
end

function tmz_get_award()
	
	--先判断是否参加了上一场对阵，再判断是否为有效参与
	if GetTask(TASKID_TMZ_PLAY_RESULT) <= 0 then
		Talk(1,"",g_NpcName.."C竎 h� v蒼 ch璦 tham gia th� nghi謒 Thi猲 M玭 Tr薾 trc");
		return 0;
	end

	local nActivePoint = 0;
	local nActiveLevel = 1;
	nActivePoint, nActiveLevel = tmz_get_active_point();
	local sTalk = format("Thi誹 hi謕 tr猲 Di詎 V� Trng bi觰 hi謓 %s, n猲 l莕 di詎 v� n祔 ngo礽 ph莕 thng tham d� ra c遪 c� th� nh薾 頲 %s ph莕 thng t輈h c鵦.", tbAcvtiveDesc[nActiveLevel][2], "H� Qu﹏ C玭g Chng", tbAcvtiveDesc[nActiveLevel][1]);
	Say(g_NpcName..sTalk,
		6,
		format("%s/#tmz_confirm_award(0)","Nh薾 thng tr鵦 ti誴"),
		format("%s/#tmz_ask_award(1)",format("D飊g %s nh薾 thng",tAwardItem[1][1])),
		format("%s/#tmz_ask_award(2)",format("D飊g %s nh薾 thng",tAwardItem[2][1])),
		format("%s/#tmz_ask_award(3)",format("D飊g %s nh薾 thng",tAwardItem[3][1])),
		format("%s/#tmz_ask_award(4)",format("D飊g %s nh薾 thng",tAwardItem[4][1])),
		"T筸 th阨 kh玭g nh薾/gf_DoNothing")
end

function tmz_ask_award(nType)
	if GetTask(TASKID_TMZ_PLAY_RESULT) <= 0 then
		Talk(1,"",g_NpcName.."C竎 h� v蒼 ch璦 tham gia th� nghi謒 Thi猲 M玭 Tr薾 trc");
		return 0;
	end

	nType = nType or 0;
	
	local tbNormal = tbNormalAward[nType];
	local szAward = format("C竎 h� x竎 nh薾 d飊g <color=yellow>%s<color> nh薾 thng?", tAwardItem[nType][1] or "" );
--	szAward = szAward .. "您将获得";
--	
--	for i=1,getn(tbNormal.tbAward) do
--		local szUnit = "";
--		local szName = "";
--		local nCount = 0;
--		if (tbNormal.tbAward[i][1] == 1) then
--			szUnit = "个";
--			szName = tbNormal.tbAward[i][2];
--			nCount = tbNormal.tbAward[i][3][4];
--		elseif (tbNormal.tbAward[i][1] == 2) then
--			szUnit = "点";
--			szName = "经验";
--			nCount = tbNormal.tbAward[i][2];
--		elseif (tbNormal.tbAward[i][1] == 3) then
--			szUnit = "";
--			szName = "金钱";
--			nCount = tbNormal.tbAward[i][2];
--		elseif (tbNormal.tbAward[i][1] == 4) then
--			szUnit = "点";
--			szName = "声望";
--			nCount = tbNormal.tbAward[i][2];
--		elseif (tbNormal.tbAward[i][1] == 5) then
--			szUnit = "点";
--			szName = "师门贡献";
--			nCount = tbNormal.tbAward[i][2];
--		end
--		szAward = szAward .. format("<color=green>%d<color>%s<color=yellow>%s<color>, ",nCount, szUnit, szName);
--	end
	Say(g_NpcName .. szAward,
		3,
		"\n ng, ta mu鑞 nh薾 thng/#tmz_confirm_award("..nType..")",
		"\n ta ch鋘 sai r錳/tmz_get_award",
		"\n t筸 th阨 ch璦 mu鑞/gf_DoNothing");
end

function tmz_confirm_award(nType)
	if GetTask(TASKID_TMZ_PLAY_RESULT) <= 0 then
		Talk(1,"",g_NpcName.."C竎 h� v蒼 ch璦 tham gia th� nghi謒 Thi猲 M玭 Tr薾 trc");
		return 0;
	end

	nType = nType or 0;
	local tbNeedItem = tAwardItem[nType]	
--	if nType == 4 then
--		if GetItemCount(2,1,9999) < 1 or GetItemCount(2,1,9998) < 1 or GetItemCount(2,1,9977) < 1 then
--			Talk(1,"",g_NpcName.."C竎 h� ch鋘 nh薾 thng d筺g VIP m� kh玭g mang  c竎 lo筰 qu﹏ c玭g");
--			return 0;
--		end
--	else
		if type(tbNeedItem[1]) == "string" then
			if GetItemCount(tbNeedItem[2],tbNeedItem[3],tbNeedItem[4]) < tbNeedItem[5] then
				Talk(1,"",g_NpcName.."C竎 h� mang kh玭g "..tbNeedItem[1]..".");
				return 0;
			end
		end
--	end
	local nNeedRoom = 0;
	local nNeedWeight = 0;
	local nActivePoint = 0;
	local nActiveLevel = 1;
	nActivePoint, nActiveLevel = tmz_get_active_point();
	local tbActive = tbAcvtiveLossAward[nActiveLevel];
	local tbNormal = tbNormalAward[nType];
	
	local bIsWin = 0--获胜标记
	if (GetTask(TASKID_TMZ_PLAY_RESULT) == 2) then
		tbActive = tbAcvtiveWinAward[nActiveLevel];
		bIsWin = 1--获胜标记
	end
	
	if (tbActive == nil or tbNormal == nil) then
		return 0;
	end
	
	nNeedRoom = tbNormal.nBagLimit;
	nNeedRoom = nNeedRoom + tbActive.nBagLimit;
	nNeedWeight = tbNormal.nWeightLimit;
	nNeedWeight = nNeedWeight + tbActive.nWeightLimit;
	if gf_Judge_Room_Weight(nNeedRoom+4,nNeedWeight,g_NpcName) ~= 1 then --+4预留给活动奖励的空间
		return 0;
	end
--	if nType == 4 then
--		if DelItem(2,1,9999,1) ~= 1 or DelItem(2,1,9998,1) ~= 1 or DelItem(2,1,9977,1) ~= 1 then
--			return 0
--		end
--	else
		if type(tbNeedItem[1]) == "string" then
			if DelItem(tbNeedItem[2],tbNeedItem[3],tbNeedItem[4],tbNeedItem[5]) ~= 1 then
				return 0;
			end
		end
--	end
	
	local tAddRate = {
		nExpAddRate = (1 + TMZ_EXP_EXT_RATE)*(1 + GetVipCardParam()),
		nJunGongAddRate = (1 + TMZ_JUNGONG_EXT_RATE),
	}
	if bIsWin == 0 then--负方不给军功加成
		tAddRate.nJunGongAddRate = 1
	end
	gf_EventGiveAllAward(tbNormal.tbAward,"Thi猲 M玭 tr薾",format("Nh薾 thng type: %d nActivePoint: %d",nType,nActivePoint),tAddRate);
--	if bIsWin == 0 then--负方活跃度经验奖励/3
--		tAddRate.nExpAddRate = tAddRate.nExpAddRate/3
--	end
	gf_EventGiveAllAward(tbActive.tbAward,"Thi猲 M玭 tr薾",format("Nh薾 thng type: %d nActivePoint: %d",nType,nActivePoint),tAddRate);
	if(nActiveLevel == 6) then
		Msg2Global(format("%s trong Thi猲 M玭 Di詎 V� Trng l鵦 竝 qu莕 h飊g, ch鉯 s竛g m閠 phng, qu� th藅 nh﹏ trung h祇 ki謙.",GetName()));
	end
	-- Chuy觧 Sinh 5
	if GetTask(TRANSLIFE_MISSION_ID) == 34 and gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK1) < 80 then
				gf_SetTaskByte(TRANSLIFE_TASK_5_1, TRANSLIFE_BYTE_TASK1, gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK1) +1)
				if gf_GetTaskByte(TRANSLIFE_TASK_5_1,TRANSLIFE_BYTE_TASK1) == 80 then
					TaskTip("Ho祅 th祅h y猽 c莡 c馻 B筩h Ti猲 Sinh ho祅 th祅h 80 l莕 Thi猲 m玭 tr薾")
				end
	end
	-----------------------Chu鏸 nhi謒 v� Chuy觧 Sinh 6
	local nCS6_TMT =  floor(GetTask(TSK_CS6_COUNTC)/100)
	local nCS6_TMT_Num = mod(GetTask(TSK_CS6_COUNTC),100)
	if mod(nCS6_TMT,100) < 20 and GetTask(TSK_CS6_TULINH) == 3 then
		nCS6_TMT = (nCS6_TMT + 1) * 100 + nCS6_TMT_Num
		SetTask(TSK_CS6_COUNTC, nCS6_TMT)
	end
	------------------------	
	local nCheckTMT = GetTask(368)
	nType = tonumber(nType)
	WriteLogEx(THIENMON_LOG_TITLE, "i 甶觤 Thi猲 M玭 Tr薾: "..nCheckTMT)
	
	--不再奖励真气
	--AwardZhenQi_TianMenZhen(nActiveLevel, bIsWin)--天门阵获胜奖励真气
	
	if bIsWin == 1 then
		_MissionAward_RandAward(g_tWinExtraAward, "Ph莕 thng phe th緉g Thi猲 M玭 Tr薾")--胜方专属奖励
		gf_EventGiveAllAward(g_tWinExtraAward2[nType].tbAward,"Thi猲 M玭 tr薾",format("Nh薾 %s ph莕 thng tham gia","Phe th緉g"),tAddRate);
		--Nh薾 qu﹏ c玭g cho server H醓 Ph鬾g
		-- if GetGlbValue(GLB_TSK_SERVER_ID) == 92 then
			-- gf_Modify("JunGong",tbQuanCong_HP[nType][1])
		-- end
	else
		gf_EventGiveAllAward(g_tLoseExtraAward2[nType].tbAward,"Thi猲 M玭 tr薾",format("Nh薾 %s ph莕 thng tham gia","Phe thua"),tAddRate);
		--Nh薾 qu﹏ c玭g cho server H醓 Ph鬾g
		-- if GetGlbValue(GLB_TSK_SERVER_ID) == 92 then
			-- gf_Modify("JunGong",tbQuanCong_HP[nType][2])
		-- end
	end
--	local nQCPoint =  tbQuanCongTMT[nType+1][1]
	local nCampBase = 1
	local nExp_TMT = 5000000
	
	if nCheckTMT < 2 then
--		nQCPoint = tbQuanCongTMT[nType+1][2]
		nExp_TMT = 1900000
	end 
	ModifyExp(nExp_TMT)	
--	if  GetTask(701) < 0 then
--		nCampBase = -1
--	end
	
--	SetTask(701,GetTask(701) + nQCPoint * nCampBase)
--	Msg2Player("B筺 nh薾 頲 "..nQCPoint.." 甶觤 qu﹏ c玭g")
	WriteLogEx(THIENMON_LOG_TITLE, "Qu﹏ c玭g Thi猲 M玭 Tr薾")	
	
	AwardZhenQi_TianMenZhen(nActiveLevel, bIsWin)--天门阵获胜奖励真气
	CalcBattleRank()
	UpdateBattleMaxRank()
	SetTask(TASKID_TMZ_PLAY_RESULT,0);
	
	tmz_clear_task_id();
	--Observer:onEvent(OE_TMZ_Get_Award,{nWin,nType}); --输赢，金虎银虎标记
	--==============额外奖励接口award.lua==============
--	if nType ~= 4 then
		extra_tianmenzhen_award(nType)
--	end
	--活动产出
	if bIsWin == 1 then
		--奥运活动
		oly_AddShengHuo(6,1);
		--追回字帖大作战
		dzt_tmz_succ();
		--新资料片卡牌活动
		cc_tmz_award_succ();
	else
		oly_AddShengHuo(2,1);
		dzt_tmz_fail();
		--新资料片卡牌活动
		cc_tmz_award_fail();
	end
	-----------------------Chu鏸 nhi謒 v� уng H祅h
	if CFG_NhiemVuDongHanh == 1 then
		if DongHanh_GetStatus() == 0 and (DongHanh_GetMission() == 9 or DongHanh_GetMission() == 10) then
			if DongHanh_GetMissionPart() > 0 then
				DongHanh_SetMissionPart()
				if DongHanh_GetMissionPart() == 0 then
					DongHanh_SetStatus()
				end
			end
		end
	end
	--------------------------------
	ThienMonTran_NhanThuong(nType)
	--其他功能或活动产出汇总
	aw_tmz_award(nType);
	
	_stat_when_award(nType, nActiveLevel)
	
	--武林功勋
	merit_TianMenZhen(bIsWin, nType);
end

function tmz_change_mark()
	local tSel = {
--		"我要查看相关套装/#Sale(147,100,1)",
--		"我要用积分兑换本流派的[天门系列]武器（可交易）/tmz_change_weapon",
--		"我要用积分将[天门系列]装备升级为[星刻系列]装备（不可交易）/#tmz_change_s2(1)",
--		"我要用积分将[星刻系列]装备升级为[天仪系列]装备（不可交易）/#tmz_change_s2(2)",
		"10 甶觤 t輈h l騳 i 頲 1 Kim Tinh/#tmz_change_stone(1)",
		"10 甶觤 t輈h l騳 i 頲 1 M閏 Tinh/#tmz_change_stone(2)",
		"10 甶觤 t輈h l騳 i 頲 1 Th駓 Tinh/#tmz_change_stone(3)",
		"10 甶觤 t輈h l騳 i 頲 1 H醓 Tinh/#tmz_change_stone(4)",
		"10 甶觤 t輈h l騳 i 頲 1 Th� Tinh/#tmz_change_stone(5)",
		"Kh玭g c� g�!/gf_DoNothing",
	}
	Say(g_NpcName.."觤 t輈h l騳 Thi猲 M玭 Tr薾 c馻 c竎 h� l�: <color=yellow>"..GetTask(TASKID_TMZ_AWARD_MARK).."/"..MAX_MARK.."<color>. Чi hi謕 mu鑞 i tr筺g b� g�?", getn(tSel), tSel)
end

function tmz_change_stone(nType)
	if nType < 1 or nType > 5 then return end
	local nNeed = 10;
	if GetTask(TASKID_TMZ_AWARD_MARK) < nNeed then
		Talk(1,"",g_NpcName.."觤 t輈h l騳 c馻 c竎 h� kh玭g .");
		return 0;
	end
	if gf_Judge_Room_Weight(1,1,g_NpcName) ~= 1 then
		return 0;
	end
	gf_ModifyTask(TASKID_TMZ_AWARD_MARK, -nNeed);
	AddItem(2,201,nType*2,1);
end

function tmz_change_weapon()
	local nCheckRoute = gf_CheckPlayerRoute()
	if nCheckRoute == 0 then
		Talk(1,"",g_NpcName.."C竎 h� v蒼 ch璦 gia nh藀 m玭 ph竔, kh玭g th� tham gia.");
		return 0;
	end
	local nRoute = GetPlayerRoute();
	Say(g_NpcName.."V� kh� [H� Thi猲 M玭] c莕 t <color=yellow>c蕄 75<color> m韎 c� th� trang b�, i <color=yellow>["..tAwardWeapon[nRoute][1][1].."]<color>c莕 <color=yellow>"..tAwardWeapon[nRoute][1][5].."<color> 甶觤 t輈h l騳 Thi猲 M玭 Tr薾, hi謓 t筰 c竎 h�  c�: <color=yellow>"..GetTask(TASKID_TMZ_AWARD_MARK).."/"..MAX_MARK.."<color> 甶觤, c� mu鑞 i?",
		2,
		"\nng/tmz_change_weapon_confirm",
		"\nKh玭g c莕/gf_DoNothing")
end

function tmz_change_weapon_confirm()
	local nRoute = GetPlayerRoute();
	if GetTask(TASKID_TMZ_AWARD_MARK) < tAwardWeapon[nRoute][1][5] then
		Talk(1,"",g_NpcName.."觤 t輈h l騳 c馻 c竎 h� kh玭g .");
		return 0;
	end
	if gf_Judge_Room_Weight(1,10,g_NpcName) ~= 1 then
		return 0;
	end
	SetTask(TASKID_TMZ_AWARD_MARK,GetTask(TASKID_TMZ_AWARD_MARK)-tAwardWeapon[nRoute][1][5]);
	local nAdd_flag,nIdx = AddItem(tAwardWeapon[nRoute][1][2],tAwardWeapon[nRoute][1][3],tAwardWeapon[nRoute][1][4],1,1,-1,-1,-1,-1,-1,-1);
	if nAdd_flag == 1 then
		Msg2Player("B筺 nh薾 頲 ["..tAwardWeapon[nRoute][1][1].."]x1");
	end
	WriteLogEx(THIENMON_LOG_TITLE, "i 甶觤 t輈h l騳 s� d鬾g: "..tAwardWeapon[nRoute][1][1])
	WriteLog("[фi 甶觤 t輈h l騳 Thi猲 M玭 Tr薾]: t礽 kho秐: "..tostring(GetAccount()).."Nh﹏ v藅: "..tostring(GetName()).."Th阨 gian: "..tonumber(date("%Y%m%d")).."[фi 1 m鉵: "..tAwardWeapon[nRoute][1][1].."]. K� hi謚: "..nAdd_flag);
end

function tmz_change_s2(nTbIDX)
	local nCheckRoute = gf_CheckPlayerRoute()
	if nCheckRoute == 0 then
		Talk(1,"",g_NpcName.."C竎 h� v蒼 ch璦 gia nh藀 m玭 ph竔, kh玭g th� tham gia.");
		return 0;
	end
	local nRoute = GetPlayerRoute();
	local strtab = {
	format("[%s] n﹏g c蕄 th祅h [%s] (c莕 甶觤 t輈h l騳 Thi猲 M玭 Tr薾 %d)/#tmz_change_s2_ask(%d,1,1)",tAwardCloth[nTbIDX][1][1][1][1],tAwardCloth[nTbIDX+1][1][1][1][1],tAwardCloth[nTbIDX+1][1][1][1][5],nTbIDX),
	format("[%s] n﹏g c蕄 th祅h [%s] (c莕 甶觤 t輈h l騳 Thi猲 M玭 Tr薾 %d)/#tmz_change_s2_ask(%d,1,2)",tAwardCloth[nTbIDX][1][2][1][1],tAwardCloth[nTbIDX+1][1][2][1][1],tAwardCloth[nTbIDX+1][1][2][1][5],nTbIDX),
	format("[%s] n﹏g c蕄 th祅h [%s] (c莕 甶觤 t輈h l騳 Thi猲 M玭 Tr薾 %d)/#tmz_change_s2_ask(%d,2,1)",tAwardCloth[nTbIDX][2][1][1][1],tAwardCloth[nTbIDX+1][2][1][1][1],tAwardCloth[nTbIDX+1][2][1][1][5],nTbIDX),
	format("[%s] n﹏g c蕄 th祅h [%s] (c莕 甶觤 t輈h l騳 Thi猲 M玭 Tr薾 %d)/#tmz_change_s2_ask(%d,2,2)",tAwardCloth[nTbIDX][2][2][1][1],tAwardCloth[nTbIDX+1][2][2][1][1],tAwardCloth[nTbIDX+1][2][2][1][5],nTbIDX),
	format("[%s] n﹏g c蕄 th祅h [%s] (c莕 甶觤 t輈h l騳 Thi猲 M玭 Tr薾 %d)/#tmz_change_s2_ask(%d,3,1)",tAwardCloth[nTbIDX][3][1][1][1],tAwardCloth[nTbIDX+1][3][1][1][1],tAwardCloth[nTbIDX+1][3][1][1][5],nTbIDX),
	format("[%s] n﹏g c蕄 th祅h [%s] (c莕 甶觤 t輈h l騳 Thi猲 M玭 Tr薾 %d)/#tmz_change_s2_ask(%d,3,2)",tAwardCloth[nTbIDX][3][2][1][1],tAwardCloth[nTbIDX+1][3][2][1][1],tAwardCloth[nTbIDX+1][3][2][1][5],nTbIDX),
	format("[%s] n﹏g c蕄 th祅h [%s] (c莕 甶觤 t輈h l騳 Thi猲 M玭 Tr薾 %d)/#tmz_change_s2_ask(%d,4,1)",tAwardWeapon[nRoute][nTbIDX][1],tAwardWeapon[nRoute][nTbIDX+1][1],tAwardWeapon[nRoute][nTbIDX+1][5],nTbIDX),
	"Kh玭g c� g�!/gf_DoNothing",
	};
	local sTalk = "";
	if nTbIDX == 1 then
		sTalk = "Trang b� [H� Tinh Kh綾] c莕 t c蕄 <color=yellow>80<color> m韎 c� th� trang b�, ";
	elseif nTbIDX == 2 then
		sTalk = "Trang b� [H� Thi猲 Ngh躠] c莕 t c蕄 <color=yellow>85 <color> m韎 c� th� trang b�, ";
	end
	Say(g_NpcName..sTalk.."觤 t輈h l騳 Thi猲 M玭 Tr薾 hi謓 t筰 c馻 i hi謕: <color=yellow>"..GetTask(TASKID_TMZ_AWARD_MARK).."/"..MAX_MARK.."<color>. Khi n﹏g c蕄 c莕 m芻 trang b� tr猲 ngi, i hi謕 c莕 n﹏g c蕄 m鉵 trang b� n祇? <color=red>Ch� �: trang b� c莕 ph秈 gi秈 kh鉧 trc khi n﹏g c蕄, sau khi n﹏g c蕄 s� b秓 l璾 c蕄  cng h鉧 v� nh h錸 v鑞 c� c馻 trang b� <color>",
		getn(strtab),
		strtab)
end

function tmz_change_s2_ask(nTbIDX,nWz,nType)
	local nRoute = GetPlayerRoute();
	local strTalk = "";
	if nWz ~= 4 then
		strTalk = format("Чi hi謕 x竎 nh mang <color=yellow>[%s]<color> n﹏g c蕄 th祅h <color=yellow>[%s]<color>? C莕 c� <color=yellow>%d<color> 甶觤 t輈h l騳 Thi猲 M玭 Tr薾 <color=yellow>khi n﹏g c蕄 c莕 m芻 trang b� tr猲 ngi <color>",tAwardCloth[nTbIDX][nWz][nType][1][1],tAwardCloth[nTbIDX+1][nWz][nType][1][1],tAwardCloth[nTbIDX+1][nWz][nType][1][5]);
	else
		strTalk	= format("Чi hi謕 x竎 nh mang <color=yellow>[%s]<color> n﹏g c蕄 th祅h <color=yellow>[%s]<color>? C莕 c� <color=yellow>%d<color> 甶觤 t輈h l騳 Thi猲 M玭 Tr薾 <color=yellow>khi n﹏g c蕄 c莕 m芻 trang b� tr猲 ngi <color>",tAwardWeapon[nRoute][nTbIDX][1],tAwardWeapon[nRoute][nTbIDX+1][1],tAwardWeapon[nRoute][nTbIDX+1][5]);
	end
	Say(g_NpcName..strTalk,
		3,
		"\n x竎 nh, ta mu鑞 n﹏g c蕄/#tmz_change_s2_confirm("..nTbIDX..","..nWz..","..nType..")",
		"\n kh玭g, ta ch鋘 sai r錳/#tmz_change_s2("..nTbIDX..")",
		"\n Tho竧 /gf_DoNothing")
end

function tmz_change_s2_confirm(nTbIDX,nWz,nType)
	if gf_Judge_Room_Weight(1,10,g_NpcName) ~= 1 then
		return 0;
	end
	local nRoute = GetPlayerRoute();
	local nBody = GetBody();
	if nWz ~= 4 then
		if GetTask(TASKID_TMZ_AWARD_MARK) < tAwardCloth[nTbIDX+1][nWz][nType][nBody][5] then
			Talk(1,"",g_NpcName.."觤 t輈h l騳 Thi猲 M玭 Tr薾 c馻 i hi謕 ch璦 , kh玭g th� n﹏g c蕄 trang b�");
			return 0;
		end
		local tWz = {0,1,3};
		local nIdx = GetPlayerEquipIndex(tWz[nWz]); --穿在身上的索引
		if nIdx == 0 then  --没有穿东西
			Talk(1,"",g_NpcName.."M鉵 trang b� c竎 h� 產ng m芻 kh玭g ph秈"..tAwardCloth[nTbIDX][nWz][nType][nBody][1]..", h穣 m芻 ng trang b� tr猲 ngi!");
			return 0;
		end		
		if GetItemSpecialAttr(nIdx,"LOCK") == 1 then --锁定判断
			Talk(1,"",g_NpcName.."Trang b� n祔  b� kh鉧, gi秈 kh鉧 sau h穣 n﹏g c蕄!");
			return
		end
		local nId1,nId2,nId3 = GetPlayerEquipInfo(tWz[nWz]);
		if nId1 ~= tAwardCloth[nTbIDX][nWz][nType][nBody][2] or nId2 ~= tAwardCloth[nTbIDX][nWz][nType][nBody][3] or nId3 ~= tAwardCloth[nTbIDX][nWz][nType][nBody][4] then
			Talk(1,"",g_NpcName.."M鉵 trang b� c竎 h� 產ng m芻 kh玭g ph秈"..tAwardCloth[nTbIDX][nWz][nType][nBody][1]..", h穣 m芻 ng trang b� tr猲 ngi!");
			return 0;
		end
		local nQianghua = GetEquipAttr(nIdx,2);--获取物品强化等级
		local nDing5 = GetItemSpecialAttr(nIdx,"DING5"); --获取装备是否定魂
		local nDing10 = GetItemSpecialAttr(nIdx,"DING10"); --获取装备是否定魂
		if DelItemByIndex(nIdx,-1) == 1 then
			SetTask(TASKID_TMZ_AWARD_MARK,GetTask(TASKID_TMZ_AWARD_MARK)-tAwardCloth[nTbIDX+1][nWz][nType][nBody][5]);
			local nAdd_flag,nNewIdx = AddItem(tAwardCloth[nTbIDX+1][nWz][nType][nBody][2],tAwardCloth[nTbIDX+1][nWz][nType][nBody][3],tAwardCloth[nTbIDX+1][nWz][nType][nBody][4],1,1,-1,-1,-1,-1,-1,-1,0,nQianghua);
			if nAdd_flag == 1 then
				if nDing5 == 1 then
					SetItemSpecialAttr(nNewIdx,"DING5",1); --定魂
				end
				if nDing10 == 1 then
					SetItemSpecialAttr(nNewIdx,"DING10",1); --定魂
				end
				Msg2Player("C竎 h� nh薾 頲 ["..tAwardCloth[nTbIDX+1][nWz][nType][nBody][1].."]x1");
			end
			WriteLogEx(THIENMON_LOG_TITLE, "фi trang b� "..". ID trc khi n﹏g c蕄: "..nId1..nId2..nId3.."ID sau khi n﹏g c蕄: "..tAwardCloth[nTbIDX+1][nWz][nType][nBody][2]..tAwardCloth[nTbIDX+1][nWz][nType][nBody][3]..tAwardCloth[nTbIDX+1][nWz][nType][nBody][4])
			WriteLog("[n﹏g c蕄 trang b� Thi猲 M玭 Tr薾]: T礽 kho秐: "..tostring(GetAccount()).."Nh﹏ v藅: "..tostring(GetName()).."Th阨 gian: "..tonumber(date("%Y%m%d")).."[d飊g"..tAwardCloth[nTbIDX][nWz][nType][nBody][1].."T╪g c蕄 th祅h "..tAwardCloth[nTbIDX+1][nWz][nType][nBody][1]..". ID trc khi n﹏g c蕄: "..nId1..nId2..nId3.."ID sau khi n﹏g c蕄: "..tAwardCloth[nTbIDX+1][nWz][nType][nBody][2]..tAwardCloth[nTbIDX+1][nWz][nType][nBody][3]..tAwardCloth[nTbIDX+1][nWz][nType][nBody][4].."]. K� hi謚: "..nAdd_flag);
		end
	else
		if GetTask(TASKID_TMZ_AWARD_MARK) < tAwardWeapon[nRoute][nTbIDX+1][5] then
			Talk(1,"",g_NpcName.."觤 t輈h l騳 Thi猲 M玭 Tr薾 c馻 i hi謕 ch璦 , kh玭g th� n﹏g c蕄 trang b�");
			return 0;
		end
		local nIdx = GetPlayerEquipIndex(2); --穿在身上的索引
		if nIdx == 0 then  --没有穿东西
			Talk(1,"",g_NpcName.."M鉵 trang b� c竎 h� 產ng m芻 kh玭g ph秈"..tAwardWeapon[nRoute][nTbIDX][1]..", h穣 m芻 ng trang b� tr猲 ngi!");
			return 0;
		end
		if GetItemSpecialAttr(nIdx,"LOCK") == 1 then --锁定判断
			Talk(1,"",g_NpcName.."Trang b� n祔  b� kh鉧, gi秈 kh鉧 sau h穣 n﹏g c蕄!");
			return
		end
		local nId1,nId2,nId3 = GetPlayerEquipInfo(2);
		if nId1 ~= tAwardWeapon[nRoute][nTbIDX][2] or nId2 ~= tAwardWeapon[nRoute][nTbIDX][3] or nId3 ~= tAwardWeapon[nRoute][nTbIDX][4] then
			Talk(1,"",g_NpcName.."M鉵 trang b� c竎 h� 產ng m芻 kh玭g ph秈"..tAwardWeapon[nRoute][nTbIDX][1]..", h穣 m芻 ng trang b� tr猲 ngi!");
			return 0;
		end
		local nQianghua = GetEquipAttr(nIdx,2);--获取物品强化等级
		local nDing5 = GetItemSpecialAttr(nIdx,"DING5"); --获取装备是否定魂
		local nDing10 = GetItemSpecialAttr(nIdx,"DING10"); --获取装备是否定魂
		if DelItemByIndex(nIdx,-1) == 1 then
			SetTask(TASKID_TMZ_AWARD_MARK,GetTask(TASKID_TMZ_AWARD_MARK)-tAwardWeapon[nRoute][nTbIDX+1][5]);
			local nAdd_flag,nNewIdx = AddItem(tAwardWeapon[nRoute][nTbIDX+1][2],tAwardWeapon[nRoute][nTbIDX+1][3],tAwardWeapon[nRoute][nTbIDX+1][4],1,1,-1,-1,-1,-1,-1,-1,0,nQianghua);
			if nAdd_flag == 1 then
				if nDing5 == 1 then
					SetItemSpecialAttr(nNewIdx,"DING5",1); --定魂
				end
				if nDing10 == 1 then
					SetItemSpecialAttr(nNewIdx,"DING10",1); --定魂
				end
				Msg2Player("C竎 h� nh薾 頲 ["..tAwardWeapon[nRoute][nTbIDX+1][1].."]x1");
			end
			WriteLogEx(THIENMON_LOG_TITLE, "фi trang b� "..". ID trc khi n﹏g c蕄: "..nId1..nId2..nId3.."ID sau khi n﹏g c蕄: "..tAwardWeapon[nRoute][nTbIDX+1][2]..tAwardWeapon[nRoute][nTbIDX+1][3]..tAwardWeapon[nRoute][nTbIDX+1][4])
			WriteLog("[n﹏g c蕄 trang b� Thi猲 M玭 Tr薾]: T礽 kho秐: "..tostring(GetAccount()).."Nh﹏ v藅: "..tostring(GetName()).."Th阨 gian: "..tonumber(date("%Y%m%d")).."[d飊g"..tAwardWeapon[nRoute][nTbIDX][1].."T╪g c蕄 th祅h "..tAwardWeapon[nRoute][nTbIDX+1][1]..". ID trc khi n﹏g c蕄: "..nId1..nId2..nId3.."ID sau khi n﹏g c蕄: "..tAwardWeapon[nRoute][nTbIDX+1][2]..tAwardWeapon[nRoute][nTbIDX+1][3]..tAwardWeapon[nRoute][nTbIDX+1][4].."]. K� hi謚: "..nAdd_flag);
		end
	end
end

function tmz_about_detail()
	local strtab = {
		". Tham gia di詎 v�/tmz_about_detail_1",
		". Quy t綾 di詎 v�/tmz_about_detail_2",
		". Ph莕 thng di詎 v�/tmz_about_detail_3",
		--"◆额外奖励/tmz_about_detail_4",
		". Tr� l筰/main"
	};
	Say(g_NpcName.."Di詎 v� trng n祔 ch輓h l� m閠 b秐 sao c馻 Thi猲 M玭 Tr薾 m� Li猽 qu﹏  b� tr�, ta  l謓h cho tng s� trong qu﹏ luy謓 t藀 ng祔 m, nay cu鑙 c飊g  t譵 ra huy襫 c� trong .",
		getn(strtab),
		strtab);
end

function tmz_about_detail_1()
	Talk(1,"tmz_about_detail",g_NpcName.."Thi誹 hi謕 c� th� t� i di 3 ngi ho芻 c� nh﹏ b竜 danh tham gia. N猲 nh� th祅h vi猲 trong i nh蕋 nh ph秈 nh薾 thng 輙 nh蕋 1 l莕 trc khi tham gia tr薾 ti誴 theo");
end

function tmz_about_detail_2()
	Talk(1,"tmz_about_detail",g_NpcName.."1, thi誹 hi謕 ho芻 th祅h vi猲 trong i s� 頲 <color=yellow>chuy觧 ng蓇 nhi猲<color> n 1 n琲 trong di詎 v� trng. Khi s� ngi tham gian 2 b猲 l韓 h琻 ho芻 b籲g<color=yellow>"..PLAYER_NEED_NUM.."<color>ngi th� chi課 tr薾 s� b総 u. \n  2, Khi chi誱 頲 Tr薾 Nh穘, m鏸 c竎h 15 gi﹜ t╪g 1 l莕 th阨 gian chi誱 tr薾 cho phe m譶h. Th阨 gian chi誱 tr薾 t n"..APPEAR_FLAG_POINT.."ph髏 <color>, l藀 t鴆 c� th� t蕁 c玭g <color=yellow>Tr薾 K�<color> (phe doanh ch�), ti猽 di謙 tr薾 k� c� th� tr鵦 ti誴 nh薾 頲 lng l韓 th阨 gian chi誱 tr薾. \n  3, Th阨 gian chi誱 tr薾 c馻 b蕋 k� phe n祇 t n <color=yellow>"..OVER_GAME_POINT.."<color>ph髏 l藀 t鴆 k誸 th骳 tr薾 chi課. Thi誹 hi謕 s� nh薾 頲 ph莕 thng d鵤 tr猲 bi觰 hi謓 c馻 b秐 th﹏.\n  4, Ngi ch琲 c� bi觰 hi謓 ti猽 c鵦 trong i tr薾 s� b� m阨 kh醝 di詎 v� trng.");
end

function tmz_about_detail_3()
	Talk(1,"tmz_about_detail_3_2",g_NpcName..format("\n    1.	C蕌 th祅h ph莕 thng di詎 v� \n    Ph莕 thng di詎 v� l� ph莕 thng t鎛g h頿 khi tham gia v�  t輈h c鵦 c閚g l筰, khi nh薾 thng s� nh薾 頲 c� 2. M鏸 ng祔 m鏸 ngi ch琲 ch� c� th� tham gia <color=green>%d<color> l莕 Di詎 V�.",TMZ_DAILY_AWARD_LIMIT))
end

function tmz_about_detail_3_2()
	Talk(1,"tmz_about_detail_3_3",g_NpcName..format("\n    2.	Ph莕 thng khi tham gia \n    Ch� c莕 tham gia v� nh n h誸 tr薾 l� c� th� nh薾 thng, ph莕 thng n祔 c� th� d飊g nh鱪g o c� <color=yellow>%s<color>  nh﹏ i nhi襲 l莕, v� c飊g h蕄 d蒼.","Qu﹏ C玭g Chng"));
end

function tmz_about_detail_3_3()
	Talk(1,"tmz_about_detail",g_NpcName..format("\n    3.	 Ph莕 thng t輈h c鵦棗ч t輈h c鵦\n     t輈h c鵦 l� c╪ c鴇飊g  畂 lng ngi ch琲 c� th� nh薾 頲 ph萴 ch蕋 v藅 ph萴 thng,  t輈h c鵦 d鵤 tr猲 <color=yellow>s� ngi nh b筰 頲<color>, <color=yellow>t鎛g s竧 thng xu蕋 chi猽<color>, <color=yellow>s� l莕 chi誱 l躰h tr薾 nh穘<color>, <color=yellow>s� lng qu竔 ti猽 di謙 頲<color>, <color=yellow>chi誱 l躰h tr薾 k�<color>� c馻 c竎 h� bi觰 hi謓 tr猲 di詎 v� trng,  t輈h c鵦 c祅g cao, ph莕 thng c祅g h蕄 d蒼, ng th阨 kh玭g th� d飊g <color=yellow>%s<color>  nh﹏ i ph莕 thng.","Qu﹏ C玭g Chng"))
end

function tmz_about_detail_4()
	Talk(1,"tmz_about_detail",g_NpcName.."V祇 12: 00 -14: 00 v� 18: 00 - 20: 00 m鏸 ng祔, ngi ch琲 ng k� tham gia u tr薾 v� nh薾 頲 ph莕 thng 甶觤 kinh nghi謒 s� 頲 nh﹏ i. Hi謚 qu� n祔 kh玭g t竎 d鬾g v韎"..tAwardItem[1][1].." v�"..tAwardItem[2][1].."C閚g d錸.")
end

function tmz_about_tong()
	local nTongMember = IsTongMember();
	if nTongMember == 0 then --没入帮
		Talk(1,"",g_NpcName.."Y猽 c莡 gia nh藀 bang h閕 m韎 c� th� tham gia bang h閕 Thi猲 M玭 Tr薾.");
		return 0;
	end		
	local strtab = {
		"фi Xu Ti猽 Dao/tmz_Change_Xoyo_Gold",
		"фi Ng鋍 Ti猽 Dao (1 H遖 Th� B輈h i 頲 100 Ng鋍 Ti猽 Dao)/tmz_Change_Xoyo_Yu",
		"Tham gia bang h閕 Thi猲 M玭 Tr薾 xuy猲 server (c莕 200 Xu Ti猽 Dao)/tmz_goto_realm",
		"Nh薾 thng Thi猲 M玭 Tr薾 xuy猲 server/tmz_tong_award",
		"Server i tr薾/tmz_Special_Service",
		"Gi韎 thi謚 i tr薾/tmz_tong_detail",
		"K誸 th骳 i tho筰/gf_DoNothing",
	};
	Say(g_NpcName.."T譵 ta c� vi謈 g� kh玭g?",
		getn(strtab),
		strtab)
end

function tmz_Change_Xoyo_Gold()
	local strtab = {
		"D飊g v祅g i Xu Ti猽 Dao (1 v祅g i 100 Xu Ti猽 Dao)/tmz_Use_JXB",
		"tr� l筰/tmz_about_tong",
		"K誸 th骳 i tho筰/gf_DoNothing",
	};
	Say(g_NpcName.."Sau khi vt server ngo礽 <color=yellow>Xu Ti猽 Dao<color> ra nh鱪g ti襫 t� kh竎 u kh玭g th� s� d鬾g, ta c� th� gi髉 chuy觧 <color=yellow>v祅g<color> th祅h Xu Ti猽 Dao. Thi誹 hi謕 hi謓 產ng s� h鱱 "..GetXYB().." Xu Ti猽 Dao, v� sau c� th� ki觤 trang th玭g qua giao di謓 F2 (c� th� l� s� ﹎)",
		getn(strtab),
		strtab)
end

function tmz_Use_JXB()
	local nJxb = floor(GetCash()/10000);
	AskClientForNumber("tmz_Use_JXB_Confirm",1,nJxb*100,"Йi bao nhi猽 Xu Ti猽 Dao?");
end

function tmz_Use_JXB_Confirm(nCount)
	local nJxb = floor(GetCash()/10000);
	if nJxb < nCount/100 then
		Talk(1,"",g_NpcName.."Ti襫 v祅g c竎 h� mang theo kh玭g "..nCount.."Xu Ti猽 Dao.");
		return 0;
	end
	if Pay(nCount/100*10000) == 1 then
		EarnXYB(nCount);
--		Msg2Player("你获得"..nCount.."逍遥币。");
	end
end

function tmz_Change_Xoyo_Yu()
	Say(g_NpcName.."X竎 nh d飊g 1 [H遖 Th� B輈h] i 100 Ng鋍 Ti猽 Dao?",
		2,
		"\nX竎 nh薾/tmz_Change_Yu_Confirm",
		"\n Ph秐 h錳/tmz_about_tong")
end

function tmz_Change_Yu_Confirm()
	if GetItemCount(2,1,1001) < 1 then
		Talk(1,"",g_NpcName.."C竎 h� kh玭g mang theo H遖 Th� B輈h.");
		return 0;
	end
	if DelItem(2,1,1001,1) == 1 then
		EarnXYY(100);
	end
end

function tmz_goto_realm()
	local nDay = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	if ( nDay ~= 6 and nDay ~= 0 ) or ( nHour >= 18 or nHour < 14 ) then
		Talk(1,"","Thi猲 M玭 Tr薾 bang h閕 s� di詎 ra v祇 2h ~ 6h th� 7 v� ch� nh藅 h籲g tu莕.");
		return 0;
	end
	if GetLevel() < 80 then
		Talk(1,"",g_NpcName.."Tham gia Thi猲 M玭 Tr薾 bang h閕 y猽 c莡 ph秈 t c蕄  tr猲 80, quay v� luy謓 th猰 甶.");
		return 0;
	end
	local nTongMember = IsTongMember();
	if nTongMember == 0 then --没入帮
		Talk(1,"",g_NpcName.."C竎 h� c莕 gia nh藀 bang h閕 m韎 c� th� tham gia Bang H閕 Thi猲 M玭 Tr薾.");
		return 0;
	end	
	--加入帮会两天才能跨服
	local nJoinTime = GetTime() - GetJoinTongTime()
	if nJoinTime <= 172800 then
		Say(g_NpcName.."C竎 h� gia nh藀 bang ph竔 ch璦  2 ng祔, kh玭g th� tham gia Bang H閕 Thi猲 M玭 Tr薾.", 0)
		return 0;
	end
	if GetXYB() < 200 then
		Talk(1,"",g_NpcName.."Tham gia Bang H閕 Thi猲 M玭 Tr薾 c莕 <color=yellow>200 Xu Ti猽 Dao<color>, c竎 h� mang theo kh玭g .");
		return 0;
	end
	local nWeek = tf_GetWeekSequence(1,0); --周一凌晨
	if GetTask(TASK_TMZ_TONG_AWARD_WEEK) ~= 0 and GetTask(TASK_TMZ_TONG_AWARD_WEEK) < nWeek then
		if GetTask(TASk_TMZ_TONG_TOTAL_NUM) ~= 0 then
			Talk(1,"",g_NpcName.."C竎 h� v蒼 ch璦 nh薾 ph莕 thng tu莕 trc, h穣 nh薾 r錳 tham gia ti誴 th玦.");
			return 0;
		end	
	end	
	if gf_JudgeRoomWeight(15,100,g_NpcName) == 0 then
		return 0;
	end;		
	if PayXYB(200) == 1 then
		SetTask(TASKID_TMZ_TONG_IS_REALM,1);
		ChangeGroupWorld(5064,1621,3181,1);
	end
end


--=================================
function tmz_tong_AddCamp(nCurMapId,nCamp)
	local nOldIndex = PlayerIndex;
	local nTeamNumber = GetTeamSize();
	local nCurN = mf_GetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,nCurMapId);
	if nTeamNumber > 1 then
		for i=1, nTeamNumber do
			PlayerIndex = GetTeamMember(i); 
			mf_JoinMission(MISSION_ID,nCamp,nCurMapId);
			if GetName() == GetCaptainName() then
				WriteLogEx(THIENMON_LOG_TITLE, "t� i tham gia Lng S琻 B筩")
			end
			WriteLogEx(THIENMON_LOG_TITLE, "tham gia")
			TMZ_Write_TableData(nCurN,nCamp,0,0,0);
		end
		PlayerIndex = nOldIndex;
	else
		mf_JoinMission(MISSION_ID,nCamp,nCurMapId);
		TMZ_Write_TableData(nCurN,nCamp,0,0,0);
	end	
end

function tmz_tong_join(nType)
	local nTeamNumber = GetTeamSize();
	local sCapTainName = GetCaptainName();
	local nDay = tonumber(date("%w"));
	local nHour = tonumber(date("%H"));
	if ( nDay ~= 6 and nDay ~= 0 ) or ( nHour >= 18 or nHour < 14 ) then
		Talk(1,"",g_RealmNpcName.."Thi猲 M玭 Tr薾 bang h閕 s� di詎 ra v祇 2h ~ 6h th� 7 v� ch� nh藅 h籲g tu莕.");
		return 0;
	end
	if nTeamNumber > 1 and GetName() ~= sCapTainName then
		Talk(1,"",g_RealmNpcName.."T� i c莕 i trng n b竜 danh.");
		return 0;
	end
	if tmz_AreaCheck() == 0 then
		Talk(1,"",g_RealmNpcName.."Trong i ng� c� th祅h vi猲 v緉g m苩 ");
		return 0;
	end
	if tmz_PkValueCheck() == 0 then
		Talk(1,"",g_RealmNpcName.."Trong i ng� c� th祅h vi猲 s竧 kh� qu� n苙g (PK>10), kh玭g th� v祇");
		return 0;		
	end
	if tmz_TongMemberCheck() == 0 then
		Talk(1,"",g_RealmNpcName.."Trong t� i c� ngi kh玭g thu閏 c飊g m閠 bang h閕, kh玭g th� v祇 Thi猲 M玭 Tr薾.");
		return 0;		
	end
	if nTeamNumber == 0 then --没有组队
		nTeamNumber = 1;
	end
	local nCurMapId,nCamp = GLB_TMZ_GetSuitMap(nTeamNumber);
	local nOldIndex = PlayerIndex; 
	if nCurMapId == nil then --帮会已开启但不满足条件
		return 0;
	end
	if nCurMapId ~= 0 then --帮会已开启且满足条件
		tmz_tong_AddCamp(nCurMapId,nCamp);
	else --帮会还没开启
		if tmz_tong_Check(nType) == 0 then
			local tMsg = {"Thi猲 M玭 H� Ph� 蕁 輙 nh蕋 l� 1 c竔","Ng鋍 Ti猽 Dao 輙 nh蕋 20 c竔"};
			Talk(1,"",g_RealmNpcName.."Tham gia Thi猲 M玭 Tr薾 y猽 c莡 c莕 <color=yellow>bang ch�, ph� bang ch�, ho芻 trng l穙<color> d蒼 i <color=yellow>8 th祅h vi猲<color> bang h閕, ng th阨"..tMsg[nType]..".")
			return 0;
		end
		SetTaskTemp(211,nType);
		GLB_TMZ_GetOtherMap();
	end		
end

--检测是否符合开启条件
function tmz_tong_Check(nType)
	local nTongMember = IsTongMember();
	if nTongMember ~= 1 and nTongMember ~= 2 and nTongMember ~= 3 then
		return 0;
	end
	if GetTeamSize() < 8 then
		return 0;
	end
	if nType == 2 and GetXYY() < 20 then
		return 0;
	end
	local strTongName = GetTongName()
	local nOldIndex = PlayerIndex;
	for i=1,GetTeamSize() do
		PlayerIndex = GetTeamMember(i);
		if GetTongName() ~= strTongName then
			PlayerIndex = nOldIndex;
			return 0;
		end
	end 
	PlayerIndex = nOldIndex;
	return 1;
end

function tmz_tong_detail()
	local strtab = {
		"Quy tr譶h i tr薾/#tmz_tong_detail_1(1)",
		"觤 bang h閕 i tr薾/#tmz_tong_detail_1(2)",
		"C蕄  bang h閕 i tr薾/#tmz_tong_detail_1(3)",
		"ч t輈h c鵦 bang h閕/#tmz_tong_detail_1(4)",
		"Ph莕 thng /#tmz_tong_detail_1(5)",
		"tr� l筰/main",
	}
	Say("C竎 h� mu鑞 t譵 hi觰 v� phng di謓 n祇?",
		getn(strtab),
		strtab)
end

function tmz_tong_detail_1(nType)
	local strMsg = {
		[[    报名玩家等级需达到<color=yellow>80级<color>，并已加入帮派2天。
    玩家可以在每<color=yellow>周六、日的14点-18点<color>，通过骠骑将军郭君鹏传送到报名场地。再通过将校郭君怡报名参加跨服天门阵演武。报名时，需要由帮会的帮主、副帮主或者长老作为队长，组满8人队伍，并消耗一个天门虎符印。（进入人数上限见对阵等级说明）
    再次进入该帮派已开启的场地无需消耗天门虎符印，每个帮会同一时间最多开启一场天门对阵。
    <color=yellow>每个帮会每周可获得8个天门虎符印<color>，当周不用作废。如果对阵未开启，将补偿玩家天门虎符印。]],
		[[   帮会对阵积分是帮会参加跨服天门阵演武后的数值，它在每场决出胜负后发生变化。帮会对阵积分可在帮会面板查询。
    帮会对阵积分前二十名，可以在PVP天门阵面板查询(每周日凌晨刷新，超过300分则多出部分对半衰减）。]],
		[[    帮会对阵等级是用来衡量帮会在跨服天门阵中的实力，它由帮会对阵积分决定。其中，<color=yellow>2级需要150分，3级需要190分<color>。
    不同的帮会对阵等级，允许进入的最大人数不同。其中一级对应8人，二级对应12人，三级对应16人。只有相同对阵等级的帮会，才被允许在一起演武。]],
		[[    帮会在参加每场天门阵演武的时候，均会有帮会活跃度的判定。帮会活跃度与个人活跃度相关。
    当一次对阵中，有超过准入人数半数的帮众完成个人活跃度判定，则此次对阵方被认定为有效场次，<color=yellow>且参加该场对阵的该帮派玩家都认定为个人活跃度有效<color>。每个帮会需满足至少3场有效场次，才可在下周开放帮会奖励。]],
		[[    每场对阵结束后，玩家根据胜负情况可以在郭君鹏处领取对应数量的军需包，其中军需包共分4个等级，不同等级的军需包可获得不同物品的奖励。每周奖励：本周参加至少3场有效帮会对阵的玩家，在下周才可领取相应对阵等级的帮会奖励。领取依据按照本周24点截止时积分情况，奖励包括大量经验、天门阵积分和逍遥币等。
\p    对阵积分达到400分帮会的帮众（需参加过本周3场有效对阵），下周领取奖励时可额外获得<color=yellow>特效称号“天门群雄”<color>，帮主可获得<color=yellow>特效称号“天门英杰”<color>。
    对阵积分达到300且积分最高帮会的帮众（需参加过本周3场有效对阵），下周领取奖励时可额外获得<color=yellow>特效称号“天门群英”<color>，帮主可获得<color=yellow>特效称号“天门英豪”<color>]],
	};
	suTalk("tmz_tong_detail",strMsg[nType]);
end

function tmz_tong_back()
	Say(g_RealmNpcName.."C竎 h� x竎 nh mu鑞 tr� v�?",
		2,
		"\nX竎 nh薾/tmz_tong_confirm_back",
		"\nK誸 th骳 i tho筰/gf_DoNothing")
end

function tmz_tong_confirm_back()
	ChangeGroupWorld(350,1428,2818,0);
end

tUpLvXoYoYu = {200,600};

function tmz_Special_Service()
	local nTongMember = IsTongMember();
	if nTongMember ~= 1 and nTongMember ~= 2 and nTongMember ~= 3 then
		Talk(1,"",g_NpcName.."Server i tr薾 c� th� n﹏g cao c蕄  i tr薾 c馻 bang h閕, y猽 c莡 bang ch�, ph� bang ch� ho芻 trng l穙 ti課 h祅h thao t竎 n祔.");
		return 0;
	end
	DelRelayShareDataCopy(TMZ_TONG_RELAY_KEY_3,0,0);
	local tbTmzTong = SDB(TMZ_TONG_RELAY_KEY_3,0,0);
	tbTmzTong:apply(g_szThisFile,"tmz_tong_callback_sv_1");
end

function tmz_tong_callback_sv_1(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end	
	local tbTmzTong = SDB(szkey,0,0);
	local strTongName = GetTongName();
	local tbTongData = tbTmzTong[strTongName];
	local nTongScore = tbTongData[1] or 100;
	local nBattleLv = tbTongData[2] or 1;
	local strtab = {
		"S� d鬾g "..tUpLvXoYoYu[1].." Ng鋍 ti猽 dao gi髉 c蕄  bang h閕 n﹏g th祅h c蕄 2/#tmz_Special_Service_1(1,"..nBattleLv..","..nTongScore..")",
		"S� d鬾g "..tUpLvXoYoYu[2].." Ng鋍 ti猽 dao gi髉 c蕄  bang h閕 n﹏g th祅h c蕄 3/#tmz_Special_Service_1(2,"..nBattleLv..","..nTongScore..")",
		"tr� l筰/tmz_about_tong",
		"K誸 th骳 i tho筰/gf_DoNothing"
	};
	Say(g_NpcName.."C蕄  chi課 u c馻 qu� bang ph竔 l�: <color=yellow>"..nBattleLv.."<color>",
		getn(strtab),
		strtab)	
end

function tmz_Special_Service_1(nType,nBattleLv,nTongScore)
	local nTongMember = IsTongMember();
	if nTongMember ~= 1 and nTongMember ~= 2 and nTongMember ~= 3 then
		Talk(1,"",g_NpcName.."Bang ch� bang h閕, ph� bang ch� ho芻 trng l穙 c� th� ti課 h祅h thao t竎 n祔.");
		return 0;
	end
	if nBattleLv > nType then
		Talk(1,"",g_NpcName.."C蕄  c馻 qu� bang ph竔  t n <color=yellow>"..nBattleLv.."<color>");
		return 0;
	end
	local nTongType = 0;
	for i = 1,getn(tTongScoreLv) do 
		if nTongScore < tTongScoreLv[i][1] then
			nTongType = i;
			break;
		end
	end
	if nTongType > nType then
		Talk(1,"",g_NpcName.."觤 t輈h l騳 qu� bang ph竔  t n <color=yellow>"..nTongScore.."<color>,  c蕄   t n <color=yellow>"..nTongType.."<color>");
		return 0;		
	end
	local nXoYoYu = GetXYY();
	if nXoYoYu < tUpLvXoYoYu[nType] then
		Talk(1,"",g_NpcName.."N﹏g c蕄 c莕"..tUpLvXoYoYu[nType].."Ng鋍 Ti猽 Dao, c竎 h� mang theo kh玭g .");
		return 0;
	end
	Say(g_NpcName.."X竎 nh d飊g<color>"..tUpLvXoYoYu[nType].."Ng鋍 Ti猽 Dao gi髉 bang h閕 n﹏g c蕄 th祅h "..(nType+1).."Kh玭g?",
		2,
		"\nX竎 nh薾/#tmz_Special_Service_2("..nType..")",
		"\n Ph秐 h錳/tmz_Special_Service")
end

function tmz_Special_Service_2(nType)
	SetTaskTemp(212,nType);
	local tbTmzTong = SDB(TMZ_TONG_RELAY_KEY_3,0,0);
	tbTmzTong:apply(g_szThisFile,"tmz_tong_callback_sv_2");	
end

function tmz_tong_callback_sv_2(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end	
	local tbTmzTong = SDB(szkey,0,0);
	local strTongName = GetTongName();
	local tbTongData = tbTmzTong[strTongName];
	local nTongScore = tbTongData[1] or 100;
	local nOldScore = nTongScore;
	local nBattleLv = tbTongData[2] or 1;
	local nWeekWin = tbTongData[3] or 0;
	local nWeekLose = tbTongData[4] or 0;
	local nTotalWin = tbTongData[5] or 0;
	local nTotalLose = tbTongData[6] or 0;
	local nLastWin = tbTongData[7] or 0;
	local nHufu = tbTongData[8] or MAX_HUFU;	
	local nType = GetTaskTemp(212);
	if nType == 0 then
		return 0;
	end
	nTongScore = tTongScoreLv[nType][1];
	nBattleLv = tTongScoreLv[nType][2]+1;
	if PayXYY(tUpLvXoYoYu[nType]) == 1 then		
		tbTmzTong[strTongName] = {"dddddddd",nTongScore,nBattleLv,nWeekWin,nWeekLose,nTotalWin,nTotalLose,nLastWin,nHufu};
		Talk(1,"","C蕄  bang h閕 Thi猲 M玭 Tr薾 c馻 c竎 h� l�"..nBattleLv.."C蕄!")
		WriteLogEx(THIENMON_LOG_TITLE, format("[N﹏g c蕄 bang h閕 Thi猲 M玭 Tr薾][Bang h閕: %s n﹏g c蕄 th祅h %d. 觤 t輈h l騳 trc khi n﹏g c蕄: %d, 甶觤 t輈h l騳 sau khi n﹏g c蕄: %d.]",strTongName,nBattleLv,nOldScore,nTongScore))
		WriteLog(format("[N﹏g c蕄 bang h閕 Thi猲 M玭 Tr薾][Bang h閕: %s n﹏g c蕄 th祅h %d. 觤 t輈h l騳 trc khi n﹏g c蕄: %d, 甶觤 t輈h l騳 sau khi n﹏g c蕄: %d.]",strTongName,nBattleLv,nOldScore,nTongScore));
	end
end

function tmz_tong_award()
	local nTongMember = IsTongMember();
	if nTongMember == 0 then --没入帮
		Talk(1,"",g_NpcName.."C竎 h� c莕 gia nh藀 bang h閕 m韎 c� th� nh薾 thng.");
		return 0;
	end	
	local nWeekWin,nWeekLose = GetTask(TASk_TMZ_TONG_WEEK_WIN),GetTask(TASk_TMZ_TONG_WEEK_LOSE);	
	local strtab = {
		"Nh薾 ph莕 thng tr薾 tham gia tu莕 trc/tmz_tong_award_1",
		"Nh薾 ph莕 thng bang h閕 tham gian tu莕 trc/tmz_tong_award_2",
		"K誸 th骳 i tho筰/gf_DoNothing",
	};
	Say(g_NpcName.."D鵤 tr猲 bi觰 hi謓 tu莕 trc c馻 c竎 h�, c� th� nh薾 頲 <color=yellow>"..nWeekWin.."<color>tr薾 th緉g tr薾 h遖 <color=yellow>"..nWeekLose.."<color>ph莕 thng tr薾 thua.",
		getn(strtab),
		strtab)
end

function tmz_tong_award_1()
	local nWeekWin,nWeekLose = GetTask(TASk_TMZ_TONG_WEEK_WIN),GetTask(TASk_TMZ_TONG_WEEK_LOSE);
	if nWeekWin+nWeekLose <= 0 then
		Talk(1,"",g_NpcName.."C竎 h� kh玭g tham gia Bang H閕 Thi猲 M玭 Tr薾 tu莕 trc ho芻  nh薾 ph莕 thng.");
		return 0
	end	
	local nLv = GetLevel();
	local nExp1 = tmz_get_GlbExp(0,0,floor((280+(nLv-80)*24)*10000/3*1.35),floor((400+(nLv-85)*28)*10000/3*1.35),floor(5120000/3*1.35));
	local nExp2 = tmz_get_GlbExp(0,0,floor((280+(nLv-80)*24)*10000/3),floor((400+(nLv-85)*28)*10000/3),floor(5120000/3));
	Say(g_NpcName.."D鵤 tr猲 k誸 qu� bi觰 hi謓 trong tr薾 Thi猲 M玭 Tr薾 tu莕 trc, c竎 h� c� th� nh薾 頲 <color=yellow>"..floor(nExp1*nWeekWin+nExp2*nWeekLose).."<color> 甶觤 kinh nghi謒 v� <color=yellow>"..(nWeekWin*3+nWeekLose*1).."<color> Di詎 V� Bao, c� nh薾 ngay kh玭g?",
		4,
		"Ta mu鑞 nh薾 (g蕄 2 l莕 kinh nghi謒 s絥 c�)/#tmz_tong_award_1_1(0)",
		"уng �"..(nWeekWin+nWeekLose).."C竔 ["..tAwardItem[1][1].."] nh薾 (kinh nghi謒 b籲g "..tAwardItem[1][5].."L莕)/#tmz_tong_award_1_1(1)",
		"уng �"..(nWeekWin+nWeekLose).."C竔 ["..tAwardItem[2][1].."] nh薾 (kinh nghi謒 b籲g "..tAwardItem[2][5].."L莕)/#tmz_tong_award_1_1(2)",
		"T筸 th阨 kh玭g nh薾/gf_DoNothing")	
end

function tmz_tong_award_1_1(nType)
	local strMsg = "Kh玭g s� d鬾g b蕋 c� h� ph�";
	local nWeekWin,nWeekLose = GetTask(TASk_TMZ_TONG_WEEK_WIN),GetTask(TASk_TMZ_TONG_WEEK_LOSE);
	if nType ~= 0 then
		strMsg = "s� d鬾g <color=yellow>"..(nWeekWin+nWeekLose).."c竔"..tAwardItem[nType][1].."<color>";
	end
	Say(g_NpcName.."X竎 nh"..strMsg.."Nh薾 thng kh玭g?",
		3,
		"\n ng, ta mu鑞 nh薾 thng/#tmz_tong_award_1_2("..nType..")",
		"\n ta ch鋘 sai r錳/tmz_tong_award_1",
		"\n t筸 th阨 ch璦 mu鑞/gf_DoNothing");
end

function tmz_tong_award_1_2(nType)
	local nWeekWin,nWeekLose = GetTask(TASk_TMZ_TONG_WEEK_WIN),GetTask(TASk_TMZ_TONG_WEEK_LOSE);
	if nWeekWin+nWeekLose <= 0 then
		Talk(1,"",g_NpcName.."C竎 h� kh玭g tham gia Bang H閕 Thi猲 M玭 Tr薾 tu莕 trc ho芻  nh薾 ph莕 thng.");
		return 0
	end	
	local nLv = GetLevel();
	local nExp1 = tmz_get_GlbExp(0,0,floor((280+(nLv-80)*24)*10000/3*1.35),floor((400+(nLv-85)*28)*10000/3*1.35),floor(5120000/3*1.35));
	local nExp2 = tmz_get_GlbExp(0,0,floor((280+(nLv-80)*24)*10000/3),floor((400+(nLv-85)*28)*10000/3),floor(5120000/3));
	local nTotalExp = floor(nExp1*nWeekWin+nExp2*nWeekLose);
	local nBagCount = (nWeekWin*3+nWeekLose*1);
	local nBagCount2 = nWeekWin+nWeekLose;
	local nItemArg = 2;
	if nType ~= 0 then
		nItemArg = tAwardItem[nType][5];
		if GetItemCount(tAwardItem[nType][2],tAwardItem[nType][3],tAwardItem[nType][4]) < nBagCount2 then
			Talk(1,"",g_NpcName.."Mang theo tr猲 ngi"..tAwardItem[nType][1].."Kh玭g "..nBagCount2..".");
			return 0;
		end
	end
	if gf_Judge_Room_Weight(5,10,g_NpcName) ~= 1 then
		return 0;
	end
	local nLastExp = nTotalExp*nItemArg;
	if nType ~= 0 then
		if DelItem(tAwardItem[nType][2],tAwardItem[nType][3],tAwardItem[nType][4],nBagCount2) ~= 1 then
			return 0;
		end
	end
	SetTask(TASk_TMZ_TONG_WEEK_WIN,0);
	SetTask(TASk_TMZ_TONG_WEEK_LOSE,0);
	ModifyExp(nLastExp);
	Msg2Player("B筺 nh薾 頲 "..nLastExp.." 甶觤 kinh nghi謒");
	gf_SetLogCaption("Bang h閕 Thi猲 M玭 Tr薾");
	for i=1,nBagCount do
		local nRand = random(1,100);
		if nRand <= 2 then
			gf_AddItemEx({2,95,692,1},"Di詎 V� Nguy猲 So竔 Bao");
		elseif nRand <= 4 then
			gf_AddItemEx({2,95,693,1},"Di詎 V� Tng Qu﹏ Bao");
		elseif nRand <= 14 then
			gf_AddItemEx({2,95,694,1},"Di詎 V� Ti猲 Phong Bao");
		else
			gf_AddItemEx({2,95,695,1},"Di詎 V� S� Binh Bao");
		end
	end
	local nDate = tonumber(date("%Y%m%d"));
	if nDate >= 20100722 and nDate <= 20100815 then
		gf_AddItemEx({2,95,697,nBagCount2},"Thi猲 M玭 L筩 Bao")
	end
	gf_SetLogCaption("");
end

tTongAward = {
	{400,12,30,3000},
	{300,12,30,3000},
	{260,12,30,3000},
	{220,12,30,3000},
	{200,11,30,2000},
	{180,10,30,2000},
	{160,9,30,2000},
	{140,8,30,1500},
	{120,7,30,1500},
	{100,6,30,1500},
};

function tmz_tong_award_2()
	local nTongMember = IsTongMember();
	if nTongMember == 0 then --没入帮
		Talk(1,"",g_NpcName.."C竎 h� c莕 gia nh藀 bang h閕 m韎 c� th� nh薾 thng.");
		return 0;
	end	
	local nWeek = tf_GetWeekSequence(1,0); --周一凌晨
	if GetTask(TASK_TMZ_TONG_AWARD_WEEK) == 0 or GetTask(TASK_TMZ_TONG_AWARD_WEEK) >= nWeek then
		Talk(1,"",g_NpcName.."H穣 quay l筰 nh薾 thng v祇 tu莕 sau.");
		return 0;
	end	
	local nWeekTotal = GetTask(TASk_TMZ_TONG_TOTAL_NUM);
	if nWeekTotal <= 0 then
		Talk(1,"",g_NpcName.."C竎 h� kh玭g tham gia Bang H閕 Thi猲 M玭 Tr薾 tu莕 trc ho芻  nh薾 ph莕 thng.");
		return 0
	end	
	if nWeekTotal < 3 then
		SetTask(TASk_TMZ_TONG_TOTAL_NUM,0);
		Talk(1,"",g_NpcName.."D鵤 tr猲 bi觰 hi謓 c馻 tu莕 trc, kh玭g th� nh薾 ph莕 thng c馻 bang h閕 (tham gia 輙 nh蕋 3 tr薾 i chi課).");
		return 0;
	end
	local tbTmzTong = SDB(TMZ_TONG_RELAY_KEY_3,0,0);
	tbTmzTong:apply(g_szThisFile,"tmz_tong_award_callback_1");		
end

function tmz_tong_award_callback_1(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local tbTmzTong = SDB(szkey,0,0);	
	local strTongName = GetTongName();
	local tbTongData = tbTmzTong[strTongName];
	local nTongScore = tbTongData[1] or 0;
	local nTongType = 0; 
	for i = 1,getn(tTongAward) do
		if nTongScore >= tTongAward[i][1] then
			nTongType = i;
			break;
		end
	end
	if nTongType == 0 then
		SetTask(TASk_TMZ_TONG_TOTAL_NUM,0);
		Talk(1,"",g_NpcName.."觤 t輈h l騳 c馻 qu� bang h閕 ch璦 t y猽 c莡 (100 甶觤)");
		return 0;
	end
	if gf_Judge_Room_Weight(2,10,g_NpcName) ~= 1 then
		return 0;
	end
	local nExp = floor(tTongAward[nTongType][2]*GetLevel()*GetLevel()*240);
	SetTask(TASk_TMZ_TONG_TOTAL_NUM,0);
	gf_Modify("Exp",nExp);
	local nTmzMark = tTongAward[nTongType][3];
	SetTask(TASKID_TMZ_AWARD_MARK,GetTask(TASKID_TMZ_AWARD_MARK)+nTmzMark);
	Msg2Player("B筺 nh薾 頲 "..nTmzMark.."觤 t輈h l騳 Thi猲 M玭 Tr薾");
	WriteLogEx(THIENMON_LOG_TITLE, "nh薾 "..nTmzMark.." 甶觤 t輈h l騳 Thi猲 M玭 Tr薾")
	WriteLog("[Chi課 trng Thi猲 M玭 Tr薾]: t礽 kho秐: "..tostring(GetAccount())..", t猲: "..tostring(GetName())..", th阨 gian: "..tonumber(date("%Y%m%d"))..", [ nh薾 "..nTmzMark.."觤 t輈h l騳 Thi猲 M玭 Tr薾]");
	if GetTask(TASKID_TMZ_AWARD_MARK) > MAX_MARK then
		SetTask(TASKID_TMZ_AWARD_MARK,MAX_MARK);
		Msg2Player("Gi韎 h筺 甶觤 t輈h l騳 Thi猲 M玭 Tr薾 l�: "..MAX_MARK..", 甶觤 t輈h l騳 c馻 c竎 h�  t gi韎 h筺.");
	end	
	local nXoyoB = tTongAward[nTongType][4];
	if nXoyoB ~= 0 then
		EarnXYB(nXoyoB);
	end
	local tStone = {
		{
			{"Kim Tinh",2,201,2},
			{"M閏 Tinh",2,201,4},
			{"Th駓 Tinh",2,201,6},
			{"H醓 Tinh",2,201,8},
			{"Th� Tinh",2,201,10}
		},
		{
			{"Huy襫 Th筩h Kim Tinh",2,201,3,170,0},
			{"Ph� Th髖 M閏 Tinh",2,201,5,170,0},
			{"Nguy謙 Hoa Th駓 Tinh",2,201,7,170,0},
			{"C鰑 Huy襫 H醓 Tinh",2,201,9,170,0},
			{"Ng璶g Ng鋍 Th� Tinh",2,201,11,170,0},
		}};
--	if nTongType == 3 then
--		local nRand = random(1,5);
--		gf_AddItemEx({tStone[1][nRand][2],tStone[1][nRand][3],tStone[1][nRand][4],1},tStone[1][nRand][1]);
--	elseif nTongType == 4 then
--		local nRand = random(1,5);
--		gf_AddItemEx({tStone[1][nRand][2],tStone[1][nRand][3],tStone[1][nRand][4],1},tStone[1][nRand][1]);	
--		gf_AddItemEx({2,201,12,2,4},"镏金");
--	elseif nTongType == 5 then
--		local nRand = random(1,5);
--		gf_AddItemEx({tStone[2][nRand][2],tStone[2][nRand][3],tStone[2][nRand][4],1},tStone[2][nRand][1]);		
--	end
	--给称号
	if nTongScore >= 400 then
		if IsTongMember() == 1 then
			RemoveTitle(2,12);
			RemoveTitle(2,13);
			AddTitle(2,13);
			SetTitleTime(2, 13, GetTime() + 7*24*3600);
			SetCurTitle(2, 13);
			Msg2Player("Nh薾 頲 danh hi謚 [Thi猲 M玭 Anh Ki謙]!");
		else
			RemoveTitle(2,12);
			RemoveTitle(2,13);
			AddTitle(2,12);
			SetTitleTime(2, 12, GetTime() + 7*24*3600);
			SetCurTitle(2, 12);	
			Msg2Player("Nh薾 頲 danh hi謚 [Thi猲 M玭 Qu莕 H飊g]!");		
		end
	end
	if nTongScore >= 300 then
		DelRelayShareDataCopy(TMZ_TONG_RELAY_KEY_2,0,0);
		local tbTmzRank = SDB(TMZ_TONG_RELAY_KEY_2,0,0,2);
		tbTmzRank:apply(g_szThisFile,"tmz_tong_award_callback_2");	
	end
end

function tmz_tong_award_callback_2(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end
	local tbTmzRank = SDB(TMZ_TONG_RELAY_KEY_2,0,0,2);
	local strTongName,nTongScore = tbTmzRank[0][1],tbTmzRank[0][2];
	local strGruop = "";
	strGruop,strTongName = GLB_TMZ_GetRealmName(strTongName);
	local nCurTongName = GetTongName();
	if nCurTongName == strTongName then
		if IsTongMember() == 1 then
			RemoveTitle(2,14);
			RemoveTitle(2,15);
			AddTitle(2,15);
			SetTitleTime(2, 15, GetTime() + 7*24*3600);
			SetCurTitle(2, 15);
			Msg2Player("Nh薾 頲 danh hi謚 [Thi猲 M玭 H祇 Ki謙]");
		else
			RemoveTitle(2,14);
			RemoveTitle(2,15);
			AddTitle(2,14);
			SetTitleTime(2, 14, GetTime() + 7*24*3600);
			SetCurTitle(2, 14);	
			Msg2Player("Nh薾 頲 danh hi謚 [Thi猲 M玭 Qu莕 Anh]!");		
		end		
	end
end

--找是否有对手空位
function GLB_TMZ_GetOtherMap()
	DelRelayShareDataCopy(TMZ_TONG_RELAY_KEY_3,0,0);
	local tbTmzTong = SDB(TMZ_TONG_RELAY_KEY_3,0,0,3);
	tbTmzTong:apply(g_szThisFile,"tmz_tong_callback_1");
end

function tmz_tong_callback_1(szkey, nkey1, nkey2, nCount,_szkey, _nkey1, _nkey2)
	if szkey == "" then
		szkey, nkey1, nkey2 = _szkey, _nkey1, _nkey2;
	end	
	local tbTmzTong = SDB(szkey,0,0,3);
	local nType = GetTaskTemp(211);
	local strTongName = GetTongName();
	local strCurName = GLB_TMZ_GetTongName();
	local tbTongData = tbTmzTong[strTongName];
	local nTongScore = tbTongData[1] or 100;
	local nBattleLv = tbTongData[2] or 0;
	local nWeekWin = tbTongData[3] or 0;
	local nWeekLose = tbTongData[4] or 0;
	local nTotalWin = tbTongData[5] or 0;
	local nTotalLose = tbTongData[6] or 0;
	local nLastWin = tbTongData[7] or 0;
	local nHufu = tbTongData[8] or MAX_HUFU;	
	local nMaxNum = 0;
	local nSuitMapId = 0;
	if nType == 1 and nHufu < 1 then
		Talk(1,"",g_RealmNpcName.."Qu� bang h閕 kh玭g c遪 [Thi猲 M玭 H� Ph� 蕁] n鱝, h穣 s� d鬾g [Ng鋍 Ti猽 Dao] b竜 danh.");
		return 0;
	elseif nType == 2 and GetXYY() < 20 then
		Talk(1,"",g_RealmNpcName.."Чi hi謕 ch璦 c� 20 [Ng鋍 Ti猽 Dao].");
		return 0;
	end
	for i = 1,getn(tTongScoreLv) do 
		if nTongScore < tTongScoreLv[i][1] then
			nBattleLv = tTongScoreLv[i][2];
			nMaxNum = tTongScoreLv[i][3];
			break;
		end
	end
	local tbMapID = gf_GetDataTable(GetSameMaps(MAP_ID));
	if getn(tbMapID) > 1 then	
		for i=1,getn(tbMapID) do
			if mf_GetPlayerCount(MISSION_ID,CampTwo_ID,tbMapID[i]) == 0 and mf_GetMissionV(MISSION_ID,MV_TMZ_STATE,tbMapID[i]) == MS_STATE_PEACE then
				if mf_GetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_MAX,tbMapID[i]) == nMaxNum then
					nSuitMapId = tbMapID[i];
					break;
				end
			end
		end	
	end
	if nSuitMapId == 0 then --没有新开一个
		local nRoomID,nRoomIdx,nRoomCount = TMZ_FindIdleRoom();
		if nRoomID == 0 then
			Talk(1,"",g_RealmNpcName.."T蕋 c� b秐  u  y, h穣 quay l筰 sau.");
			return 0;
		end;
		if mf_OpenMission(MISSION_ID,nRoomID) == 1 then
			local ShowTable = {
				name = TMZ_ShowData.name,
				title = TMZ_ShowData.title,
				szFormat = TMZ_ShowData.szFormat,
				data = {},			
				szMsg = format("T� l� chi誱 tr薾: <color=yellow>%s[%d]<color>: <color=pink>[%d]%s<color>",tCampName[1],0,0,tCampName[2]),
			};
			initTopScore(ShowTable);
			TMZ_ShowData.CurN = TMZ_ShowData.CurN + 1;
			TMZ_ShowData[TMZ_ShowData.CurN] = ShowTable;
			TMZ_SaveData();
			mf_SetMissionV(MISSION_ID,MV_TMZ_SHOWDATA_IDX,TMZ_ShowData.CurN,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_LOAD,1,nRoomID);	
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_ID,nRoomID,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_MAP_INDEX,nRoomIdx,nRoomID);
			if nType == 1 and nHufu >= 1 then
				nHufu = nHufu-1;
				tbTmzTong[strTongName] = {"dddddddd",nTongScore,nBattleLv,nWeekWin,nWeekLose,nTotalWin,nTotalLose,nLastWin,nHufu};
			elseif nType == 2 and GetXYY() >= 20 then
				PayXYY(20);
				GLB_TMZ_SetTask(0,3);--同步逍遥玉
			else
				return 0;
			end
			tmz_tong_AddCamp(nRoomID,CampOne_ID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_SCORE,nTongScore,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_MAX,nMaxNum,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_LV,nBattleLv,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_WEEK_WIN,nWeekWin,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_WEEK_LOSE,nWeekLose,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_TOTAL_WIN,nTotalWin,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_TOTAL_LOSE,nTotalLose,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_LAST_WIN,nLastWin,nRoomID);
			mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPONE_HUFU,nHufu,nRoomID);
			mf_SetMissionS(MISSION_ID,MV_TMZ_TONG_CAMPONE_NAME,strCurName,nRoomID);								
		end			
	else --加入阵营2
		if nType == 1 and nHufu >= 1 then
			nHufu = nHufu-1;
			tbTmzTong[strTongName] = {"dddddddd",nTongScore,nBattleLv,nWeekWin,nWeekLose,nTotalWin,nTotalLose,nLastWin,nHufu};
		elseif nType == 2 and GetXYY() >= 20 then
			PayXYY(20);
			GLB_TMZ_SetTask(0,3);--同步逍遥玉
		else
			return 0;
		end	
		tmz_tong_AddCamp(nSuitMapId,CampTwo_ID);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_SCORE,nTongScore,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_MAX,nMaxNum,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_LV,nBattleLv,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_WEEK_WIN,nWeekWin,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_WEEK_LOSE,nWeekLose,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_TOTAL_WIN,nTotalWin,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_TOTAL_LOSE,nTotalLose,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_LAST_WIN,nLastWin,nSuitMapId);
		mf_SetMissionV(MISSION_ID,MV_TMZ_TONG_CAMPTWO_HUFU,nHufu,nSuitMapId);		
		mf_SetMissionS(MISSION_ID,MV_TMZ_TONG_CAMPTWO_NAME,strCurName,nSuitMapId);
	end	
end


function tmz_get_GlbExp(...)
	if arg.n ~= 5 then
		return 0;
	end
	local nExp = 0;
	local nLv = GetLevel();
	local tExpType = {{75,80,85,90,100},{arg[1],arg[2],arg[3],arg[4],arg[5]}};
	for i = 1,getn(tExpType[1]) do
		if nLv < tExpType[1][i] then
			nExp = tExpType[2][i];
			break;
		end
	end
	return nExp;	
end
