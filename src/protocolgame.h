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

#ifndef __PROTOCOLGAME__
#define __PROTOCOLGAME__

#include "otsystem.h"
#include "enums.h"

#include "protocol.h"
#include "creature.h"  

enum LaspPacket_t
{
	PACKET_DEFAULT,
	PACKET_SAY,
	PACKET_CHANNEL_INVITE,
	PACKET_AUTO_WALK,
	PACKET_SET_OUTFIT,
	PACKET_BATTLE_WINDOW,
	PACKET_SAY_TO_NPC,
	PACKET_REQUEST_OUTFIT,
	PACKET_LOOK,
	PACKET_ITEM,
	PACKET_CONTAINER,
	PACKET_PARTY,
	PACKET_WALK,

	PACKET_NULL,

	PACKET_FIRST = PACKET_DEFAULT,
	PACKET_LAST = PACKET_NULL
};

class NetworkMessage;
class Player;
class Game;
class House;
class Container;
class Tile;
class Connection;
class Quest;

typedef boost::shared_ptr<NetworkMessage> NetworkMessage_ptr;
class ProtocolGame : public Protocol
{
	public:
#ifdef __ENABLE_SERVER_DIAGNOSTIC__
		static uint32_t protocolGameCount;
#endif
		ProtocolGame(Connection_ptr connection): Protocol(connection)
		{
#ifdef __ENABLE_SERVER_DIAGNOSTIC__
			protocolGameCount++;
#endif
            // for(uint32_t i = PACKET_FIRST; i <= PACKET_LAST; ++i)
			// 	lastPacket[i] = 0;
			
			player = NULL;
			tvOwner = NULL;
			m_eventConnect = 0;
			m_debugAssertSent = m_acceptPackets = false;
		}

		virtual ~ProtocolGame()
		{
#ifdef __ENABLE_SERVER_DIAGNOSTIC__
			protocolGameCount--;
#endif
            // for(uint32_t i = PACKET_FIRST; i <= PACKET_LAST; ++i)
			// 	lastPacket[i] = 0;
			
			player = NULL;
			tvOwner = NULL;
		}

		enum {protocolId = 0x0A};
		enum {isSingleSocket = true};
		enum {hasChecksum = true};
		static const char* protocolName() {return "game protocol";}

		bool login(const std::string& name, uint32_t id, const std::string& password,
			OperatingSystem_t operatingSystem, uint16_t version, bool gamemaster);
		bool logout(bool displayEffect, bool forceLogout);

		void setPlayer(Player* p);
		
		Player* getPlayer() {return player;}  //CA 

	private:
		void disconnectClient(uint8_t error, const char* message);

		std::list<uint32_t> knownCreatureList;
		void checkCreatureAsKnown(const Creature* creature, bool& known, uint32_t& removedKnown);

		bool connect(uint32_t playerId, OperatingSystem_t operatingSystem, uint16_t version);
		void disconnect();

		virtual void releaseProtocol();
		virtual void deleteProtocolTask();

		bool canSee(uint16_t x, uint16_t y, uint16_t z) const;
		bool canSee(const Creature*) const;
		bool canSee(const Position& pos) const;

		uint32_t getCreatureID(Creature* creature); // PS
		uint32_t getCreatureID(const Creature* creature); // PS

		virtual void onConnect(); 
		virtual void onRecvFirstMessage(NetworkMessage& msg);

		bool parseFirstPacket(NetworkMessage& msg);
		virtual void parsePacket(NetworkMessage& msg);
		
		//New Opcode
		void parseNewOpcode(NetworkMessage& msg);  
		void sendBuyListMarket(uint8_t pagina, std::string search);
		void parseBuyListMarket(NetworkMessage& msg);
		void parseBuyItemMarket(NetworkMessage& msg);
		void parseRequestSellMarket(NetworkMessage& msg);
		void parseAcceptSellMarket(NetworkMessage& msg);
		void parseCloseMarket();
		void sendMarketItemRequest(uint16_t spriteId, uint16_t item_count, std::string item_name);
		void sendSellListMarket();
		void parseCancelSellMarket(NetworkMessage& msg);

		//Parse methods
		void parseLogout(NetworkMessage& msg);
		void parseCancelMove(NetworkMessage& msg);

