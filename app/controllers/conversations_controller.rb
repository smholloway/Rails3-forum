class ConversationsController < ApplicationController
  #before_filter :load_forum, :except => [:show, :edit, :update]
  before_filter :load_forum

  # GET /conversations
  # GET /conversations.xml
  def index
    @conversations = Conversation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @conversations }
    end
  end

  # GET /conversations/1
  # GET /conversations/1.xml
  def show
    @conversation = Conversation.find(params[:id])
    @comments = @conversation.comments.all
    @comment = @conversation.comments.build

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @conversation }
    end
  end

  # GET /conversations/new
  # GET /conversations/new.xml
  def new
    #@conversation = Conversation.new
    @conversation = @forum.conversations.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @conversation }
    end
  end

  # GET /conversations/1/edit
  def edit
    @conversation = Conversation.find(params[:id])
  end

  # POST /conversations
  # POST /conversations.xml
  def create
    #@conversation = Conversation.new(params[:conversation])
    @conversation = @forum.conversations.new(params[:conversation])

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to(forum_conversation_path(@forum, @conversation), :notice => 'Conversation was successfully created.') }
        format.xml  { render :xml => @conversation, :status => :created, :location => @conversation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @conversation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /conversations/1
  # PUT /conversations/1.xml
  def update
    @conversation = Conversation.find(params[:id])

    respond_to do |format|
      if @conversation.update_attributes(params[:conversation])
        format.html { redirect_to(@conversation, :notice => 'Conversation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @conversation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.xml
  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy

    respond_to do |format|
      format.html { redirect_to(conversations_url) }
      format.xml  { head :ok }
    end
  end

  private
    def load_forum
      if (params[:id])
        @conversation = Conversation.find(params[:id]) # rescue redirect_to(forum_conversations_path)
        @forum = @conversation.forum rescue redirect_to(forums_path)
      elsif (params[:forum_id])
        @forum = Forum.find(params[:forum_id]) # rescue redirect_to(forums_path)
      else # conversations index
        redirect_to(forums_path)
      end
    end
end
