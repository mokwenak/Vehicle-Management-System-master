using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using BMTemplate.Repositories;
using System.Windows.Forms;
using BMTemplate.Enums;

namespace BMTemplate.Repositories
{
    public class GarageCardRepository : BaseRepository
    {
        public GarageCard GetCard(string cardNo)
        {
            return this.m_Context.GarageCards.Where(b => b.CardNumber.Equals(cardNo)).SingleOrDefault();
        }

        public GarageCard GetCardByVehicleId(long id)
        {
            return this.m_Context.GarageCards.Where(b => b.VehicleId == id).FirstOrDefault();
        }

        public List<GarageCard> SearchByCard(string cardNo)
        {
            return (from g in this.m_Context.GarageCards
                    where g.CardNumber.Contains(cardNo)
                    select g).OrderBy(g => g.CardNumber).ToList();

        }

        public List<GarageCard> SearchByBank(string bankName)
        {
            return (from g in this.m_Context.GarageCards
                    where g.Bank.BankDescription.Contains(bankName)
                    select g).OrderBy( g => g.CardNumber).ToList();
        }

        public AddResult AddCard(string cardNo, int bankId, DateTime expireDate, DateTime receivedDate,
                                DateTime returnDate, string user ,long vehicleId)
        {
            if(this.GetCard(cardNo) != null)
            {
                return AddResult.Duplicate;
            }

            GarageCard newCard = new GarageCard()
            {
                CardNumber = cardNo,
                VehicleId = vehicleId,
                BankId = bankId,
                ExpireDate = expireDate,
                ReceivedDate = receivedDate,
                ReturnDate = returnDate 
            };

            this.m_Context.GarageCards.Add(newCard);


            if (this.m_Context.SaveChanges() > 0)
            {
                return AddResult.Successful;
            }

            return AddResult.Failed;
        }

        public bool UpdateCard(string cardNo, int bankId, DateTime expireDate, DateTime receivedDate,
                                DateTime returnDate, string user, long vehicleId)
        {
                    
            GarageCard card = this.GetCard(cardNo);
           
            if (card != null)
            {
                card.CardNumber = cardNo;
                card.BankId = bankId;
                card.ExpireDate = expireDate;
                card.ReceivedDate = receivedDate;
                card.ReturnDate = returnDate; 
                card.VehicleId = vehicleId;
          
                return this.m_Context.SaveChanges() > 0;
            }

            return false;
        }

        public bool DeleteCard(string cardNo, string userId)
        {
            GarageCard card = this.GetCard(cardNo);

            if (card != null)
            {
                //Set state
                return this.m_Context.SaveChanges() > 0;
            }

            return false;
        }
    }
}