
Include("\\script\\missions\\tianmenzhen\\tmz_functions.lua");

tXueHen = {--差距数 攻击提高数值 生命上限提高数值 免疫负面次数
	{21,150,300,14,"Tuy誸 H薾 c蕄 10","C玭g k輈h t╪g 150%, gi韎 h筺 sinh m謓h t╪g 300%, mi詎 d辌h tr筺g th竔 b� h筰 14 l莕. "},
	{19,150,300,14,"Tuy誸 H薾 c蕄 10","C玭g k輈h t╪g 150%, gi韎 h筺 sinh m謓h t╪g 300%, mi詎 d辌h tr筺g th竔 b� h筰 14 l莕. "},
	{17,135,270,14,"Tuy誸 H薾 c蕄 9","C玭g k輈h t╪g 135%, gi韎 h筺 sinh m謓h t╪g 270%, mi詎 d辌h tr筺g th竔 b� h筰 14 l莕. "},
	{15,120,240,13,"Tuy誸 H薾 c蕄 8","C玭g k輈h t╪g 120%, gi韎 h筺 sinh m謓h t╪g 240%, mi詎 d辌h tr筺g th竔 b� h筰 13 l莕. "},
	{13,105,210,13,"Tuy誸 H薾 c蕄 7","C玭g k輈h t╪g 105%, gi韎 h筺 sinh m謓h t╪g 210%, mi詎 d辌h tr筺g th竔 b� h筰 13 l莕. "},
	{11,90 ,180,12,"Tuy誸 H薾 c蕄 6","C玭g k輈h t╪g 90%, gi韎 h筺 sinh m謓h t╪g 180%, mi詎 d辌h tr筺g th竔 b� h筰 12 l莕. "},
	{9 ,75 ,150,12,"Tuy誸 H薾 c蕄 5","C玭g k輈h t╪g 75%, gi韎 h筺 sinh m謓h t╪g 150%, mi詎 d辌h tr筺g th竔 b� h筰 12 l莕. "},
	{7 ,60 ,120,10,"Tuy誸 H薾 c蕄 4","C玭g k輈h t╪g 60%, gi韎 h筺 sinh m謓h t╪g 120%, mi詎 d辌h tr筺g th竔 b� h筰 10 l莕. "},
	{5 ,45 ,90 , 5,"Tuy誸 H薾 c蕄 3","C玭g k輈h t╪g 45%, gi韎 h筺 sinh m謓h t╪g 90%, mi詎 d辌h tr筺g th竔 b� h筰 5 l莕. "},
	{3 ,30 ,60 , 3,"Tuy誸 H薾 c蕄 2","C玭g k輈h t╪g 30%, gi韎 h筺 sinh m謓h t╪g 60%, mi詎 d辌h tr筺g th竔 b� h筰 3 l莕. "},
	{1 ,15 ,30 , 1,"Tuy誸 H薾 c蕄 1","C玭g k輈h t╪g 15%, gi韎 h筺 sinh m謓h t╪g 30%, mi詎 d辌h tr筺g th竔 b� h筰 1 l莕. "},
};

function main()
	local nCamp = TMZ_GetCamp();
	if GetMissionV(MV_TMZ_STATE) == MS_STATE_PEACE then
		Talk(1,"","Qu﹏ s� 2 b猲 di詎 v� v蒼 ch璦 t n<color=yellow>"..PLAYER_NEED_NUM.."ngi <color>, vu l遪g i th猰 gi﹜ l竧. ");
		SetPos(tPositionCamp[nCamp][1][1],tPositionCamp[nCamp][1][2]);
	elseif GetMissionV(MV_TMZ_STATE) == MS_STATE_READY then
		Talk(1,"","Thi猲 M玭 Tr薾 di詎 v� trng l藀 t鴆 b総 u, c竎 v� i hi謕 h穣 chu萵 b�. ");
		SetPos(tPositionCamp[nCamp][1][1],tPositionCamp[nCamp][1][2]);		
	elseif GetMissionV(MV_TMZ_STATE) == MS_STATE_FIGHT then
		if GetTime() - GetTaskTemp(TASK_TEMP_DIE_TIME) < 10 then
			Talk(1,"","C竎 h� chu萵 b� ch璦  10 gi﹜, c莕 i th猰.");
			return 0;
		end
		local nKillNum = GetTask(TASKID_TMZ_KILL_PLAYER);
		local nKilledNum = GetTask(TASKID_TMZ_PLAYER_KILLED);
		local nKillDistance = nKilledNum-nKillNum;
		local nTbIdx = 0;
		if nKillDistance > 0 then
			for i = 1,getn(tXueHen) do
				if nKillDistance >= tXueHen[i][1] then
					nTbIdx = i;
					break;
				end
			end
		end
		local nRand = random(1,2);	
		SetPos(tPositionCamp[nCamp][2][nRand][1],tPositionCamp[nCamp][2][nRand][2]);
		ClearColdDown();	--清除药CD
		SetTaskTemp(PTT_DIE_LOOP,0);
		SetFightState(1);
		--先清雪恨状态再加
		RemoveState(9908);
		RemoveState(9909);
		RemoveState(9910);
		RemoveState(9911);
		CastState("state_dispear",0,INVINCIBILITY_TIME*18); --无敌
		if nTbIdx ~= 0 then
			CastState("state_p_attack_percent_add",tXueHen[nTbIdx][2],2*60*18,1,9908,1); --外攻攻击
			CastState("state_m_attack_percent_add",tXueHen[nTbIdx][2],2*60*18,1,9909,1);	--内攻攻击
			CastState("state_life_max_percent_add",tXueHen[nTbIdx][3],2*60*18,1,9910,1);		--生命上限
			CastState("state_buff_resist",tXueHen[nTbIdx][4],2*60*18,1,9911,1);					--免疫负面状态
			SyncCustomState(1,9908,1,tXueHen[nTbIdx][5]);
			Msg2Player("B筺 nh薾 頲 "..tXueHen[nTbIdx][5].."Hi謚 qu�: "..tXueHen[nTbIdx][6].."Duy tr� 2 ph髏.");
		end
		TMZ_RestoreAll();
	end;		
end