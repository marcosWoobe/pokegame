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
#include "otpch.h"
#include <iostream>
#include <iomanip>

#include "iologindata.h"
#include "tools.h"

#ifdef __LOGIN_SERVER__
#include "gameservers.h"
#endif
#include "town.h"
#include "house.h"

#include "item.h"
#include "vocation.h"

#include "configmanager.h"
#include "game.h"

#include "iomarket.h"

#include "connection.h"
#include "networkmessage.h"


extern Game g_game;
uint32_t nextMarketId = 1;
uint64_t IOMarket::getMoneyMarket(Player* player, bool type)
{

	uint64_t money;
	if(type)
		money = player->__getItemTypeCount(2145, -1);
	else
		money = g_game.getMoney(player);

	return money;
}

bool IOMarket::removeMoneyMarket(Player* player, bool type, uint64_t price)
{
	bool bol = false;
	if(type)
	    bol = g_game.removeItemOfType(player, 2145, price, -1);
	else
	    bol = g_game.removeMoneyMarket(player, price);
    return bol;
}

bool IOMarket::addMoneyMarket(std::string player, bool type, uint64_t value)
{
	if(type)
	{
		Item* item = Item::CreateItem(2145, 1);
		uint16_t valueC = std::min((uint16_t)100, (uint16_t)value);
        item->setItemCount(valueC);
        IOLoginData::getInstance()->playerNewMail(NULL, player, 1, item);
        value -= valueC;
        while(value > 0)
        {
            valueC = std::min((uint16_t)100, (uint16_t)value);
            Item* itemW = Item::CreateItem(2145, valueC);
            itemW->setItemCount(valueC);
            IOLoginData::getInstance()->playerNewMail(NULL, player, 1, itemW);
            value -= valueC;
        }
	}
	else
		g_game.addMoneyMarket(player, value);

	return true;
}

bool IOMarket::getMarketItem(const uint32_t id) const
{
	MarketMap::const_iterator it = marketMap.find(id);
	if(it != marketMap.end())
	{
		return true;
	}
	return false;
}

bool IOMarket::setMarketItem(uint32_t id, MarketList marketList)
{
	marketList.id = nextMarketId;
	marketMap[nextMarketId] = marketList;
	++nextMarketId;
	return true;
}

bool IOMarket::setUpdateMarketItem(uint32_t id, MarketList marketList)
{
	marketMap[id] = marketList;
	return true;
}

std::string IOMarket::getItemListName(MarketList marketList)
{
	const ItemType* item = Item::items.getElement(marketList.item_Id);
	AttributeList::const_iterator it = marketList.attributesList.find("poke");

	std::stringstream s;
	if(it != marketList.attributesList.end())
	{
		boost::any value = it->second.get();
		if(!value.empty() && value.type() == typeid(std::string))
		    s << boost::any_cast<std::string>(value);

		it = marketList.attributesList.find("boost");
		if(it != marketList.attributesList.end())
		{
			value = it->second.get();
		    if(!value.empty() && value.type() == typeid(int32_t))
			{
				int32_t boost = boost::any_cast<int32_t>(value);
			    if(boost >= 1)
			        s << "+" << boost;
			}

			s << ".";
		}
    }else
	{
		s << item->name.c_str() << ".";
	}
	return s.str().c_str();
}