		void parseReceivePing(NetworkMessage& msg);
		void parseAutoWalk(NetworkMessage& msg);
		void parseMove(NetworkMessage& msg, Direction dir);
		void parseTurn(NetworkMessage& msg, Direction dir);

		void parseRequestOutfit(NetworkMessage& msg);
		void parseSetOutfit(NetworkMessage& msg);
		void parseSetPokeOutfit(NetworkMessage& msg);
		void parseSay(NetworkMessage& msg);
		void parseLookAt(NetworkMessage& msg);
		void parseFightModes(NetworkMessage& msg);
		void parseAttack(NetworkMessage& msg);
		void parseFollow(NetworkMessage& msg);

		void parseBugReport(NetworkMessage& msg);
		void parseDebugAssert(NetworkMessage& msg);

		void parseThrow(NetworkMessage& msg);
		void parseUseItemEx(NetworkMessage& msg);
		void parseBattleWindow(NetworkMessage& msg);
		void parseUseItem(NetworkMessage& msg);
		void parseCloseContainer(NetworkMessage& msg);
		void parseUpArrowContainer(NetworkMessage& msg);
		void parseUpdateTile(NetworkMessage& msg);
		void parseUpdateContainer(NetworkMessage& msg);
		void parseTextWindow(NetworkMessage& msg);
		void parseHouseWindow(NetworkMessage& msg);

		void parseLookInShop(NetworkMessage& msg);
		void parsePlayerPurchase(NetworkMessage& msg);
		void parsePlayerSale(NetworkMessage& msg);
		void parseCloseShop(NetworkMessage& msg);

		void parseQuests(NetworkMessage& msg);
		void parseQuestInfo(NetworkMessage& msg);

		void parseInviteToParty(NetworkMessage& msg);
		void parseJoinParty(NetworkMessage& msg);
		void parseRevokePartyInvite(NetworkMessage& msg);
		void parsePassPartyLeadership(NetworkMessage& msg);
		void parseLeaveParty(NetworkMessage& msg);
		void parseSharePartyExperience(NetworkMessage& msg);
		
		//Duel System
		void parseInviteToDuel(NetworkMessage& msg);
		void parseJoinDuel(NetworkMessage& msg);
		void parseLeaveDuel(NetworkMessage& msg);
		
		void sendUpdateFly(const Position& pos);
		
		void SendChangeMapAwareRange(uint8_t xrange, uint8_t yrange); 
		void parseChangeMapAwareRange(NetworkMessage& msg);
		
		//Tv System  
		void sendWatchInTVCam(Player* player_Cam);//se adiciona na lista do Camera
		void sendUpdateTvWatch(const Position& pos, const Player* player_Cam);//vai para a visao do camera 
		void AddMapDescriptionTv(NetworkMessage_ptr msg, const Position& pos, const Player* watch);
		
		void AddCreatureTV(NetworkMessage_ptr msg, const Creature* creature, bool known, uint32_t remove, Player* playerCam);
		void GetTileDescriptionTV(const Tile* tile, NetworkMessage_ptr msg, Player* playerCam);
		void sendAddTileItemTV(const Tile* tile, const Position& pos, uint32_t stackpos, const Item* item, Player* playerCam);
		void sendUpdateTileItemTV(const Tile* tile, const Position& pos, uint32_t stackpos, const Item* item, Player* playerCam);
		void sendRemoveTileItemTV(const Tile* tile, const Position& pos, uint32_t stackpos, Player* playerCam);
		void sendUpdateTileTV(const Tile* tile, const Position& pos, Player* playerCam);
		
