/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import jakarta.persistence.Basic;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQueries;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.NotNull;
import jakarta.xml.bind.annotation.XmlRootElement;
import jakarta.xml.bind.annotation.XmlTransient;
import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

/**
 *
 * @author Asus-FPT
 */
@Entity
@Table(name = "CHATSESSIONS")
@XmlRootElement
@NamedQueries(
{
    @NamedQuery(name = "Chatsessions.findAll", query = "SELECT c FROM Chatsessions c"),
    @NamedQuery(name = "Chatsessions.findBySessionID", query = "SELECT c FROM Chatsessions c WHERE c.sessionID = :sessionID"),
    @NamedQuery(name = "Chatsessions.findByStartTime", query = "SELECT c FROM Chatsessions c WHERE c.startTime = :startTime"),
    @NamedQuery(name = "Chatsessions.findByEndTime", query = "SELECT c FROM Chatsessions c WHERE c.endTime = :endTime")
})
public class Chatsessions implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "SessionID")
    private Integer sessionID;
    @Basic(optional = false)
    @NotNull
    @Column(name = "StartTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date startTime;
    @Column(name = "EndTime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date endTime;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "sessionID")
    private Collection<Chatmessages> chatmessagesCollection;
    @JoinColumn(name = "UserID", referencedColumnName = "UserID")
    @ManyToOne
    private Users userID;

    public Chatsessions()
    {
    }

    public Chatsessions(Integer sessionID)
    {
        this.sessionID = sessionID;
    }

    public Chatsessions(Integer sessionID, Date startTime)
    {
        this.sessionID = sessionID;
        this.startTime = startTime;
    }

    public Integer getSessionID()
    {
        return sessionID;
    }

    public void setSessionID(Integer sessionID)
    {
        this.sessionID = sessionID;
    }

    public Date getStartTime()
    {
        return startTime;
    }

    public void setStartTime(Date startTime)
    {
        this.startTime = startTime;
    }

    public Date getEndTime()
    {
        return endTime;
    }

    public void setEndTime(Date endTime)
    {
        this.endTime = endTime;
    }

    @XmlTransient
    public Collection<Chatmessages> getChatmessagesCollection()
    {
        return chatmessagesCollection;
    }

    public void setChatmessagesCollection(Collection<Chatmessages> chatmessagesCollection)
    {
        this.chatmessagesCollection = chatmessagesCollection;
    }

    public Users getUserID()
    {
        return userID;
    }

    public void setUserID(Users userID)
    {
        this.userID = userID;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (sessionID != null ? sessionID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Chatsessions))
        {
            return false;
        }
        Chatsessions other = (Chatsessions) object;
        if ((this.sessionID == null && other.sessionID != null) || (this.sessionID != null && !this.sessionID.equals(other.sessionID)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "model.Chatsessions[ sessionID=" + sessionID + " ]";
    }
    
}
