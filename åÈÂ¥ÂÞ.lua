-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 大理任务NPC迦楼罗召唤和死亡Script
-- By StarryNight
-- 2006/01/10 PM 14:23

-- 不死鸟死不了，其实内心可能也非常痛苦……

-- ======================================================
-- 引用剧情任务文件
Include("\\script\\task\\world\\大理\\task_head.lua");
Include("\\script\\task\\world\\task_head.lua");

function OnUse()

local nMapID,nWx,nWy = GetWorldPos();
	
	--需要在凤眼洞一层或二层使用		
	if nMapID == 414 or nMapID == 415 then
		local nTime = GetTask(TASK_DL_LV55_TIME);
		nTime = 30*60 - (GetTime() - nTime);--生存时间为20分钟减去跑路所用时间
		
		if nTime <= 0 then
			Say("Ph鬾g Ho祅g linh  m蕋 hi謚 l鵦, quay l筰 M筩 Tam nh薾 c竔 m韎.",0);
			DelItem(2,0,373,1);
			if GetTrigger(TALK_DL_MOSAN) == 0 then
				CreateTrigger(4,201,TALK_DL_MOSAN);
			end;
			RemoveTrigger(GetTrigger(TIME_DL_PHENIX));--删掉计时器
			return
		end
		
		if GetTask(TASK_DL_LV55_ID) == 3 then
			local nJLLIndex = CreateNpc("Ph鬾g Ho祅g","Ph鬾g Ho祅g",nMapID,nWx,nWy,-1,1,1,50);
			SetNpcLifeTime(nJLLIndex,nTime); 
			SetNpcScript(nJLLIndex,"\\script\\task\\world\\大理\\Lv20\\迦楼罗.lua");
			ChangeNpcToFight(nJLLIndex);
			TaskTip("B筺  g鋓 頲 Ph鬾g Ho祅g! H穣 mau ti猽 di謙!");
			Msg2Player("B筺  g鋓 頲 Ph鬾g Ho祅g! H穣 mau ti猽 di謙!");
			DelItem(2,0,373,1);
			return
		else
			return
		end
	else
		local strTalk = {
			"N琲 y kh玭g th� s� d鬾g Ph鬾g Ho祅g linh."
		};
		TalkEx("",strTalk);
	end;
end;

function OnDeath(index)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();
local nMapId, nX, nY = GetWorldPos();

	SetNpcLifeTime(index,15);--使得尸体消失

	if GetTask(TASK_DL_LV55_ID) == 3 then
		SetTask(TASK_DL_LV55_ID,4);
		RemoveTrigger(GetTrigger(TIME_DL_PHENIX));--删去计时器
		RemoveTrigger(GetTrigger(TALK_DL_MOSAN));--删去莫三对话触发器
		TaskTip("Di謙 頲 Ph鬾g Ho祅g, quay v� g苝 Cao Th╪g Tuy襫.");
		Msg2Player("Di謙 頲 Ph鬾g Ho祅g, quay v� g苝 Cao Th╪g Tuy襫.");
	end;
	
	if nMemCount == 0 then -- 玩家未组队
		if GetTask(TASK_DL_LV55_ID) == 3 then
			SetTask(TASK_DL_LV55_ID,4);
			RemoveTrigger(GetTrigger(TIME_DL_PHENIX));--删去计时器
			RemoveTrigger(GetTrigger(TALK_DL_MOSAN));--删去莫三对话触发器
			TaskTip("Di謙 頲 Ph鬾g Ho祅g, quay v� g苝 Cao Th╪g Tuy襫.");
			Msg2Player("Di謙 頲 Ph鬾g Ho祅g, quay v� g苝 Cao Th╪g Tuy襫.");
		end;
	else	
		for i=1,nMemCount do
      PlayerIndex = GetTeamMember(i);
      local nTeamMapId, nTeamX, nTeamY = GetWorldPos();
      local nDist = DistanceBetweenPoints(nMapId, nX, nY, nTeamMapId, nTeamX, nTeamY);
			if GetTask(TASK_DL_LV55_ID) == 3 then
				SetTask(TASK_DL_LV55_ID,4);
				RemoveTrigger(GetTrigger(TIME_DL_PHENIX));--删去计时器
				RemoveTrigger(GetTrigger(TALK_DL_MOSAN));--删去莫三对话触发器
				TaskTip("Di謙 頲 Ph鬾g Ho祅g, quay v� g苝 Cao Th╪g Tuy襫.");
				Msg2Player("Di謙 頲 Ph鬾g Ho祅g, quay v� g苝 Cao Th╪g Tuy襫.");
			end;
		end;
	PlayerIndex = nPreservedPlayerIndex; -- 重置之前储存的玩家编号
  end;
end;