		void sendCreatureOutfitTV(const Creature* creature, const Outfit_t& outfit, Player* playerCam);
		void sendCreatureHealthTV(const Creature* creature, Player* playerCam);
		void sendMagicEffectTV(const Position& pos, uint16_t type, Player* playerCam);
		void sendDistanceShootTV(const Position& from, const Position& to, uint8_t type, Player* playerCam);
		void sendAddCreatureTV(const Creature* creature, const Position& pos, uint32_t stackpos, Player* playerCam);
		void sendCreatureTurnTV(const Creature* creature, int16_t stackpos, Player* playerCam);
        void sendRemoveCreatureTV(const Creature* creature, const Position& pos, uint32_t stackpos, Player* playerCam);
        void checkCreatureAsKnownTV(const Creature* creature, bool& known, uint32_t& removedKnown, Player* playerCam);
        void AddTileCreatureTV(NetworkMessage_ptr msg, const Position& pos, uint32_t stackpos, const Creature* creature, Player* playerCam);
        bool canSeeTV(uint16_t x, uint16_t y, uint16_t z, Player* playerCam) const;
		bool canSeeTV(const Creature*, Player* playerCam) const;
		bool canSeeTV(const Position& pos, Player* playerCam) const;
        void sendMoveCreatureTV(const Creature* creature, const Tile* newTile, const Position& newPos, uint32_t newStackPos,
			const Tile* oldTile, const Position& oldPos, uint32_t oldStackpos, bool teleport, bool playerTv, Player* playerCam);

		//trade methods
		void parseRequestTrade(NetworkMessage& msg);
		void parseLookInTrade(NetworkMessage& msg);
		void parseAcceptTrade(NetworkMessage& msg);
		void parseCloseTrade();

		//VIP methods
		void parseAddVip(NetworkMessage& msg);
		void parseRemoveVip(NetworkMessage& msg);

		void parseRotateItem(NetworkMessage& msg);

		//Channel tabs
		void parseCreatePrivateChannel(NetworkMessage& msg);
		void parseChannelInvite(NetworkMessage& msg);
		void parseChannelExclude(NetworkMessage& msg);
		void parseGetChannels(NetworkMessage& msg);
		void parseOpenChannel(NetworkMessage& msg);
		void parseOpenPriv(NetworkMessage& msg);
		void parseCloseChannel(NetworkMessage& msg);
		void parseCloseNpc(NetworkMessage& msg);
		void parseProcessRuleViolation(NetworkMessage& msg);
		void parseCloseRuleViolation(NetworkMessage& msg);
		void parseCancelRuleViolation(NetworkMessage& msg);

		//Send functions
		void sendChannelMessage(std::string author, std::string text, SpeakClasses type, uint8_t channel);
		void sendClosePrivate(uint16_t channelId);
		void sendCreatePrivateChannel(uint16_t channelId, const std::string& channelName);
		void sendChannelsDialog(bool tv);
		void sendCustomChannelList(std::list<std::string> list);
		void sendChannel(uint16_t channelId, const std::string& channelName);
		void sendRuleViolationsChannel(uint16_t channelId);
		void sendOpenPrivateChannel(const std::string& receiver);
		void sendToChannel(const Creature* creature, SpeakClasses type, const std::string& text, uint16_t channelId, uint32_t time = 0);
		void sendRemoveReport(const std::string& name);
		void sendLockRuleViolation();
		void sendRuleViolationCancel(const std::string& name);
		void sendIcons(int32_t icons);
		void sendFYIBox(const std::string& message);

		void sendDistanceShoot(const Position& from, const Position& to, uint8_t type);
		void sendMagicEffect(const Position& pos, uint16_t type);
		void sendAnimatedText(const Position& pos, uint8_t color, std::string text);
		void sendCreatureHealth(const Creature* creature);
		void sendSkills();
		void sendPing();
		void sendCreatureTurn(const Creature* creature, int16_t stackpos);
		void sendCreatureSay(const Creature* creature, SpeakClasses type, const std::string& text, Position* pos = NULL);

		void sendCancel(const std::string& message);
		void sendCancelWalk();
		void sendChangeSpeed(const Creature* creature, uint32_t speed);
		void sendCancelTarget();
		void sendCreatureOutfit(const Creature* creature, const Outfit_t& outfit);
		void sendCreaturePokeOutfit(const Creature* creature, const Outfit_t& outfit);
		void sendStats();
		void sendTextMessage(MessageClasses mclass, const std::string& message);
		void sendReLoginWindow();

		void sendTutorial(uint8_t tutorialId);
		void sendAddMarker(const Position& pos, MapMarks_t markType, const std::string& desc);

		void sendCreatureSkull(const Creature* creature);
		void sendCreatureShield(const Creature* creature);
		void sendCreatureDuelShield(const Creature* creature);

		void sendShop(const ShopInfoList& shop);
		void sendCloseShop();
		void sendGoods(const ShopInfoList& shop);
		void sendTradeItemRequest(const Player* player, const Item* item, bool ack);
		void sendCloseTrade();