std::string IOMarket::getItemListDescription(MarketList marketList)
{
	const ItemType* item = Item::items.getElement(marketList.item_Id);
	AttributeList::const_iterator itL = marketList.attributesList.find("poke");

	std::stringstream s;
	s << "You see ";
	if(itL != marketList.attributesList.end())
	{
		boost::any value = itL->second.get();//poke
		if(!value.empty() && value.type() == typeid(std::string))
			s << boost::any_cast<std::string>(value);

		itL = marketList.attributesList.find("nick");
		if(itL != marketList.attributesList.end())
		{
			value = itL->second.get();
		    if(!value.empty() && value.type() == typeid(std::string))
			    s << " (Nickname: " << boost::any_cast<std::string>(value) << ")";
		}

				itL = marketList.attributesList.find("catch");
		if(itL != marketList.attributesList.end())
		{
			value = itL->second.get();
		    if(!value.empty() && value.type() == typeid(std::string))
			    s << "\n Capturado Por: " << boost::any_cast<std::string>(value) << "";
		}

						itL = marketList.attributesList.find("currentaura");
		if(itL != marketList.attributesList.end())
		{
			value = itL->second.get();
		    if(!value.empty() && value.type() == typeid(int32_t))
			    s << "\n Particle: Tem Aura";
		}

		itL = marketList.attributesList.find("boost");
		if(itL != marketList.attributesList.end())
		{
			value = itL->second.get();
		    if(!value.empty() && value.type() == typeid(int32_t))
			    s << "\n Boost: +" << boost::any_cast<int32_t>(value);

			s << ".";
		}

						{
			itL = marketList.attributesList.find("megaStone");
			if(itL != marketList.attributesList.end())
			{
				value = itL->second.get();//poke
				if(!value.empty() && value.type() == typeid(int32_t))
				{
					std::map<int32_t, std::string>::const_iterator it = xmlDescription.find(boost::any_cast<int32_t>(value));
					if(it != xmlDescription.end())
					{
						std::string Megas = it->second.c_str();
						s << "\n" << "Mega Stone: " << Megas;
					}
				}
			}
		}

		itL = marketList.attributesList.find("heldx");
		if(itL != marketList.attributesList.end())
		{
			value = itL->second.get();//poke
			if(!value.empty() && value.type() == typeid(int32_t))
			{
				std::map<int32_t, std::string>::const_iterator it = xmlDescriptionHeldX.find(boost::any_cast<int32_t>(value));
				if(it != xmlDescriptionHeldX.end())
				{
					std::string HELD_X = it->second.c_str();
					s << "\n" << "Helds: " << HELD_X;
				}

				itL = marketList.attributesList.find("heldy");
				if(itL != marketList.attributesList.end())
				{
					value = itL->second.get();//poke
					if(!value.empty() && value.type() == typeid(int32_t))
					{
						std::map<int32_t, std::string>::const_iterator it = xmlDescriptionHeldY.find(boost::any_cast<int32_t>(value));
						if(it != xmlDescriptionHeldY.end())
						{
							std::string HELD_Y = it->second.c_str();
				    		s << " and " << HELD_Y;
						}
					}
				}
				s << ".";
			}
		}else
		{
			itL = marketList.attributesList.find("heldy");
			if(itL != marketList.attributesList.end())
			{
				value = itL->second.get();//poke
				if(!value.empty() && value.type() == typeid(int32_t))
				{
					std::map<int32_t, std::string>::const_iterator it = xmlDescriptionHeldY.find(boost::any_cast<int32_t>(value));
					if(it != xmlDescriptionHeldY.end())
					{
						std::string HELD_Y = it->second.c_str();
						s << "\n" << "Helds: " << HELD_Y;
					}
				}
			}
		}
    }else
	{
		s << item->name.c_str() << ".";
	}
	return s.str().c_str();
}

uint8_t IOMarket::sellListSizeMarket(Player* player)//refazer depois
{
	uint8_t size = 0;
	for(MarketMap::const_iterator cit = marketMap.begin(); cit != marketMap.end(); ++cit)
	{
		MarketList marketList = cit->second;
		if(marketList.player_id == player->getGUID())
		{
			++size;
		}
	}
	return size;
}

bool IOMarket::sellListMarket(Player* player, NetworkMessage_ptr msg)
{
	uint16_t size = sellListSizeMarket(player);
	msg->AddByte(size);
	uint8_t i = 1;

	for(MarketMap::const_iterator cit = marketMap.begin(); cit != marketMap.end(); ++cit)
	{
		MarketList marketList = cit->second;

		if(marketList.player_id == player->getGUID())
		{
			const ItemType* item = Item::items.getElement(marketList.item_Id);
			if(!item)
				continue;

			msg->AddU32(marketList.id);
			msg->AddU16(item->clientId);
			msg->AddString(getItemListName(marketList));
			msg->AddU16(marketList.item_Count);
			msg->AddU32(marketList.item_Price);
			msg->AddString(getItemListDescription(marketList));
			msg->AddU64(marketList.m_Time);
			msg->AddByte(marketList.type_Money);
			msg->AddByte(marketList.price_all);
			++i;
		}
	}

	return true;
}

