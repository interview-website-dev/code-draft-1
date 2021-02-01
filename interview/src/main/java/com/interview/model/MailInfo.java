/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.interview.model;

import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 *
 * @author acer
 */
public class MailInfo {

	private String toAddresses;
	private String fromAddress;
	private String subject;
	private String message;
	private Map<String, String> contentFileNames;
	private List<String> attachments;
	private List<String> recipients;
	private List<String> ccRecipients, bccRecipients;
	private int emailQueueId;
	private String emailStatus;

	public String getToAddresses() {
		return toAddresses;
	}

	public void setToAddresses(String toAddresses) {
		this.toAddresses = toAddresses;
	}

	public String getFromAddress() {
		return fromAddress;
	}

	public void setFromAddress(String fromAddress) {
		this.fromAddress = fromAddress;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Map<String, String> getContentFileNames() {
		return contentFileNames;
	}

	public void setContentFileNames(Map<String, String> contentFileNames) {
		this.contentFileNames = contentFileNames;
	}

	public List<String> getAttachments() {
		return attachments;
	}

	public void setAttachments(List<String> attachments) {
		this.attachments = attachments;
	}

	public List<String> getRecipients() {
		return recipients;
	}

	public void setRecipients(List<String> recipients) {
		this.recipients = recipients;
	}

	public List<String> getCcRecipients() {
		return ccRecipients;
	}

	public void setCcRecipients(List<String> ccRecipients) {
		this.ccRecipients = ccRecipients;
	}

	public List<String> getBccRecipients() {
		return bccRecipients;
	}

	public void setBccRecipients(List<String> bccRecipients) {
		this.bccRecipients = bccRecipients;
	}

	public int getEmailQueueId() {
		return emailQueueId;
	}

	public void setEmailQueueId(int emailQueueId) {
		this.emailQueueId = emailQueueId;
	}

	public String getEmailStatus() {
		return emailStatus;
	}

	public void setEmailStatus(String emailStatus) {
		this.emailStatus = emailStatus;
	}

	@Override
	public int hashCode() {
		int hash = 5;
		hash = 23 * hash + Objects.hashCode(this.toAddresses);
		hash = 23 * hash + Objects.hashCode(this.fromAddress);
		hash = 23 * hash + Objects.hashCode(this.subject);
		hash = 23 * hash + Objects.hashCode(this.message);
		hash = 23 * hash + Objects.hashCode(this.contentFileNames);
		hash = 23 * hash + Objects.hashCode(this.attachments);
		hash = 23 * hash + Objects.hashCode(this.recipients);
		hash = 23 * hash + Objects.hashCode(this.ccRecipients);
		hash = 23 * hash + Objects.hashCode(this.bccRecipients);
		hash = 23 * hash + this.emailQueueId;
		hash = 23 * hash + Objects.hashCode(this.emailStatus);
		return hash;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		final MailInfo other = (MailInfo) obj;
		if (!Objects.equals(this.toAddresses, other.toAddresses)) {
			return false;
		}
		if (!Objects.equals(this.fromAddress, other.fromAddress)) {
			return false;
		}
		if (!Objects.equals(this.subject, other.subject)) {
			return false;
		}
		if (!Objects.equals(this.message, other.message)) {
			return false;
		}
		if (!Objects.equals(this.contentFileNames, other.contentFileNames)) {
			return false;
		}
		if (!Objects.equals(this.attachments, other.attachments)) {
			return false;
		}
		if (!Objects.equals(this.recipients, other.recipients)) {
			return false;
		}
		if (!Objects.equals(this.ccRecipients, other.ccRecipients)) {
			return false;
		}
		if (!Objects.equals(this.bccRecipients, other.bccRecipients)) {
			return false;
		}
		if (this.emailQueueId != other.emailQueueId) {
			return false;
		}
		if (!Objects.equals(this.emailStatus, other.emailStatus)) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "MailInfo{" + "toAddresses=" + toAddresses + ", fromAddress=" + fromAddress + ", subject=" + subject
				+ ", message=" + message + ", contentFileNames=" + contentFileNames + ", attachments=" + attachments
				+ ", recipients=" + recipients + ", ccRecipients=" + ccRecipients + ", bccRecipients=" + bccRecipients
				+ ", emailQueueId=" + emailQueueId + ", emailStatus=" + emailStatus + '}';
	}

}