		void sendTextWindow(uint32_t windowTextId, Item* item, uint16_t maxLen, bool canWrite);
		void sendTextWindow(uint32_t windowTextId, uint32_t itemId, const std::string& text);
		void sendHouseWindow(uint32_t windowTextId, House* house, uint32_t listId, const std::string& text);

		void sendOutfitWindow();
		void sendPokeOutfitWindow(Creature* creature);
		void sendQuests();
		void sendQuestInfo(Quest* quest);

		void sendVIPLogIn(uint32_t guid);
		void sendVIPLogOut(uint32_t guid);
		void sendVIP(uint32_t guid, const std::string& name, bool isOnline);

		void sendCreatureLight(const Creature* creature);
		void sendWorldLight(const LightInfo& lightInfo);

		void sendCreatureSquare(const Creature* creature, SquareColor_t color);

		//tiles
		void sendAddTileItem(const Tile* tile, const Position& pos, uint32_t stackpos, const Item* item);
		void sendUpdateTileItem(const Tile* tile, const Position& pos, uint32_t stackpos, const Item* item);
		void sendRemoveTileItem(const Tile* tile, const Position& pos, uint32_t stackpos);
		void sendUpdateTile(const Tile* tile, const Position& pos);
		void sendUpdateTileFly(const Position& pos);

		void sendAddCreature(const Creature* creature, const Position& pos, uint32_t stackpos);
		void sendRemoveCreature(const Creature* creature, const Position& pos, uint32_t stackpos);
		void sendMoveCreature(const Creature* creature, const Tile* newTile, const Position& newPos, uint32_t newStackPos,
			const Tile* oldTile, const Position& oldPos, uint32_t oldStackpos, bool teleport);

		//containers
		void sendAddContainerItem(uint8_t cid, const Item* item);
		void sendUpdateContainerItem(uint8_t cid, uint8_t slot, const Item* item);
		void sendRemoveContainerItem(uint8_t cid, uint8_t slot);

		void sendContainer(uint32_t cid, const Container* container, bool hasParent);
		void sendCloseContainer(uint32_t cid);

		//inventory
		void sendAddInventoryItem(slots_t slot, const Item* item);
		void sendUpdateInventoryItem(slots_t slot, const Item* item);
		void sendRemoveInventoryItem(slots_t slot);
		
		void sendPokemonStatusAdd(uint16_t itemId, uint8_t cooldown);
		void sendPokemonStatusRemove(uint16_t itemId);
		void sendPokemonStatusClear();
		
		void sendCreatureJump(const Creature* creature);
		void sendCreatureEffect(const Creature* creature, uint8_t effectId, uint32_t var);

		//Help functions

		// translate a tile to clientreadable format
		void GetTileDescription(const Tile* tile, NetworkMessage_ptr msg);
		void GetTileFlyDescription(const Tile* tile, NetworkMessage_ptr msg);

		// translate a floor to clientreadable format
		void GetFloorDescription(NetworkMessage_ptr msg, int32_t x, int32_t y, int32_t z,
			int32_t width, int32_t height, int32_t offset, int32_t& skip);

		// translate a map area to clientreadable format
		void GetMapDescription(int32_t x, int32_t y, int32_t z,
			int32_t width, int32_t height, NetworkMessage_ptr msg);

		void AddMapDescription(NetworkMessage_ptr msg, const Position& pos);
		void AddTextMessage(NetworkMessage_ptr msg, MessageClasses mclass, const std::string& message);
		void AddAnimatedText(NetworkMessage_ptr msg, const Position& pos, uint8_t color, const std::string& text);
		void AddMagicEffect(NetworkMessage_ptr msg, const Position& pos, uint16_t type);
		void AddDistanceShoot(NetworkMessage_ptr msg, const Position& from, const Position& to, uint8_t type);
		void AddCreature(NetworkMessage_ptr msg, const Creature* creature, bool known, uint32_t remove);
		void AddPlayerStats(NetworkMessage_ptr msg);
		void AddCreatureSpeak(NetworkMessage_ptr msg, const Creature* creature, SpeakClasses type,
			std::string text, uint16_t channelId, uint32_t time = 0, Position* pos = NULL);
		void AddCreatureHealth(NetworkMessage_ptr msg, const Creature* creature);
		void AddCreatureOutfit(NetworkMessage_ptr msg, const Creature* creature, const Outfit_t& outfit, bool outfitWindow = false);
		void AddCreaturePokeOutfit(NetworkMessage_ptr msg, const Creature* creature, const Outfit_t& outfit, bool outfitWindow = false);
        void AddPlayerSkills(NetworkMessage_ptr msg);
		void AddWorldLight(NetworkMessage_ptr msg, const LightInfo& lightInfo);
		void AddCreatureLight(NetworkMessage_ptr msg, const Creature* creature);
		