uint16_t IOMarket::buyListSizeMarket(uint8_t PAGFIRST, std::string searchText, std::map<uint32_t, MarketList>& marketBuyList)//refazer depois
{
	uint8_t size = 0;
	uint16_t i = 1;
	uint16_t PAGITEM_FIRST = ((PAGFIRST-1)*50)+1;
	uint16_t PAGITEM_LAST = PAGITEM_FIRST + 49;
	
	for(MarketMap::const_iterator cit = marketMap.begin(); cit != marketMap.end(); ++cit)
	{
		MarketList marketList = cit->second;
		//if(true)
		if(time(NULL) < marketList.m_Time)
		{
			if(i < PAGITEM_FIRST)
			{
				++i;
				continue;
			}

			if(PAGITEM_FIRST > PAGITEM_LAST)
			    break;

			std::string item_name = getItemListName(marketList);
			if(!searchText.empty() && item_name.find(searchText))
			{
				++i;
				continue;
			}
             
			marketBuyList[cit->first] = cit->second;
			++PAGITEM_FIRST;
			++size;
			++i;
		}//else
			//marketBuyList.erase(cit);
	}
	return size;
}

bool IOMarket::buyListMarket(Player* player, uint8_t PAGFIRST, std::string searchText, NetworkMessage_ptr msg)
{
	MarketMap marketBuyList;
	uint16_t size = buyListSizeMarket(PAGFIRST, searchText, marketBuyList);
	if(size < (PAGFIRST-1)*50)
		return false;

	uint16_t PAGITEM_FIRST = ((PAGFIRST-1)*50)+1;
	uint16_t PAGITEM_LAST = PAGITEM_FIRST + (size-1);

	uint8_t PAGSIZE_LAST = (uint8_t)(std::ceil(size/50));
	msg->AddByte(PAGFIRST);
	msg->AddByte(PAGSIZE_LAST);

	msg->AddByte(size);
	uint8_t i = 1;

	for(MarketMap::const_iterator cit = marketBuyList.begin(); cit != marketBuyList.end(); ++cit)
	{
		MarketList marketList = cit->second;
		if(true)
		{
			if(PAGITEM_FIRST > PAGITEM_LAST)
				break;

			if(i < PAGITEM_FIRST)
			{
				++i;
				continue;
			}

			std::string item_name = getItemListName(marketList);
			if(!searchText.empty() && item_name.find(searchText))
			{
				++i;
				continue;
			}

			const ItemType* item = Item::items.getElement(marketList.item_Id);
			if(!item)
				continue;

			std::string playerName = "Anonymous";
		    IOLoginData::getInstance()->getNameByGuid(marketList.player_id, playerName, 0);

			msg->AddU32(marketList.id);
			msg->AddU16(item->clientId);
			msg->AddString(item_name);
			msg->AddString(playerName);
			msg->AddU16(marketList.item_Count);
			msg->AddU32(marketList.item_Price);
			msg->AddString(getItemListDescription(marketList));
			msg->AddByte(marketList.type_Money);
			msg->AddByte(marketList.price_all);
			++PAGITEM_FIRST;
			++i;

		}
	}

	return true;
}

