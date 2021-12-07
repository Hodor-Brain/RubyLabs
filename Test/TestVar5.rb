require 'date'

class Email
  attr_accessor :mails_send, :mails_received

  def initialize(mails_send, mails_received)
    @mails_send = mails_send
    @mails_received = mails_received
  end

  def sort_by_date
    sorted = @mails_send.sort { |a, b| a.date_send <=> b.date_send }
    print "Sorted sent mails:\n"
    (0..sorted.size).each do |i|
      print "#{sorted[i]}", "\n"
    end

    sorted = @mails_received.sort { |a, b| a.date_received <=> b.date_received }
    print "Sorted received mails:\n"
    (0..sorted.size).each do |i|
      print "#{sorted[i]}", "\n"
    end
  end

  def add_mail(mail, type)
    if type == "Send"
      @mails_send.push(mail)
    elsif type == "Received"
      @mails_received.push(mail)
    end
  end

  def get_by_topic(topic)
    array = Array.new
    @mails_send.each do |mail|
      array.push(mail) if mail.topic == topic
    end
    @mails_received.each do |mail|
      array.push(mail) if mail.topic == topic
    end
    array
  end

  def get_by_sender(sender)
    array = Array.new
    @mails_send.each do |mail|
      array.push(mail) if mail.sender == sender
    end
    @mails_received.each do |mail|
      array.push(mail) if mail.sender == sender
    end
    array
  end

  def get_by_receiver(receiver)
    array = Array.new
    @mails_send.each do |mail|
      array.push(mail) if mail.receiver == receiver
    end
    @mails_received.each do |mail|
      array.push(mail) if mail.receiver == receiver
    end
    array
  end
end

class Mail
  attr_accessor :topic, :category, :text, :tags, :sender, :receiver

  def initialize(topic, category, text, tags, sender, receiver)
    @topic = topic
    @category = category
    @text = text
    @tags = tags
    @sender = sender
    @receiver = receiver
  end

  def to_s
    "Topic: #{@topic}; Category: #{@category}; Text: #{@text}; Tags: #{@tags}; Sender: #{@sender}; Receiver: #{@receiver}"
  end
end

class Sent < Mail
  attr_accessor :topic, :category, :text, :sender, :receiver, :date_send

  def initialize(topic, category, text, tags, sender, receiver, date_send)
    super(topic, category, text, tags, sender, receiver)
    @date_send = date_send
  end

  def to_s
    super + "; Date sent: #{@date_send}"
  end
end

class Received < Mail
  attr_accessor :topic, :category, :text, :sender, :receiver, :date_received

  def initialize(topic, category, text, tags, sender, receiver, date_received)
    super(topic, category, text, tags, sender, receiver)
    @date_received = date_received
  end

  def to_s
    super + "; Date received: #{@date_received}"
  end
end

mails_sent = Array.new
mails_sent.push(Sent.new("Studying", "Important", ".....", "School, Univ", "Ruslan", "Yura", Date.new(2020, 7, 6)))
mails_sent.push(Sent.new("Work", "Must do", ".....", "", "Ruslan", "Someone", Date.new(2019, 9, 6)))
mails_sent.push(Sent.new("Work", "Important", ".....", "Office", "Ruslan", "Eliza", Date.new(2020, 7, 6)))

mails_received = Array.new
mails_received.push(Received.new("Studying", "None", ".....", "", "Phil", "Ruslan", Date.new(2020, 10, 6)))
mails_received.push(Received.new("Find this...", "STUDY", ".....", "Tag", "He", "Ruslan", Date.new(2020, 11, 9)))
mails_received.push(Received.new("Entertain", "love", ".....", "Walk", "Darri", "Ruslan", Date.new(2021, 12, 6)))

emails = Email.new(mails_sent, mails_received)

print "Sorted by date:\n"
emails.sort_by_date

topic = "Studying"
print("\nEmails with topic #{topic}:\n")
emails.get_by_topic(topic).each do |email|
  print email
  print "\n"
end

sender = "Ruslan"
print("\nEmails with sender #{sender}:\n")
emails.get_by_sender(sender).each do |email|
  print email
  print "\n"
end

receiver = "Ruslan"
print("\nEmails with receiver #{receiver}:\n")
emails.get_by_receiver(receiver).each do |email|
  print email
  print "\n"
end
