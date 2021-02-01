
package com.interview.util;

import java.util.Date;
import java.util.List;

import javax.activation.DataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.MailParseException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.interview.model.Candidate;
import com.interview.model.MailInfo;
import com.interview.model.User;

public class EmailSender {

	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SimpleMailMessage simpleMailMessage;

	public void setSimpleMailMessage(SimpleMailMessage simpleMailMessage) {
		this.simpleMailMessage = simpleMailMessage;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void sendEMail(String toAdd, String subject, String name, String userName, String Password) {

		MimeMessage message = mailSender.createMimeMessage();

		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true);

			helper.setFrom(simpleMailMessage.getFrom());
			helper.setTo(new InternetAddress(toAdd));
			helper.setSubject(subject);
			helper.setText(String.format(simpleMailMessage.getText(), name, userName, Password));
		} catch (MessagingException e) {
			System.out.println("In Mail sender exe" + e);
			throw new MailParseException(e);
		}
		System.out.println("In Mail sender");
		mailSender.send(message);
	}

	public JavaMailSender getMailSender() {
		return mailSender;
	}

	public boolean sendMail(MailInfo mailInfo) {
		boolean status = false;
		MimeMessage message = mailSender.createMimeMessage();
		Multipart multipart = new MimeMultipart();
		BodyPart htmlPart = new MimeBodyPart();
		DataSource ds = null;
		try {
			htmlPart.setContent(mailInfo.getMessage(), "text/html; charset=utf-8");
			multipart.addBodyPart(htmlPart);

			message.setFrom(new InternetAddress(mailInfo.getFromAddress()));
			if (containsValue(mailInfo.getToAddresses())) {
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(mailInfo.getToAddresses()));
			} else {
				List<String> toMailIds = mailInfo.getRecipients();
				message.setRecipients(Message.RecipientType.TO, getInetAddress(toMailIds));
			}

			if (mailInfo.getCcRecipients() != null && !mailInfo.getCcRecipients().isEmpty()) {
				message.setRecipients(Message.RecipientType.CC, getInetAddress(mailInfo.getCcRecipients()));
			}

			if (mailInfo.getBccRecipients() != null && !mailInfo.getBccRecipients().isEmpty()) {
				message.setRecipients(Message.RecipientType.BCC, getInetAddress(mailInfo.getBccRecipients()));
			}

			message.setSubject(mailInfo.getSubject());
			message.setContent(multipart);

			mailSender.send(message);
			status = true;
		} catch (MessagingException exp) {
		}

		return status;

	}

	private InternetAddress[] getInetAddress(List<String> mailIds) throws AddressException {
		InternetAddress[] emailAddress = new InternetAddress[mailIds.size()];
		int i = 0;
		for (String recipient : mailIds) {
			emailAddress[i++] = new InternetAddress(recipient);
		}
		return emailAddress;
	}

	private boolean containsValue(String string) {
		boolean status = false;
		if (string != null && !string.equals("")) {
			status = true;
		}

		return status;

	}

	public void sendWelcomeEmail(User user) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true);

			helper.setFrom(simpleMailMessage.getFrom());
			helper.setTo(new InternetAddress(user.getCompanyemailid()));
			helper.setSubject("Welcome Message");
			StringBuilder messageText = new StringBuilder();
			messageText.append(
					"\nThank you for registering. \nPlease click the link below to verify your email ID. \nhttp://localhost:8080/interview/login\nThank You");
			String placeHolder = " Dear %s,\n \t %s \n Regards,\n Authorized Signatory \n (This is an auto generated e-mail and hence please do not send responses to this e-mail ID. In case of any clarifications/concerns, please speak to us in person)";
			String name = user.getFirstname() + " ";
			helper.setText(String.format(placeHolder, name, messageText.toString()));

		} catch (MessagingException e) {

			throw new MailParseException(e);
		}

		mailSender.send(message);

	}

	public void sendWelcomeEmail(Candidate candidate) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true);

			helper.setFrom(simpleMailMessage.getFrom());
			helper.setTo(new InternetAddress(candidate.getEmailid()));
			helper.setSubject("Welcome Message");
			StringBuilder messageText = new StringBuilder();
			messageText.append(
					"\nThank you for registering. \nPlease click the link below to verify your email ID. \nhttp://localhost:8080/interview/candidatelogin\nThank You");
			String placeHolder = " Dear %s,\n \t %s \n Regards,\n Authorized Signatory \n (This is an auto generated e-mail and hence please do not send responses to this e-mail ID. In case of any clarifications/concerns, please speak to us in person)";
			String name = candidate.getFirstname() + " ";
			helper.setText(String.format(placeHolder, name, messageText.toString()));

		} catch (MessagingException e) {

			throw new MailParseException(e);
		}

		mailSender.send(message);

	}

	public void sendPasswordReset(User user) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true);

			helper.setFrom(simpleMailMessage.getFrom());
			helper.setTo(new InternetAddress(user.getCompanyemailid()));
			helper.setSubject("Password Reset");
			StringBuilder messageText = new StringBuilder();
			messageText.append("\nYour Password Reset Has Been Successful");
			String placeHolder = " Dear %s,\n \t %s \n Regards,\n Authorized Signatory \n (This is an auto generated e-mail and hence please do not send responses to this e-mail ID. In case of any clarifications/concerns, please speak to us in person)";
			String name = user.getFirstname() + " ";
			helper.setText(String.format(placeHolder, name, messageText.toString()));

		} catch (MessagingException e) {

			throw new MailParseException(e);
		}

		mailSender.send(message);

	}

	public void sendPasswordReset(Candidate candidate) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true);

			helper.setFrom(simpleMailMessage.getFrom());
			helper.setTo(new InternetAddress(candidate.getEmailid()));
			helper.setSubject("Password Reset");
			StringBuilder messageText = new StringBuilder();
			messageText.append("\nYour Password Reset Has Been Successful");
			String placeHolder = " Dear %s,\n \t %s \n Regards,\n Authorized Signatory \n (This is an auto generated e-mail and hence please do not send responses to this e-mail ID. In case of any clarifications/concerns, please speak to us in person)";
			String name = candidate.getFirstname() + " ";
			helper.setText(String.format(placeHolder, name, messageText.toString()));

		} catch (MessagingException e) {

			throw new MailParseException(e);
		}

		mailSender.send(message);

	}

}