bool IOMarket::buyMarket(Player* player, uint16_t id, uint16_t count)
{
	MarketMap::const_iterator it = marketMap.find(id);
	if(it != marketMap.end())
	{
		MarketList marketList = it->second;

		uint64_t price = 0;
		if(player->getGUID() == marketList.player_id)//verifica se o player tá tentando comprar um item vendido por ele mesmo
        {
            player->sendExtendedOpcode(155, "Sorry, you can't buy your own items.");
	    	return false;
        }

		if(time(NULL) >= marketList.m_Time)//verifica se o item está com tempo vencido
        {
            player->sendExtendedOpcode(155, "Item as expirend in market.");
	    	return false;
        }

		if(count <= 0 || count > marketList.item_Count)
		{
            player->sendExtendedOpcode(155, "sorry, you can't buy many items.");
	    	return false;
        }

		if(!marketList.price_all)//verifica se o item é vendido pela unidade ou pelo total
		{
			price = (uint64_t)(marketList.item_Price*count);
		}else
		{
			if(count == marketList.item_Count)//verifica se a quantidade é a mesma do total
 			{
				price = marketList.item_Price;
			}else
			{
				player->sendExtendedOpcode(155, "Sorry, you can't buy this items.");
	    		return false;
			}
		}

		if(price <= 0 || price > 1000000000)
	    {
		    player->sendExtendedOpcode(155, "Desculpe, mas você não pode comprar esse item.");
            return false;
	    }

		uint64_t money = (uint64_t)getMoneyMarket(player, marketList.type_Money); //verificar o dinehiro na carteira/mochila do player
        if(money < price)//verifica se tem dinheiro suficiente
        {
            player->sendExtendedOpcode(155, "You don't have enoguh Money.");
	    	return false;
        }

		if(Item* item = Item::CreateItem(marketList.item_Id, marketList.item_Count))
		{
			unserializeListAtributes(item, marketList);
			uint16_t marke_Count = marketList.item_Count;
			if(count <= marke_Count)
 			{
				if(count == marke_Count)
 				{
					eraseMarket(id);
				}else{
					marketList.item_Count -= count;
					setUpdateMarketItem(id, marketList);
				}

	    	    uint16_t value = std::min((uint16_t)100, (uint16_t)count);
                item->setItemCount(value);
                IOLoginData::getInstance()->playerNewMail(NULL, player->getName(), 1, item);
                count -= value;
                while(count > 0)
                {
                    value = std::min((uint16_t)100, (uint16_t)count);
                    item = Item::CreateItem(item->getID(), value);
                    item->setItemCount(value);
                    IOLoginData::getInstance()->playerNewMail(NULL, player->getName(), 1, item);
                    count -= value;
                }
			}
			else
			{
				delete item;
				player->sendExtendedOpcode(155, "Desculpe mas não é mais possivel comprar essa quantidade.");
				return false;
			}
		}else
		{
			delete item;
			player->sendExtendedOpcode(155, "Sua compra não foi concluida.");
			return false;
		}

		std::string vendedor;
		IOLoginData::getInstance()->getNameByGuid(marketList.player_id, vendedor, false);
        removeMoneyMarket(player, marketList.type_Money, price);
		addMoneyMarket(vendedor, marketList.type_Money, price);
		player->sendExtendedOpcode(155, "Sua compra foi concluida");
	    return true;
	}

    player->sendExtendedOpcode(155, "Wrong ID.");
	return false;
}

bool IOMarket::sellMarket(Player* player, Item* item, uint16_t count, uint64_t preco, bool money, bool stack)
{
    if(preco < 1)
	{
		player->sendExtendedOpcode(155, "Desculpe, mas você não pode vender item por menos de 1 dollar.");
        return false;
	}

	if(preco > 10000000)
	{
		player->sendExtendedOpcode(155, "Desculpe, mas você não pode vender item por mais de 10kk.");
        return false;
	}

	if(count > 1000)
	{
		player->sendExtendedOpcode(155, "Desculpe, mas você não pode vender mais que 1000 itens de uma vez.");
        return false;
	}

	if(count <= 0 || item->getItemCount() < count)
	{
		player->sendExtendedOpcode(155, "Desculpe, mas você não pode vender essa quantidade de itens.");
        return false;
	}

	if(!money)
	{
		preco *= 100;
	}

	uint64_t imposto = (uint64_t)(preco*count*0.05);
	if(stack)
	{
		imposto = (uint64_t)(preco*0.05);
	}

	uint64_t moneyPlayer = getMoneyMarket(player, false);

	if(money)
	{
		imposto = 1000000;
	}

	if(moneyPlayer < imposto)
	{
		player->sendExtendedOpcode(155, "Desculpe, mas não tem saldo suficiente para pagar o imposto.");
        return false;
	}


	ReturnValue ret1 = g_game.internalRemoveItem(player, item, count);
	if(ret1 != RET_NOERROR)
	{
		player->sendExtendedOpcode(155, "Desculpe, mas sua venda não foi concluida.");
        return false;
	}

    PropWriteStream propWriteStream;
	item->serializeAttr(propWriteStream);
	uint32_t attributesSize = 0;
	const char* attributes = propWriteStream.getStream(attributesSize);

	PropStream stream;
	stream.init(attributes, attributesSize);

	MarketList marketList = MarketList();
	marketList.player_id = player->getGUID();
	marketList.item_Price = preco;
	marketList.item_Id = item->getID();
	marketList.item_Count = count;
	marketList.item_Attributes = attributes;
	marketList.item_Attributes_Size = attributesSize;
	marketList.m_Time = time(NULL)+(2*24*60*60);
	marketList.type_Money = money;
	marketList.price_all = stack;

	unserializeAttr(stream, marketList);
	removeMoneyMarket(player, false, imposto);
	setMarketItem(1, marketList);

	return true;
}

