
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript"src="/scripts/chatjs/js/jquery.autosize.js"></script>
        <script type="text/javascript" src="/scripts/chatjs/js/jquery.chatjs.utils.js"></script>
        <script type="text/javascript" src="/scripts/chatjs/js/jquery.chatjs.adapter.servertypes.js"></script>
        <script type="text/javascript" src="/scripts/chatjs/js/jquery.chatjs.adapter.demo.js"></script>
        <script type="text/javascript" src="/scripts/chatjs/js/jquery.chatjs.window.js"></script>
        <script type="text/javascript" src="/scripts/chatjs/js/jquery.chatjs.messageboard.js"></script>
        <script type="text/javascript" src="/scripts/chatjs/js/jquery.chatjs.userlist.js"></script>
        <script type="text/javascript" src="/scripts/chatjs/js/jquery.chatjs.pmwindow.js"></script>
        <script type="text/javascript" src="/scripts/chatjs/js/jquery.chatjs.friendswindow.js"></script>
        <script type="text/javascript" src="/scripts/chatjs/js/jquery.chatjs.controller.js"></script>
        <link rel="stylesheet" href="/scripts/chatjs/css/jquery.chatjs.css"/>
        <script type="text/javascript" src="/scripts/websocket/sockjs.js"></script>
        <script type="text/javascript" src="/scripts/websocket/stomp.js"></script> 

        <script type="text/javascript">
            var stompClient = null;
            var socket = null;
            var whoami = null;
            var DemoAdapterConstants = (function() {
                function DemoAdapterConstants() {
                }
                DemoAdapterConstants.CURRENT_USER_ID = "${__user__.email}";
                DemoAdapterConstants.DEFAULT_ROOM_ID = ${__user__.id};
                DemoAdapterConstants.ECHOBOT_TYPING_DELAY = 1000;
                DemoAdapterConstants.ECHOBOT_REPLY_DELAY = 3000;
                return DemoAdapterConstants;
            })();
            var DemoServerAdapter = (function() {
                function DemoServerAdapter(clientAdapter, users) {
                    this.clientAdapter = clientAdapter;
                    this.users = users;
                    var defaultRoom = new ChatRoomInfo();
                    defaultRoom.Id = DemoAdapterConstants.DEFAULT_ROOM_ID;
                    defaultRoom.Name = "Default Room";
                    defaultRoom.UsersOnline = this.users.length;
                    this.rooms = new Array();
                    this.rooms.push(defaultRoom);
                    this.clientAdapter.onMessagesChanged(function(message) {
                        return function() {
                        };
                    });
                }
                DemoServerAdapter.prototype.sendMessage = function(roomId, conversationId, otherUserId, messageText, clientGuid, done) {
                    var _this = this;
                    console.log("DemoServerAdapter: sendMessage to " + otherUserId);
                    var bounceMessage = new ChatMessageInfo();
                    bounceMessage.UserFromId = DemoAdapterConstants.CURRENT_USER_ID; // It will from our user
                    bounceMessage.UserToId = otherUserId; // ... to the Echobot
                    bounceMessage.RoomId = roomId;
                    bounceMessage.ConversationId = conversationId;
                    bounceMessage.Message = messageText;
                    bounceMessage.ClientGuid = clientGuid;
                    setTimeout(function() {
                        stompClient.send("/app/chat", {}, JSON.stringify({'recipientId': roomId, 'recipient': otherUserId, 'message': messageText}));
                        _this.clientAdapter.triggerMessagesChanged(bounceMessage);
                    }, 300);
                };

                DemoServerAdapter.prototype.sendTypingSignal = function(roomId, conversationId, userToId, done) {
                    console.log("DemoServerAdapter: sendTypingSignal =" + userToId);
                };

                DemoServerAdapter.prototype.getMessageHistory = function(roomId, conversationId, otherUserId, done) {
                    console.log("DemoServerAdapter: getMessageHistory " + otherUserId);
                    var loadOldMessage = new ChatMessageInfo();
                    loadOldMessage.UserFromId = otherUserId; // It will from our user
                    loadOldMessage.UserToId = DemoAdapterConstants.CURRENT_USER_ID; // ... to the Echobot
                    loadOldMessage.RoomId = roomId;
                    loadOldMessage.ConversationId = conversationId;
                    loadOldMessage.Message = "testing";
                    done([loadOldMessage]);
                };

                DemoServerAdapter.prototype.getUserInfo = function(userId, done) {
                    var user = null;
                    for (var i = 0; i < this.users.length; i++) {
                        if (this.users[i].Id === userId) {
                            user = this.users[i];
                            return done(user);
                        }
                    }
                };

                DemoServerAdapter.prototype.getUserList = function(roomId, conversationId, done) {
                    console.log("DemoServerAdapter: getUserList " + roomId);
                    if (roomId === DemoAdapterConstants.DEFAULT_ROOM_ID) {
                        done(this.users);
                        return;
                    }
                    throw "The given room or conversation is not supported by the demo adapter";
                };

                DemoServerAdapter.prototype.enterRoom = function(roomId, done) {
                    console.log("DemoServerAdapter: enterRoom");
                    if (roomId !== DemoAdapterConstants.DEFAULT_ROOM_ID)
                        throw "Only the default room is supported in the demo adapter";

                    var userListChangedInfo = new ChatUserListChangedInfo();
                    userListChangedInfo.RoomId = DemoAdapterConstants.DEFAULT_ROOM_ID;
                    userListChangedInfo.UserList = this.users;
                    this.clientAdapter.triggerUserListChanged(userListChangedInfo);
                };

                DemoServerAdapter.prototype.leaveRoom = function(roomId, done) {
                    console.log("DemoServerAdapter: leaveRoom");
                };

                // gets the given user from the user list
                DemoServerAdapter.prototype.getUserById = function(userId) {
                    for (var i = 0; i < this.users.length; i++) {
                        if (this.users[i].Id == userId)
                            return this.users[i];
                    }
                    throw "Could not find the given user";
                };
                return DemoServerAdapter;
            })();

            var DemoAdapter = (function() {
                function DemoAdapter() {
                }
                // called when the adapter is initialized
                DemoAdapter.prototype.init = function(done) {
                    this.client = new DemoClientAdapter();
                    this.users = new Array();
                    this.server = new DemoServerAdapter(this.client, this.users);
                    done();
                };
                return DemoAdapter;
            })();
            var adapter = new DemoAdapter();
            function connect() {
                socket = new SockJS('/chat');
                stompClient = Stomp.over(socket);
                stompClient.connect("${__user__.email}", "${__user__.password}", function(frame) {
                    whoami = frame.headers['user-name'];
                    stompClient.subscribe('/user/queue/messages', function(messageDetails) {
                        var message = JSON.parse(messageDetails.body);
                        setTimeout(function() {
                            adapter.server.getUserInfo(message.sender, function(echobotUserInfo) {
                                var typingSignal = new ChatTypingSignalInfo();
                                typingSignal.ConversationId = message.recipientId;
                                typingSignal.RoomId = message.recipientId;
                                typingSignal.UserFrom = echobotUserInfo.ID;
                                typingSignal.UserToId = message.sender;
                                adapter.client.triggerTypingSignalReceived(typingSignal);
                                setTimeout(function() {
                                    var echoMessage = new ChatMessageInfo();
                                    echoMessage.UserFromId = message.sender;
                                    echoMessage.RoomId = message.recipientId;
                                    echoMessage.ConversationId = message.recipientId;
                                    echoMessage.Message = message.message;
                                    echoMessage.UserToId = message.recipient;
                                    adapter.client.triggerMessagesChanged(echoMessage);
                                }, DemoAdapterConstants.ECHOBOT_REPLY_DELAY);
                            });
                        }, DemoAdapterConstants.ECHOBOT_TYPING_DELAY);
                    });
                    stompClient.subscribe('/topic/active', function(activeUsers) {
                        showActive(activeUsers);
                    });
                });
            }
            function showActive(activeUsers) {
                stompClient.send('/app/activeUsers', {}, JSON.stringify({
                    id:${__user__.id}, email: '${__user__.email}', firstName: '${__user__.firstName}', lastName: '${__user__.lastName}'
                }));
                var userList = $.parseJSON(activeUsers.body);
                var acrtiveUsers = [];
                $.each(userList, function(i, user) {
                    if (user.email === whoami) {
                        return true;
                    }
                    var activeUser = new ChatUserInfo();
                    activeUser.Id = user.email;
                    activeUser.RoomId = DemoAdapterConstants.DEFAULT_ROOM_ID;
                    activeUser.Name = user.firstName + " " + user.lastName;
                    activeUser.Email = user.email;
                    activeUser.ProfilePictureUrl = "/userphoto.htm?userId=${__user__.userId}";
                    activeUser.Status = 1 /* Online */;
                    acrtiveUsers.push(activeUser);
                });
                var userListChangedInfo = new ChatUserListChangedInfo();
                userListChangedInfo.RoomId = DemoAdapterConstants.DEFAULT_ROOM_ID;
                userListChangedInfo.UserList = acrtiveUsers;
                adapter.client.triggerUserListChanged(userListChangedInfo);
                adapter.server.users = acrtiveUsers;
            }
            function setupMsgBoard(adapter) {
                $.chat({
                    // your user information
                    userId: "${__user__.email}",
                    // id of the room. The friends list is based on the room Id
                    roomId: ${__user__.id},
                    // text displayed when the other user is typing
                    typingText: ' is typing...',
                    // title for the rooms window
                    roomsTitleText: 'Rooms',
                    // title for the 'available rooms' rab
                    availableRoomsText: 'Available rooms',
                    // text displayed when there's no other users in the room
                    emptyRoomText: "There's no one around here. You can still open a session in another browser and chat with yourself :)",
                    // the adapter you are using
                    chatJsContentPath: '/scripts/chatjs/',
                    adapter: adapter
                });
            }
            $(function() {
                connect();
                setupMsgBoard(adapter);
            });
        </script>
    </head>
    <body>
        <div class="chat-sidebar">
            <div id="userList" style="text-align:left;"></div>
        </div>
    </body>
</html>
