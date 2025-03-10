/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.persistence.Basic;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import jakarta.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author Asus-FPT
 */
@Entity
@Table(name = "CHATMESSAGES")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "Chatmessages.findAll", query = "SELECT c FROM Chatmessages c"),
    @NamedQuery(name = "Chatmessages.findByMessageID", query = "SELECT c FROM Chatmessages c WHERE c.messageID = :messageID"),
    @NamedQuery(name = "Chatmessages.findBySender", query = "SELECT c FROM Chatmessages c WHERE c.sender = :sender"),
    @NamedQuery(name = "Chatmessages.findByMessageText", query = "SELECT c FROM Chatmessages c WHERE c.messageText = :messageText"),
    @NamedQuery(name = "Chatmessages.findByTimestamp", query = "SELECT c FROM Chatmessages c WHERE c.timestamp = :timestamp")
})
public class Chatmessages implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "MessageID")
    private Integer messageID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "Sender")
    private String sender;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2000)
    @Column(name = "MessageText")
    private String messageText;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Timestamp")
    @Temporal(TemporalType.TIMESTAMP)
    private Date timestamp;
    @JoinColumn(name = "SessionID", referencedColumnName = "SessionID")
    @ManyToOne(optional = false)
    private Chatsessions sessionID;

    public Chatmessages()
    {
    }

    public Chatmessages(Integer messageID)
    {
        this.messageID = messageID;
    }

    public Chatmessages(Integer messageID, String sender, String messageText, Date timestamp)
    {
        this.messageID = messageID;
        this.sender = sender;
        this.messageText = messageText;
        this.timestamp = timestamp;
    }

    public Integer getMessageID()
    {
        return messageID;
    }

    public void setMessageID(Integer messageID)
    {
        this.messageID = messageID;
    }

    public String getSender()
    {
        return sender;
    }

    public void setSender(String sender)
    {
        this.sender = sender;
    }

    public String getMessageText()
    {
        return messageText;
    }

    public void setMessageText(String messageText)
    {
        this.messageText = messageText;
    }

    public Date getTimestamp()
    {
        return timestamp;
    }

    public void setTimestamp(Date timestamp)
    {
        this.timestamp = timestamp;
    }

    public Chatsessions getSessionID()
    {
        return sessionID;
    }

    public void setSessionID(Chatsessions sessionID)
    {
        this.sessionID = sessionID;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (messageID != null ? messageID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Chatmessages))
        {
            return false;
        }
        Chatmessages other = (Chatmessages) object;
        if ((this.messageID == null && other.messageID != null) || (this.messageID != null && !this.messageID.equals(other.messageID)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "model.Chatmessages[ messageID=" + messageID + " ]";
    }
    
}