void IOMarket::unserializeListAtributes(Item* item, MarketList marketList)
{
    for(AttributeList::const_iterator cit = marketList.attributesList.begin(); cit != marketList.attributesList.end(); ++cit)
	{
		boost::any value = cit->second.get();
		item->setAttribute(cit->first, value);
	}

}

bool IOMarket::cancelSellMarket(Player* player, uint16_t id)
{

	MarketMap::const_iterator it = marketMap.find(id);
	if(it != marketMap.end())
	{
		MarketList marketList = it->second;
        if(player->getGUID() != marketList.player_id)
        {
			player->sendExtendedOpcode(155, "Wrong ID.");
	    	return false;
        }

		if(Item* item = Item::CreateItem(marketList.item_Id, marketList.item_Count))
		{

			unserializeListAtributes(item, marketList);

			eraseMarket(id);
			uint16_t marke_Count = marketList.item_Count;
	    	uint16_t value = std::min((uint16_t)100, marke_Count);
            item->setItemCount(value);
            IOLoginData::getInstance()->playerNewMail(NULL, player->getName(), 1, item);
            marke_Count -= value;
            while(marke_Count > 0)
            {
                value = std::min((uint16_t)100, marke_Count);
                item = Item::CreateItem(item->getID(), value);
                item->setItemCount(value);
                IOLoginData::getInstance()->playerNewMail(NULL, player->getName(), 1, item);
                marke_Count -= value;
	    	}
		}else
		{
			player->sendExtendedOpcode(155, "Seu cancelamento não foi concluido.");
			return false;
		}

	    player->sendExtendedOpcode(155, "Sua venda foi cancelada com sucesso.");
	    return true;
    }

    player->sendExtendedOpcode(155, "Wrong ID.");
    return false;
}

bool IOMarket::loadXmlMarket()
{
    xmlDocPtr doc = xmlParseFile(getFilePath(FILE_TYPE_XML, "market.xml").c_str());
	if(!doc)
	{
		std::cout << "[Warning - Game::loadExperienceStages] Cannot load market file." << std::endl;
		std::cout << getLastXMLError() << std::endl;
		return false;
	}

	xmlNodePtr q, p, root = xmlDocGetRootElement(doc);
	if(xmlStrcmp(root->name, (const xmlChar*)"market"))
	{
		std::cout << "[Error - Game::loadExperienceStages] Malformed market file" << std::endl;
		xmlFreeDoc(doc);
		return false;
	}

	int32_t intValue;
	std::string strValue;
	q = root->children;

	while(q)
	{

		if(!xmlStrcmp(q->name, (const xmlChar*)"xhelds"))
		{
			p = q->children;
			while(p)
			{
				if(!xmlStrcmp(p->name, (const xmlChar*)"xheld"))
				{
					int32_t id;
					if(readXMLInteger(p, "id", intValue))
						id = intValue;

                    if(id)
                    {
					    if(readXMLString(p, "name", strValue))
						    xmlDescriptionHeldX[id] = strValue;
                    }
				}

				p = p->next;
			}
		}

		if(!xmlStrcmp(q->name, (const xmlChar*)"yhelds"))
		{
			p = q->children;
			while(p)
			{
				if(!xmlStrcmp(p->name, (const xmlChar*)"yheld"))
				{
					int32_t id;
					if(readXMLInteger(p, "id", intValue))
						id = intValue;

                    if(id)
                    {
					    if(readXMLString(p, "name", strValue))
						    xmlDescriptionHeldY[id] = strValue;
                    }
				}

				p = p->next;
			}
		}

				if(!xmlStrcmp(q->name, (const xmlChar*)"megas"))
		{
			p = q->children;
			while(p)
			{
				if(!xmlStrcmp(p->name, (const xmlChar*)"megaStone"))
				{
					int32_t id;
					if(readXMLInteger(p, "id", intValue))
						id = intValue;

                    if(id)
                    {
					    if(readXMLString(p, "name", strValue))
						    xmlDescription[id] = strValue;
                    }
				}

				p = p->next;
			}
		}

		q = q->next;
	}
	xmlFreeDoc(doc);
	return true;
}

