package com.stephenbrown.speedrun.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
@Entity
@Table(name="orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotNull
    @Size(min = 1, message="List name must not be blank.")
    private String orderName;
        
    private Integer total;
    
    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
            
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User postedBy;
        
    @OneToMany(mappedBy="order", fetch=FetchType.LAZY,cascade=CascadeType.REMOVE)
    private List<OrderItem> order_items;
    

	public void setPostedBy(User postedBy) {
		this.postedBy = postedBy;
	}

	public List<OrderItem> getOrder_items() {
		return order_items;
	}

	public void setOrder_items(List<OrderItem> order_items) {
		this.order_items = order_items;
	}

	public Order() {
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	

	public User getPostedBy() {
		return postedBy;
	}

	@PreUpdate
	protected void onUpdate(){
		this.updatedAt = new Date();
}
 
	@PrePersist
	protected void onCreate(){
		this.createdAt = new Date();
	}


	
}