		void sendMovesPoke(uint8_t moves, uint16_t M1, uint16_t M2,
uint16_t M3, uint16_t M4, uint16_t M5, uint16_t M6, uint16_t M7, uint16_t M8,
uint16_t M9, uint16_t M10, uint16_t M11, uint16_t M12);

		//tiles
		void AddTileItem(NetworkMessage_ptr msg, const Position& pos, uint32_t stackpos, const Item* item);
		void AddTileCreature(NetworkMessage_ptr msg, const Position& pos, uint32_t stackpos, const Creature* creature);
		void UpdateTileItem(NetworkMessage_ptr msg, const Position& pos, uint32_t stackpos, const Item* item);
		void RemoveTileItem(NetworkMessage_ptr msg, const Position& pos, uint32_t stackpos);

		void MoveUpCreature(NetworkMessage_ptr msg, const Creature* creature,
			const Position& newPos, const Position& oldPos, uint32_t oldStackpos);
		void MoveDownCreature(NetworkMessage_ptr msg, const Creature* creature,
			const Position& newPos, const Position& oldPos, uint32_t oldStackpos);

		//container
		void AddContainerItem(NetworkMessage_ptr msg, uint8_t cid, const Item* item);
		void UpdateContainerItem(NetworkMessage_ptr msg, uint8_t cid, uint8_t slot, const Item* item);
		void RemoveContainerItem(NetworkMessage_ptr msg, uint8_t cid, uint8_t slot);

		//inventory
		void AddInventoryItem(NetworkMessage_ptr msg, slots_t slot, const Item* item);
		void UpdateInventoryItem(NetworkMessage_ptr msg, slots_t slot, const Item* item);
		void RemoveInventoryItem(NetworkMessage_ptr msg, slots_t slot);

		//rule violation window
		void parseViolationWindow(NetworkMessage& msg);

		//shop
		void AddShopItem(NetworkMessage_ptr msg, const ShopInfo item);
		void parseExtendedOpcode(NetworkMessage& msg);
        void sendExtendedOpcode(uint8_t opcode, const std::string& buffer);
		
		bool receivePacket(LaspPacket_t packet, uint32_t exhaust)
		{
			// uint64_t Time = OTSYS_TIME();
			// if(lastPacket[packet] + exhaust > Time)
				// return false;

			// lastPacket[packet] = Time;
			return true;
		}

		#define addGameTask(f, ...) addGameTaskInternal(0, boost::bind(f, &g_game, __VA_ARGS__))
		#define addGameTaskTimed(delay, f, ...) addGameTaskInternal(delay, boost::bind(f, &g_game, __VA_ARGS__))
		template<class FunctionType>
		void addGameTaskInternal(uint32_t delay, const FunctionType&);

		friend class Player;
		Player* player;
		Player* tvOwner;
		uint64_t lastPacket[PACKET_LAST];

		uint32_t m_eventConnect, m_packetCount, m_packetTime;
		bool m_debugAssertSent, m_acceptPackets;

		/////////otclientv8/////////////////
		void sendFloorDescription(const Position& pos, int floor);
		void parseChangeAwareRange(NetworkMessage& msg);
		void updateAwareRange(int width, int height);
		void sendAwareRange();
		
		bool otclientV8;
		struct AwareRange {
			int width;
			int height;

			int left() const { return width / 2; }
			int right() const { return 1 + width / 2; }
			int top() const { return height / 2; }
			int bottom() const { return 1 + height / 2; }
			int horizontal() const { return width + 1; }
			int vertical() const { return height + 1; }
		} awareRange;
};
#endif