bool IOMarket::loadItemsMarket()
{
	Database* db = Database::getInstance();
	DBQuery query;

	query << "SELECT * FROM `market_items` WHERE `id`";
	DBResult* result;
	if((result = db->storeQuery(query.str())))
	{
		do
		{
			uint32_t id = result->getDataInt("id");
			uint64_t attributesSize = 0;
			const char* attr = result->getDataStream("attributes", attributesSize);

			PropStream stream;
			stream.init(attr, attributesSize);


			MarketList marketList = MarketList();
			marketList.player_id = result->getDataInt("player_id");
			marketList.item_Price = result->getDataInt("cost");
			marketList.item_Id = result->getDataInt("itemtype");
			marketList.item_Count = result->getDataInt("count");
			marketList.item_Attributes = attr;
			marketList.item_Attributes_Size = (uint32_t)attributesSize;
			marketList.m_Time = result->getDataInt("time");
			marketList.type_Money = result->getDataInt("money");
			marketList.price_all = result->getDataInt("stack");
			unserializeAttr(stream, marketList);

			setMarketItem(1, marketList);
		}
		while(result->next());
		result->free();

		return true;
	}
	return false;
}

bool IOMarket::saveItemsMarket()
{
	if(marketMap.empty())
		return false;

	Database* db = Database::getInstance();
	DBQuery query;

	query << "DELETE FROM `market_items` WHERE `id`";
	if(!db->executeQuery(query.str()))
		return false;

	DBInsert query_insert(db);
	query_insert.setQuery("INSERT INTO `market_items` (`player_id`, `cost`, `itemtype`, `count`, `attributes`, `time`, `money`, `stack`) VALUES ");
	for(MarketMap::const_iterator cit = marketMap.begin(); cit != marketMap.end(); ++cit)
	{

        MarketList marketList = cit->second;

        PropWriteStream propWriteStream;
		serializeAttr(propWriteStream, marketList);

		uint32_t attributesSize = 0;
		const char* attributes = propWriteStream.getStream(attributesSize);



		DBQuery query;
		query << marketList.player_id
		<< ", " << marketList.item_Price
		<< ", " << marketList.item_Id
		<< ", " << marketList.item_Count
		<< ", " << db->escapeBlob(attributes, attributesSize).c_str()
		<< ", " << marketList.m_Time
		<< ", " << marketList.type_Money
		<< ", " << marketList.price_all;

		if(!query_insert.addRow(query.str()))
			return false;
	}

	return query_insert.execute();
}


bool IOMarket::savePlayerItemsMarket(Player* player)
{
	if(marketMap.empty())
		return false;

	Database* db = Database::getInstance();
	DBQuery query;

	query << "DELETE FROM `market_items` WHERE `player_id` = " << player->getGUID();
	if(!db->executeQuery(query.str()))
		return false;

	DBInsert query_insert(db);
	query_insert.setQuery("INSERT INTO `market_items` (`player_id`, `cost`, `itemtype`, `count`, `attributes`, `time`, `money`, `stack`) VALUES ");
	for(MarketMap::const_iterator cit = marketMap.begin(); cit != marketMap.end(); ++cit)
	{

        MarketList marketList = cit->second;
		if(marketList.player_id == player->getGUID())
		{
            PropWriteStream propWriteStream;
		    serializeAttr(propWriteStream, marketList);

		    uint32_t attributesSize = 0;
		    const char* attributes = propWriteStream.getStream(attributesSize);

		    DBQuery query;
		    query << marketList.player_id
		    << ", " << marketList.item_Price
		    << ", " << marketList.item_Id
		    << ", " << marketList.item_Count
		    << ", " << db->escapeBlob(attributes, attributesSize).c_str()
		    << ", " << marketList.m_Time
		    << ", " << marketList.type_Money
		    << ", " << marketList.price_all;

		    if(!query_insert.addRow(query.str()))
			    return false;
		}
	}

	return query_insert.execute();
}











bool IOMarket::serializeAttr(PropWriteStream& propWriteStream, MarketList marketList) const
{
	if(!marketList.attributesList.empty())
	{
		propWriteStream.ADD_UCHAR(ATTR_ATTRIBUTE_MAP);
		serializeMap(propWriteStream, marketList);
	}

	return true;
}

void IOMarket::serializeMap(PropWriteStream& stream, MarketList marketList) const
{
	stream.ADD_USHORT((uint16_t)std::min((size_t)0xFFFF, marketList.attributesList.size()));
	AttributeList::const_iterator it = marketList.attributesList.begin();
	for(int32_t i = 0; it != marketList.attributesList.end() && i <= 0xFFFF; ++it, ++i)
	{
		std::string key = it->first;
		if(key.size() > 0xFFFF)
			stream.ADD_STRING(key.substr(0, 0xFFFF));
		else
			stream.ADD_STRING(key);

		it->second.serialize(stream);
	}
}

void IOMarketAtribute::serialize(PropWriteStream& stream) const
{
	stream.ADD_UCHAR((uint8_t)type);
	switch(type)
	{
		case STRING:
			stream.ADD_LSTRING(*getString());
			break;
		case INTEGER:
			stream.ADD_ULONG(*(uint32_t*)getInteger());
			break;
		case FLOAT:
			stream.ADD_ULONG(*(uint32_t*)getFloat());
			break;
		case BOOLEAN:
			stream.ADD_UCHAR(*(uint8_t*)getBoolean());
		default:
			break;
	}
}






bool IOMarketAtribute::unserialize(PropStream& stream)
{
	uint8_t type = 0;
	stream.GET_UCHAR(type);
	switch(type)
	{
		case STRING:
		{
			std::string v;
			if(!stream.GET_LSTRING(v))
				return false;

			set(v);
			break;
		}
		case INTEGER:
		{
			uint32_t v;
			if(!stream.GET_ULONG(v))
				return false;

			set(*reinterpret_cast<int32_t*>(&v));
			break;
		}
		case FLOAT:
		{
			uint32_t v;
			if(!stream.GET_ULONG(v))
				return false;

			set(*reinterpret_cast<float*>(&v));
			break;
		}
		case BOOLEAN:
		{
			uint8_t v;
			if(!stream.GET_UCHAR(v))
				return false;

			set(v != 0);
		}
		default:
			break;
	}

	return true;
}

bool IOMarket::unserializeMap(PropStream& stream, MarketList& marketList)
{
	uint16_t n;
	if(!stream.GET_USHORT(n))
		return true;

	//createAttributes();
	while(n--)
	{
		std::string key;
		if(!stream.GET_STRING(key))
			return false;

		IOMarketAtribute attr;
		if(!attr.unserialize(stream))
			return false;

        marketList.attributesList[key] = attr; //BR

	}

	return true;
}

Attr_ReadValue IOMarket::readAttr(AttrTypes_t attr, PropStream& propStream, MarketList& marketList)
{
	switch(attr)
	{
		case ATTR_COUNT:
		case ATTR_ACTION_ID:
		case ATTR_UNIQUE_ID:
		case ATTR_NAME:
		case ATTR_PLURALNAME:
		case ATTR_ARTICLE:
		case ATTR_ATTACK:
		case ATTR_EXTRAATTACK:
		case ATTR_DEFENSE:
		case ATTR_EXTRADEFENSE:
		case ATTR_ARMOR:
		case ATTR_ATTACKSPEED:
		case ATTR_HITCHANCE:
		case ATTR_SCRIPTPROTECTED:
		case ATTR_TEXT:
		case ATTR_WRITTENDATE:
		case ATTR_WRITTENBY:
		case ATTR_DESC:
		case ATTR_RUNE_CHARGES:
		case ATTR_CHARGES:
		case ATTR_DURATION:
		case ATTR_DECAYING_STATE:
		case ATTR_DEPOT_ID:
		case ATTR_HOUSEDOORID:
		case ATTR_TELE_DEST:
		case ATTR_SLEEPERGUID:
		case ATTR_SLEEPSTART:
		case ATTR_CONTAINER_ITEMS:
		{
		    break;
		}

		case ATTR_ATTRIBUTE_MAP:
		{
			bool ret = unserializeMap(propStream, marketList);

			if(ret)
				break;
		}

		default:
			return ATTR_READ_ERROR;
	}

	return ATTR_READ_CONTINUE;
}

bool IOMarket::unserializeAttr(PropStream& propStream, MarketList& marketList)
{
	uint8_t attrType = ATTR_END;
	while(propStream.GET_UCHAR(attrType) && attrType != ATTR_END)
	{
		switch(readAttr((AttrTypes_t)attrType, propStream, marketList))
		{
			case ATTR_READ_ERROR:
				return false;

			case ATTR_READ_END:
				return true;

			default:
				break;
		}
	}

	return true;
}

void IOMarket::createAttributes()
{
	//if(!attributesList)
	//	attributesList = new AttributesList;
}









IOMarketAtribute& IOMarketAtribute::operator=(const IOMarketAtribute& o)
{
	if(&o == this)
		return *this;

	clear();
	type = o.type;
	switch(type)
	{
		case STRING:
			new(data) std::string(*reinterpret_cast<const std::string*>(&o.data));
			break;
		case INTEGER:
			*reinterpret_cast<int32_t*>(data) = *reinterpret_cast<const int32_t*>(&o.data);
			break;
		case FLOAT:
			*reinterpret_cast<float*>(data) = *reinterpret_cast<const float*>(&o.data);
			break;
		case BOOLEAN:
			*reinterpret_cast<bool*>(data) = *reinterpret_cast<const bool*>(&o.data);
			break;
		default:
			type = NONE;
			break;
	}

	return *this;

}

void IOMarketAtribute::clear()
{
	type = NONE;
	if(type == STRING)
		(reinterpret_cast<std::string*>(&data))->~basic_string();
}

void IOMarketAtribute::set(const std::string& s)
{
	clear();
	type = STRING;
	new(data) std::string(s);
}

void IOMarketAtribute::set(int32_t i)
{
	clear();
	type = INTEGER;
	*reinterpret_cast<int32_t*>(&data) = i;
}

void IOMarketAtribute::set(float f)
{
	clear();
	type = FLOAT;
	*reinterpret_cast<float*>(&data) = f;
}

void IOMarketAtribute::set(bool b)
{
	clear();
	type = BOOLEAN;
	*reinterpret_cast<bool*>(&data) = b;
}

void IOMarketAtribute::set(boost::any a)
{
	clear();
	if(a.empty())
		return;

	if(a.type() == typeid(std::string))
	{
		type = STRING;
		new(data) std::string(boost::any_cast<std::string>(a));
	}
	else if(a.type() == typeid(int32_t))
	{
		type = INTEGER;
		*reinterpret_cast<int32_t*>(&data) = boost::any_cast<int32_t>(a);
	}
	else if(a.type() == typeid(float))
	{
		type = FLOAT;
		*reinterpret_cast<float*>(&data) = boost::any_cast<float>(a);
	}
	else if(a.type() == typeid(bool))
	{
		type = BOOLEAN;
		*reinterpret_cast<bool*>(&data) = boost::any_cast<bool>(a);
	}
}

const std::string* IOMarketAtribute::getString() const
{
	if(type != STRING)
		return NULL;

	return reinterpret_cast<const std::string*>(&data);
}

const int32_t* IOMarketAtribute::getInteger() const
{
	if(type != INTEGER)
		return NULL;

	return reinterpret_cast<const int32_t*>(&data);
}

const float* IOMarketAtribute::getFloat() const
{
	if(type != FLOAT)
		return NULL;

	return reinterpret_cast<const float*>(&data);
}

const bool* IOMarketAtribute::getBoolean() const
{
	if(type != BOOLEAN)
		return NULL;

	return reinterpret_cast<const bool*>(&data);
}

boost::any IOMarketAtribute::get() const
{
	switch(type)
	{
		case STRING:
			return *reinterpret_cast<const std::string*>(&data);
		case INTEGER:
			return *reinterpret_cast<const int*>(&data);
		case FLOAT:
			return *reinterpret_cast<const float*>(&data);
		case BOOLEAN:
			return *reinterpret_cast<const bool*>(&data);
		default:
			break;
	}

	return boost::any();
}
