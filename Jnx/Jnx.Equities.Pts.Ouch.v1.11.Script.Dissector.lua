-----------------------------------------------------------------------
-- Lua Script Wireshark Dissector
-- 
-- Please see end of file for rules and regulations
-----------------------------------------------------------------------

-- Jnx Equities Pts Ouch 1.11 Protocol
local jnx_equities_pts_ouch_v1_11 = Proto("Jnx.Equities.Pts.Ouch.v1.11.Lua", "Jnx Equities Pts Ouch 1.11")

-- Component Tables
local show = {}
local format = {}
local jnx_equities_pts_ouch_v1_11_display = {}
local jnx_equities_pts_ouch_v1_11_dissect = {}
local jnx_equities_pts_ouch_v1_11_size_of = {}
local verify = {}

-----------------------------------------------------------------------
-- Declare Protocol Fields
-----------------------------------------------------------------------

-- Jnx Equities Pts Ouch 1.11 Fields
jnx_equities_pts_ouch_v1_11.fields.buy_sell_indicator = ProtoField.new("Buy Sell Indicator", "jnx.equities.pts.ouch.v1.11.buysellindicator", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.cancel_order_message = ProtoField.new("Cancel Order Message", "jnx.equities.pts.ouch.v1.11.cancelordermessage", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.capacity = ProtoField.new("Capacity", "jnx.equities.pts.ouch.v1.11.capacity", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.cash_margin_type = ProtoField.new("Cash Margin Type", "jnx.equities.pts.ouch.v1.11.cashmargintype", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.client_reference = ProtoField.new("Client Reference", "jnx.equities.pts.ouch.v1.11.clientreference", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.data = ProtoField.new("Data", "jnx.equities.pts.ouch.v1.11.data", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.debug_packet = ProtoField.new("Debug Packet", "jnx.equities.pts.ouch.v1.11.debugpacket", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.decrement_quantity = ProtoField.new("Decrement Quantity", "jnx.equities.pts.ouch.v1.11.decrementquantity", ftypes.UINT32)
jnx_equities_pts_ouch_v1_11.fields.display = ProtoField.new("Display", "jnx.equities.pts.ouch.v1.11.display", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.enter_order_message = ProtoField.new("Enter Order Message", "jnx.equities.pts.ouch.v1.11.enterordermessage", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.executed_quantity = ProtoField.new("Executed Quantity", "jnx.equities.pts.ouch.v1.11.executedquantity", ftypes.UINT32)
jnx_equities_pts_ouch_v1_11.fields.execution_price = ProtoField.new("Execution Price", "jnx.equities.pts.ouch.v1.11.executionprice", ftypes.UINT32)
jnx_equities_pts_ouch_v1_11.fields.existing_order_token = ProtoField.new("Existing Order Token", "jnx.equities.pts.ouch.v1.11.existingordertoken", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.firm_id = ProtoField.new("Firm Id", "jnx.equities.pts.ouch.v1.11.firmid", ftypes.UINT32)
jnx_equities_pts_ouch_v1_11.fields.group = ProtoField.new("Group", "jnx.equities.pts.ouch.v1.11.group", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.liquidity_indicator = ProtoField.new("Liquidity Indicator", "jnx.equities.pts.ouch.v1.11.liquidityindicator", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.login_accepted_packet = ProtoField.new("Login Accepted Packet", "jnx.equities.pts.ouch.v1.11.loginacceptedpacket", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.login_rejected_packet = ProtoField.new("Login Rejected Packet", "jnx.equities.pts.ouch.v1.11.loginrejectedpacket", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.login_request_packet = ProtoField.new("Login Request Packet", "jnx.equities.pts.ouch.v1.11.loginrequestpacket", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.match_number = ProtoField.new("Match Number", "jnx.equities.pts.ouch.v1.11.matchnumber", ftypes.UINT64)
jnx_equities_pts_ouch_v1_11.fields.message = ProtoField.new("Message", "jnx.equities.pts.ouch.v1.11.message", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.message_type = ProtoField.new("Message Type", "jnx.equities.pts.ouch.v1.11.messagetype", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.minimum_quantity = ProtoField.new("Minimum Quantity", "jnx.equities.pts.ouch.v1.11.minimumquantity", ftypes.UINT32)
jnx_equities_pts_ouch_v1_11.fields.order_accepted_message = ProtoField.new("Order Accepted Message", "jnx.equities.pts.ouch.v1.11.orderacceptedmessage", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.order_aiq_canceled_message = ProtoField.new("Order Aiq Canceled Message", "jnx.equities.pts.ouch.v1.11.orderaiqcanceledmessage", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.order_canceled_message = ProtoField.new("Order Canceled Message", "jnx.equities.pts.ouch.v1.11.ordercanceledmessage", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.order_canceled_reason = ProtoField.new("Order Canceled Reason", "jnx.equities.pts.ouch.v1.11.ordercanceledreason", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.order_classification = ProtoField.new("Order Classification", "jnx.equities.pts.ouch.v1.11.orderclassification", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.order_executed_message = ProtoField.new("Order Executed Message", "jnx.equities.pts.ouch.v1.11.orderexecutedmessage", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.order_number = ProtoField.new("Order Number", "jnx.equities.pts.ouch.v1.11.ordernumber", ftypes.UINT64)
jnx_equities_pts_ouch_v1_11.fields.order_rejected_message = ProtoField.new("Order Rejected Message", "jnx.equities.pts.ouch.v1.11.orderrejectedmessage", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.order_rejected_reason = ProtoField.new("Order Rejected Reason", "jnx.equities.pts.ouch.v1.11.orderrejectedreason", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.order_replaced_message = ProtoField.new("Order Replaced Message", "jnx.equities.pts.ouch.v1.11.orderreplacedmessage", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.order_state = ProtoField.new("Order State", "jnx.equities.pts.ouch.v1.11.orderstate", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.order_token = ProtoField.new("Order Token", "jnx.equities.pts.ouch.v1.11.ordertoken", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.orderbook_id = ProtoField.new("Orderbook Id", "jnx.equities.pts.ouch.v1.11.orderbookid", ftypes.UINT32)
jnx_equities_pts_ouch_v1_11.fields.packet = ProtoField.new("Packet", "jnx.equities.pts.ouch.v1.11.packet", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.packet_header = ProtoField.new("Packet Header", "jnx.equities.pts.ouch.v1.11.packetheader", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.packet_length = ProtoField.new("Packet Length", "jnx.equities.pts.ouch.v1.11.packetlength", ftypes.UINT16)
jnx_equities_pts_ouch_v1_11.fields.packet_type = ProtoField.new("Packet Type", "jnx.equities.pts.ouch.v1.11.packettype", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.password = ProtoField.new("Password", "jnx.equities.pts.ouch.v1.11.password", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.payload = ProtoField.new("Payload", "jnx.equities.pts.ouch.v1.11.payload", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.previous_order_token = ProtoField.new("Previous Order Token", "jnx.equities.pts.ouch.v1.11.previousordertoken", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.price = ProtoField.new("Price", "jnx.equities.pts.ouch.v1.11.price", ftypes.UINT32)
jnx_equities_pts_ouch_v1_11.fields.quantity = ProtoField.new("Quantity", "jnx.equities.pts.ouch.v1.11.quantity", ftypes.UINT32)
jnx_equities_pts_ouch_v1_11.fields.quantity_prevented_from_trading = ProtoField.new("Quantity Prevented From Trading", "jnx.equities.pts.ouch.v1.11.quantitypreventedfromtrading", ftypes.UINT32)
jnx_equities_pts_ouch_v1_11.fields.reject_reason_code = ProtoField.new("Reject Reason Code", "jnx.equities.pts.ouch.v1.11.rejectreasoncode", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.replace_order_message = ProtoField.new("Replace Order Message", "jnx.equities.pts.ouch.v1.11.replaceordermessage", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.replacement_order_token = ProtoField.new("Replacement Order Token", "jnx.equities.pts.ouch.v1.11.replacementordertoken", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.requested_sequence_number = ProtoField.new("Requested Sequence Number", "jnx.equities.pts.ouch.v1.11.requestedsequencenumber", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.requested_session = ProtoField.new("Requested Session", "jnx.equities.pts.ouch.v1.11.requestedsession", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.sequence_number = ProtoField.new("Sequence Number", "jnx.equities.pts.ouch.v1.11.sequencenumber", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.sequenced_data_packet = ProtoField.new("Sequenced Data Packet", "jnx.equities.pts.ouch.v1.11.sequenceddatapacket", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.session = ProtoField.new("Session", "jnx.equities.pts.ouch.v1.11.session", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.soup_bin_tcp_packet = ProtoField.new("Soup Bin Tcp Packet", "jnx.equities.pts.ouch.v1.11.soupbintcppacket", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.system_event = ProtoField.new("System Event", "jnx.equities.pts.ouch.v1.11.systemevent", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.system_event_message = ProtoField.new("System Event Message", "jnx.equities.pts.ouch.v1.11.systemeventmessage", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.text = ProtoField.new("Text", "jnx.equities.pts.ouch.v1.11.text", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.time_in_force = ProtoField.new("Time In Force", "jnx.equities.pts.ouch.v1.11.timeinforce", ftypes.UINT32)
jnx_equities_pts_ouch_v1_11.fields.timestamp = ProtoField.new("Timestamp", "jnx.equities.pts.ouch.v1.11.timestamp", ftypes.UINT64)
jnx_equities_pts_ouch_v1_11.fields.unsequenced_data_packet = ProtoField.new("Unsequenced Data Packet", "jnx.equities.pts.ouch.v1.11.unsequenceddatapacket", ftypes.STRING)
jnx_equities_pts_ouch_v1_11.fields.username = ProtoField.new("Username", "jnx.equities.pts.ouch.v1.11.username", ftypes.STRING)

-----------------------------------------------------------------------
-- Declare Dissection Options
-----------------------------------------------------------------------

-- Jnx Equities Pts Ouch 1.11 Element Dissection Options
show.cancel_order_message = true
show.debug_packet = true
show.enter_order_message = true
show.login_accepted_packet = true
show.login_rejected_packet = true
show.login_request_packet = true
show.message = true
show.order_accepted_message = true
show.order_aiq_canceled_message = true
show.order_canceled_message = true
show.order_executed_message = true
show.order_rejected_message = true
show.order_replaced_message = true
show.packet = true
show.packet_header = true
show.replace_order_message = true
show.sequenced_data_packet = true
show.soup_bin_tcp_packet = true
show.system_event_message = true
show.unsequenced_data_packet = true
show.data = false
show.payload = false

-- Register Jnx Equities Pts Ouch 1.11 Show Options
jnx_equities_pts_ouch_v1_11.prefs.show_cancel_order_message = Pref.bool("Show Cancel Order Message", show.cancel_order_message, "Parse and add Cancel Order Message to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_debug_packet = Pref.bool("Show Debug Packet", show.debug_packet, "Parse and add Debug Packet to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_enter_order_message = Pref.bool("Show Enter Order Message", show.enter_order_message, "Parse and add Enter Order Message to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_login_accepted_packet = Pref.bool("Show Login Accepted Packet", show.login_accepted_packet, "Parse and add Login Accepted Packet to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_login_rejected_packet = Pref.bool("Show Login Rejected Packet", show.login_rejected_packet, "Parse and add Login Rejected Packet to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_login_request_packet = Pref.bool("Show Login Request Packet", show.login_request_packet, "Parse and add Login Request Packet to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_message = Pref.bool("Show Message", show.message, "Parse and add Message to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_order_accepted_message = Pref.bool("Show Order Accepted Message", show.order_accepted_message, "Parse and add Order Accepted Message to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_order_aiq_canceled_message = Pref.bool("Show Order Aiq Canceled Message", show.order_aiq_canceled_message, "Parse and add Order Aiq Canceled Message to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_order_canceled_message = Pref.bool("Show Order Canceled Message", show.order_canceled_message, "Parse and add Order Canceled Message to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_order_executed_message = Pref.bool("Show Order Executed Message", show.order_executed_message, "Parse and add Order Executed Message to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_order_rejected_message = Pref.bool("Show Order Rejected Message", show.order_rejected_message, "Parse and add Order Rejected Message to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_order_replaced_message = Pref.bool("Show Order Replaced Message", show.order_replaced_message, "Parse and add Order Replaced Message to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_packet = Pref.bool("Show Packet", show.packet, "Parse and add Packet to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_packet_header = Pref.bool("Show Packet Header", show.packet_header, "Parse and add Packet Header to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_replace_order_message = Pref.bool("Show Replace Order Message", show.replace_order_message, "Parse and add Replace Order Message to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_sequenced_data_packet = Pref.bool("Show Sequenced Data Packet", show.sequenced_data_packet, "Parse and add Sequenced Data Packet to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_soup_bin_tcp_packet = Pref.bool("Show Soup Bin Tcp Packet", show.soup_bin_tcp_packet, "Parse and add Soup Bin Tcp Packet to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_system_event_message = Pref.bool("Show System Event Message", show.system_event_message, "Parse and add System Event Message to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_unsequenced_data_packet = Pref.bool("Show Unsequenced Data Packet", show.unsequenced_data_packet, "Parse and add Unsequenced Data Packet to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_data = Pref.bool("Show Data", show.data, "Parse and add Data to protocol tree")
jnx_equities_pts_ouch_v1_11.prefs.show_payload = Pref.bool("Show Payload", show.payload, "Parse and add Payload to protocol tree")

-- Handle changed preferences
function jnx_equities_pts_ouch_v1_11.prefs_changed()
  local changed = false

  -- Check if show options have changed
  if show.cancel_order_message ~= jnx_equities_pts_ouch_v1_11.prefs.show_cancel_order_message then
    show.cancel_order_message = jnx_equities_pts_ouch_v1_11.prefs.show_cancel_order_message
    changed = true
  end
  if show.debug_packet ~= jnx_equities_pts_ouch_v1_11.prefs.show_debug_packet then
    show.debug_packet = jnx_equities_pts_ouch_v1_11.prefs.show_debug_packet
    changed = true
  end
  if show.enter_order_message ~= jnx_equities_pts_ouch_v1_11.prefs.show_enter_order_message then
    show.enter_order_message = jnx_equities_pts_ouch_v1_11.prefs.show_enter_order_message
    changed = true
  end
  if show.login_accepted_packet ~= jnx_equities_pts_ouch_v1_11.prefs.show_login_accepted_packet then
    show.login_accepted_packet = jnx_equities_pts_ouch_v1_11.prefs.show_login_accepted_packet
    changed = true
  end
  if show.login_rejected_packet ~= jnx_equities_pts_ouch_v1_11.prefs.show_login_rejected_packet then
    show.login_rejected_packet = jnx_equities_pts_ouch_v1_11.prefs.show_login_rejected_packet
    changed = true
  end
  if show.login_request_packet ~= jnx_equities_pts_ouch_v1_11.prefs.show_login_request_packet then
    show.login_request_packet = jnx_equities_pts_ouch_v1_11.prefs.show_login_request_packet
    changed = true
  end
  if show.message ~= jnx_equities_pts_ouch_v1_11.prefs.show_message then
    show.message = jnx_equities_pts_ouch_v1_11.prefs.show_message
    changed = true
  end
  if show.order_accepted_message ~= jnx_equities_pts_ouch_v1_11.prefs.show_order_accepted_message then
    show.order_accepted_message = jnx_equities_pts_ouch_v1_11.prefs.show_order_accepted_message
    changed = true
  end
  if show.order_aiq_canceled_message ~= jnx_equities_pts_ouch_v1_11.prefs.show_order_aiq_canceled_message then
    show.order_aiq_canceled_message = jnx_equities_pts_ouch_v1_11.prefs.show_order_aiq_canceled_message
    changed = true
  end
  if show.order_canceled_message ~= jnx_equities_pts_ouch_v1_11.prefs.show_order_canceled_message then
    show.order_canceled_message = jnx_equities_pts_ouch_v1_11.prefs.show_order_canceled_message
    changed = true
  end
  if show.order_executed_message ~= jnx_equities_pts_ouch_v1_11.prefs.show_order_executed_message then
    show.order_executed_message = jnx_equities_pts_ouch_v1_11.prefs.show_order_executed_message
    changed = true
  end
  if show.order_rejected_message ~= jnx_equities_pts_ouch_v1_11.prefs.show_order_rejected_message then
    show.order_rejected_message = jnx_equities_pts_ouch_v1_11.prefs.show_order_rejected_message
    changed = true
  end
  if show.order_replaced_message ~= jnx_equities_pts_ouch_v1_11.prefs.show_order_replaced_message then
    show.order_replaced_message = jnx_equities_pts_ouch_v1_11.prefs.show_order_replaced_message
    changed = true
  end
  if show.packet ~= jnx_equities_pts_ouch_v1_11.prefs.show_packet then
    show.packet = jnx_equities_pts_ouch_v1_11.prefs.show_packet
    changed = true
  end
  if show.packet_header ~= jnx_equities_pts_ouch_v1_11.prefs.show_packet_header then
    show.packet_header = jnx_equities_pts_ouch_v1_11.prefs.show_packet_header
    changed = true
  end
  if show.replace_order_message ~= jnx_equities_pts_ouch_v1_11.prefs.show_replace_order_message then
    show.replace_order_message = jnx_equities_pts_ouch_v1_11.prefs.show_replace_order_message
    changed = true
  end
  if show.sequenced_data_packet ~= jnx_equities_pts_ouch_v1_11.prefs.show_sequenced_data_packet then
    show.sequenced_data_packet = jnx_equities_pts_ouch_v1_11.prefs.show_sequenced_data_packet
    changed = true
  end
  if show.soup_bin_tcp_packet ~= jnx_equities_pts_ouch_v1_11.prefs.show_soup_bin_tcp_packet then
    show.soup_bin_tcp_packet = jnx_equities_pts_ouch_v1_11.prefs.show_soup_bin_tcp_packet
    changed = true
  end
  if show.system_event_message ~= jnx_equities_pts_ouch_v1_11.prefs.show_system_event_message then
    show.system_event_message = jnx_equities_pts_ouch_v1_11.prefs.show_system_event_message
    changed = true
  end
  if show.unsequenced_data_packet ~= jnx_equities_pts_ouch_v1_11.prefs.show_unsequenced_data_packet then
    show.unsequenced_data_packet = jnx_equities_pts_ouch_v1_11.prefs.show_unsequenced_data_packet
    changed = true
  end
  if show.data ~= jnx_equities_pts_ouch_v1_11.prefs.show_data then
    show.data = jnx_equities_pts_ouch_v1_11.prefs.show_data
    changed = true
  end
  if show.payload ~= jnx_equities_pts_ouch_v1_11.prefs.show_payload then
    show.payload = jnx_equities_pts_ouch_v1_11.prefs.show_payload
    changed = true
  end

  -- Reload on changed preference
  if changed then
    reload()
  end
end


-----------------------------------------------------------------------
-- Dissect Jnx Equities Pts Ouch 1.11
-----------------------------------------------------------------------

-- Size: Order Rejected Reason
jnx_equities_pts_ouch_v1_11_size_of.order_rejected_reason = 1

-- Display: Order Rejected Reason
jnx_equities_pts_ouch_v1_11_display.order_rejected_reason = function(value)
  if value == "H" then
    return "Order Rejected Reason: Halted (H)"
  end
  if value == "S" then
    return "Order Rejected Reason: Invalid Orderbook Identifier (S)"
  end
  if value == "X" then
    return "Order Rejected Reason: Invalid Price (X)"
  end
  if value == "Z" then
    return "Order Rejected Reason: Invalid Quantity (Z)"
  end
  if value == "N" then
    return "Order Rejected Reason: Invalid Minimum Quantity (N)"
  end
  if value == "Y" then
    return "Order Rejected Reason: Invalid Order Type (Y)"
  end
  if value == "D" then
    return "Order Rejected Reason: Invalid Display Type (D)"
  end
  if value == "V" then
    return "Order Rejected Reason: Exceeded Order Value Limit (V)"
  end
  if value == "i" then
    return "Order Rejected Reason: Short Sell Order Restriction (i)"
  end
  if value == "R" then
    return "Order Rejected Reason: Order Not Allowed (R)"
  end
  if value == "F" then
    return "Order Rejected Reason: Flow Throttled (F)"
  end
  if value == "G" then
    return "Order Rejected Reason: Invalid Margin Specification (G)"
  end
  if value == "L" then
    return "Order Rejected Reason: Mpid Not Allowed For This Port (L)"
  end
  if value == "c" then
    return "Order Rejected Reason: No Permission (c)"
  end
  if value == "O" then
    return "Order Rejected Reason: Other (O)"
  end

  return "Order Rejected Reason: Unknown("..value..")"
end

-- Dissect: Order Rejected Reason
jnx_equities_pts_ouch_v1_11_dissect.order_rejected_reason = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.order_rejected_reason
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.order_rejected_reason(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.order_rejected_reason, range, value, display)

  return offset + length, value
end

-- Size: Order Token
jnx_equities_pts_ouch_v1_11_size_of.order_token = 4

-- Display: Order Token
jnx_equities_pts_ouch_v1_11_display.order_token = function(value)
  return "Order Token: "..value
end

-- Dissect: Order Token
jnx_equities_pts_ouch_v1_11_dissect.order_token = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.order_token
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.order_token(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.order_token, range, value, display)

  return offset + length, value
end

-- Size: Timestamp
jnx_equities_pts_ouch_v1_11_size_of.timestamp = 8

-- Display: Timestamp
jnx_equities_pts_ouch_v1_11_display.timestamp = function(value)
  return "Timestamp: "..value
end

-- Dissect: Timestamp
jnx_equities_pts_ouch_v1_11_dissect.timestamp = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.timestamp
  local range = buffer(offset, length)
  local value = range:uint64()
  local display = jnx_equities_pts_ouch_v1_11_display.timestamp(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.timestamp, range, value, display)

  return offset + length, value
end

-- Calculate size of: Order Rejected Message
jnx_equities_pts_ouch_v1_11_size_of.order_rejected_message = function(buffer, offset)
  local index = 0

  index = index + jnx_equities_pts_ouch_v1_11_size_of.timestamp

  index = index + jnx_equities_pts_ouch_v1_11_size_of.order_token

  index = index + jnx_equities_pts_ouch_v1_11_size_of.order_rejected_reason

  return index
end

-- Display: Order Rejected Message
jnx_equities_pts_ouch_v1_11_display.order_rejected_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Rejected Message
jnx_equities_pts_ouch_v1_11_dissect.order_rejected_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 8 Byte Unsigned Fixed Width Integer
  index, timestamp = jnx_equities_pts_ouch_v1_11_dissect.timestamp(buffer, index, packet, parent)

  -- Order Token: 4 Byte Ascii String
  index, order_token = jnx_equities_pts_ouch_v1_11_dissect.order_token(buffer, index, packet, parent)

  -- Order Rejected Reason: 1 Byte Ascii String Enum with 15 values
  index, order_rejected_reason = jnx_equities_pts_ouch_v1_11_dissect.order_rejected_reason(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Rejected Message
jnx_equities_pts_ouch_v1_11_dissect.order_rejected_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_rejected_message then
    local length = jnx_equities_pts_ouch_v1_11_size_of.order_rejected_message(buffer, offset)
    local range = buffer(offset, length)
    local display = jnx_equities_pts_ouch_v1_11_display.order_rejected_message(buffer, packet, parent)
    parent = parent:add(jnx_equities_pts_ouch_v1_11.fields.order_rejected_message, range, display)
  end

  return jnx_equities_pts_ouch_v1_11_dissect.order_rejected_message_fields(buffer, offset, packet, parent)
end

-- Size: Match Number
jnx_equities_pts_ouch_v1_11_size_of.match_number = 8

-- Display: Match Number
jnx_equities_pts_ouch_v1_11_display.match_number = function(value)
  return "Match Number: "..value
end

-- Dissect: Match Number
jnx_equities_pts_ouch_v1_11_dissect.match_number = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.match_number
  local range = buffer(offset, length)
  local value = range:uint64()
  local display = jnx_equities_pts_ouch_v1_11_display.match_number(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.match_number, range, value, display)

  return offset + length, value
end

-- Size: Liquidity Indicator
jnx_equities_pts_ouch_v1_11_size_of.liquidity_indicator = 1

-- Display: Liquidity Indicator
jnx_equities_pts_ouch_v1_11_display.liquidity_indicator = function(value)
  if value == "A" then
    return "Liquidity Indicator: Added (A)"
  end
  if value == "R" then
    return "Liquidity Indicator: Removed (R)"
  end

  return "Liquidity Indicator: Unknown("..value..")"
end

-- Dissect: Liquidity Indicator
jnx_equities_pts_ouch_v1_11_dissect.liquidity_indicator = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.liquidity_indicator
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.liquidity_indicator(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.liquidity_indicator, range, value, display)

  return offset + length, value
end

-- Size: Execution Price
jnx_equities_pts_ouch_v1_11_size_of.execution_price = 4

-- Display: Execution Price
jnx_equities_pts_ouch_v1_11_display.execution_price = function(value)
  return "Execution Price: "..value
end

-- Dissect: Execution Price
jnx_equities_pts_ouch_v1_11_dissect.execution_price = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.execution_price
  local range = buffer(offset, length)
  local value = range:uint()
  local display = jnx_equities_pts_ouch_v1_11_display.execution_price(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.execution_price, range, value, display)

  return offset + length, value
end

-- Size: Executed Quantity
jnx_equities_pts_ouch_v1_11_size_of.executed_quantity = 4

-- Display: Executed Quantity
jnx_equities_pts_ouch_v1_11_display.executed_quantity = function(value)
  return "Executed Quantity: "..value
end

-- Dissect: Executed Quantity
jnx_equities_pts_ouch_v1_11_dissect.executed_quantity = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.executed_quantity
  local range = buffer(offset, length)
  local value = range:uint()
  local display = jnx_equities_pts_ouch_v1_11_display.executed_quantity(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.executed_quantity, range, value, display)

  return offset + length, value
end

-- Calculate size of: Order Executed Message
jnx_equities_pts_ouch_v1_11_size_of.order_executed_message = function(buffer, offset)
  local index = 0

  index = index + jnx_equities_pts_ouch_v1_11_size_of.timestamp

  index = index + jnx_equities_pts_ouch_v1_11_size_of.order_token

  index = index + jnx_equities_pts_ouch_v1_11_size_of.executed_quantity

  index = index + jnx_equities_pts_ouch_v1_11_size_of.execution_price

  index = index + jnx_equities_pts_ouch_v1_11_size_of.liquidity_indicator

  index = index + jnx_equities_pts_ouch_v1_11_size_of.match_number

  return index
end

-- Display: Order Executed Message
jnx_equities_pts_ouch_v1_11_display.order_executed_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Executed Message
jnx_equities_pts_ouch_v1_11_dissect.order_executed_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 8 Byte Unsigned Fixed Width Integer
  index, timestamp = jnx_equities_pts_ouch_v1_11_dissect.timestamp(buffer, index, packet, parent)

  -- Order Token: 4 Byte Ascii String
  index, order_token = jnx_equities_pts_ouch_v1_11_dissect.order_token(buffer, index, packet, parent)

  -- Executed Quantity: 4 Byte Unsigned Fixed Width Integer
  index, executed_quantity = jnx_equities_pts_ouch_v1_11_dissect.executed_quantity(buffer, index, packet, parent)

  -- Execution Price: 4 Byte Unsigned Fixed Width Integer
  index, execution_price = jnx_equities_pts_ouch_v1_11_dissect.execution_price(buffer, index, packet, parent)

  -- Liquidity Indicator: 1 Byte Ascii String Enum with 2 values
  index, liquidity_indicator = jnx_equities_pts_ouch_v1_11_dissect.liquidity_indicator(buffer, index, packet, parent)

  -- Match Number: 8 Byte Unsigned Fixed Width Integer
  index, match_number = jnx_equities_pts_ouch_v1_11_dissect.match_number(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Executed Message
jnx_equities_pts_ouch_v1_11_dissect.order_executed_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_executed_message then
    local length = jnx_equities_pts_ouch_v1_11_size_of.order_executed_message(buffer, offset)
    local range = buffer(offset, length)
    local display = jnx_equities_pts_ouch_v1_11_display.order_executed_message(buffer, packet, parent)
    parent = parent:add(jnx_equities_pts_ouch_v1_11.fields.order_executed_message, range, display)
  end

  return jnx_equities_pts_ouch_v1_11_dissect.order_executed_message_fields(buffer, offset, packet, parent)
end

-- Size: Quantity Prevented From Trading
jnx_equities_pts_ouch_v1_11_size_of.quantity_prevented_from_trading = 4

-- Display: Quantity Prevented From Trading
jnx_equities_pts_ouch_v1_11_display.quantity_prevented_from_trading = function(value)
  return "Quantity Prevented From Trading: "..value
end

-- Dissect: Quantity Prevented From Trading
jnx_equities_pts_ouch_v1_11_dissect.quantity_prevented_from_trading = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.quantity_prevented_from_trading
  local range = buffer(offset, length)
  local value = range:uint()
  local display = jnx_equities_pts_ouch_v1_11_display.quantity_prevented_from_trading(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.quantity_prevented_from_trading, range, value, display)

  return offset + length, value
end

-- Size: Order Canceled Reason
jnx_equities_pts_ouch_v1_11_size_of.order_canceled_reason = 1

-- Display: Order Canceled Reason
jnx_equities_pts_ouch_v1_11_display.order_canceled_reason = function(value)
  if value == "U" then
    return "Order Canceled Reason: User Requested Cancel (U)"
  end
  if value == "L" then
    return "Order Canceled Reason: User Logged Off (L)"
  end
  if value == "S" then
    return "Order Canceled Reason: Supervisory Terminal Manual Cancel (S)"
  end
  if value == "I" then
    return "Order Canceled Reason: Immediate Or Cancel Order (I)"
  end
  if value == "M" then
    return "Order Canceled Reason: Order Expired (M)"
  end
  if value == "X" then
    return "Order Canceled Reason: Invalid Price (X)"
  end
  if value == "Z" then
    return "Order Canceled Reason: Invalid Quantity (Z)"
  end
  if value == "N" then
    return "Order Canceled Reason: Invalid Minimum Quantity (N)"
  end
  if value == "Y" then
    return "Order Canceled Reason: Invalid Order Type (Y)"
  end
  if value == "D" then
    return "Order Canceled Reason: Invalid Display Type (D)"
  end
  if value == "V" then
    return "Order Canceled Reason: Exceeded Order Value Limit (V)"
  end
  if value == "i" then
    return "Order Canceled Reason: Order Restriction (i)"
  end
  if value == "R" then
    return "Order Canceled Reason: Not Allowed (R)"
  end
  if value == "F" then
    return "Order Canceled Reason: Throttled (F)"
  end
  if value == "G" then
    return "Order Canceled Reason: Margin Restriction (G)"
  end
  if value == "O" then
    return "Order Canceled Reason: Other (O)"
  end

  return "Order Canceled Reason: Unknown("..value..")"
end

-- Dissect: Order Canceled Reason
jnx_equities_pts_ouch_v1_11_dissect.order_canceled_reason = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.order_canceled_reason
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.order_canceled_reason(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.order_canceled_reason, range, value, display)

  return offset + length, value
end

-- Size: Decrement Quantity
jnx_equities_pts_ouch_v1_11_size_of.decrement_quantity = 4

-- Display: Decrement Quantity
jnx_equities_pts_ouch_v1_11_display.decrement_quantity = function(value)
  return "Decrement Quantity: "..value
end

-- Dissect: Decrement Quantity
jnx_equities_pts_ouch_v1_11_dissect.decrement_quantity = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.decrement_quantity
  local range = buffer(offset, length)
  local value = range:uint()
  local display = jnx_equities_pts_ouch_v1_11_display.decrement_quantity(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.decrement_quantity, range, value, display)

  return offset + length, value
end

-- Calculate size of: Order Aiq Canceled Message
jnx_equities_pts_ouch_v1_11_size_of.order_aiq_canceled_message = function(buffer, offset)
  local index = 0

  index = index + jnx_equities_pts_ouch_v1_11_size_of.timestamp

  index = index + jnx_equities_pts_ouch_v1_11_size_of.order_token

  index = index + jnx_equities_pts_ouch_v1_11_size_of.decrement_quantity

  index = index + jnx_equities_pts_ouch_v1_11_size_of.order_canceled_reason

  index = index + jnx_equities_pts_ouch_v1_11_size_of.quantity_prevented_from_trading

  index = index + jnx_equities_pts_ouch_v1_11_size_of.execution_price

  index = index + jnx_equities_pts_ouch_v1_11_size_of.liquidity_indicator

  return index
end

-- Display: Order Aiq Canceled Message
jnx_equities_pts_ouch_v1_11_display.order_aiq_canceled_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Aiq Canceled Message
jnx_equities_pts_ouch_v1_11_dissect.order_aiq_canceled_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 8 Byte Unsigned Fixed Width Integer
  index, timestamp = jnx_equities_pts_ouch_v1_11_dissect.timestamp(buffer, index, packet, parent)

  -- Order Token: 4 Byte Ascii String
  index, order_token = jnx_equities_pts_ouch_v1_11_dissect.order_token(buffer, index, packet, parent)

  -- Decrement Quantity: 4 Byte Unsigned Fixed Width Integer
  index, decrement_quantity = jnx_equities_pts_ouch_v1_11_dissect.decrement_quantity(buffer, index, packet, parent)

  -- Order Canceled Reason: 1 Byte Ascii String Enum with 16 values
  index, order_canceled_reason = jnx_equities_pts_ouch_v1_11_dissect.order_canceled_reason(buffer, index, packet, parent)

  -- Quantity Prevented From Trading: 4 Byte Unsigned Fixed Width Integer
  index, quantity_prevented_from_trading = jnx_equities_pts_ouch_v1_11_dissect.quantity_prevented_from_trading(buffer, index, packet, parent)

  -- Execution Price: 4 Byte Unsigned Fixed Width Integer
  index, execution_price = jnx_equities_pts_ouch_v1_11_dissect.execution_price(buffer, index, packet, parent)

  -- Liquidity Indicator: 1 Byte Ascii String Enum with 2 values
  index, liquidity_indicator = jnx_equities_pts_ouch_v1_11_dissect.liquidity_indicator(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Aiq Canceled Message
jnx_equities_pts_ouch_v1_11_dissect.order_aiq_canceled_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_aiq_canceled_message then
    local length = jnx_equities_pts_ouch_v1_11_size_of.order_aiq_canceled_message(buffer, offset)
    local range = buffer(offset, length)
    local display = jnx_equities_pts_ouch_v1_11_display.order_aiq_canceled_message(buffer, packet, parent)
    parent = parent:add(jnx_equities_pts_ouch_v1_11.fields.order_aiq_canceled_message, range, display)
  end

  return jnx_equities_pts_ouch_v1_11_dissect.order_aiq_canceled_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Order Canceled Message
jnx_equities_pts_ouch_v1_11_size_of.order_canceled_message = function(buffer, offset)
  local index = 0

  index = index + jnx_equities_pts_ouch_v1_11_size_of.timestamp

  index = index + jnx_equities_pts_ouch_v1_11_size_of.order_token

  index = index + jnx_equities_pts_ouch_v1_11_size_of.decrement_quantity

  index = index + jnx_equities_pts_ouch_v1_11_size_of.order_canceled_reason

  return index
end

-- Display: Order Canceled Message
jnx_equities_pts_ouch_v1_11_display.order_canceled_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Canceled Message
jnx_equities_pts_ouch_v1_11_dissect.order_canceled_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 8 Byte Unsigned Fixed Width Integer
  index, timestamp = jnx_equities_pts_ouch_v1_11_dissect.timestamp(buffer, index, packet, parent)

  -- Order Token: 4 Byte Ascii String
  index, order_token = jnx_equities_pts_ouch_v1_11_dissect.order_token(buffer, index, packet, parent)

  -- Decrement Quantity: 4 Byte Unsigned Fixed Width Integer
  index, decrement_quantity = jnx_equities_pts_ouch_v1_11_dissect.decrement_quantity(buffer, index, packet, parent)

  -- Order Canceled Reason: 1 Byte Ascii String Enum with 16 values
  index, order_canceled_reason = jnx_equities_pts_ouch_v1_11_dissect.order_canceled_reason(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Canceled Message
jnx_equities_pts_ouch_v1_11_dissect.order_canceled_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_canceled_message then
    local length = jnx_equities_pts_ouch_v1_11_size_of.order_canceled_message(buffer, offset)
    local range = buffer(offset, length)
    local display = jnx_equities_pts_ouch_v1_11_display.order_canceled_message(buffer, packet, parent)
    parent = parent:add(jnx_equities_pts_ouch_v1_11.fields.order_canceled_message, range, display)
  end

  return jnx_equities_pts_ouch_v1_11_dissect.order_canceled_message_fields(buffer, offset, packet, parent)
end

-- Size: Previous Order Token
jnx_equities_pts_ouch_v1_11_size_of.previous_order_token = 4

-- Display: Previous Order Token
jnx_equities_pts_ouch_v1_11_display.previous_order_token = function(value)
  return "Previous Order Token: "..value
end

-- Dissect: Previous Order Token
jnx_equities_pts_ouch_v1_11_dissect.previous_order_token = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.previous_order_token
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.previous_order_token(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.previous_order_token, range, value, display)

  return offset + length, value
end

-- Size: Order State
jnx_equities_pts_ouch_v1_11_size_of.order_state = 1

-- Display: Order State
jnx_equities_pts_ouch_v1_11_display.order_state = function(value)
  if value == "L" then
    return "Order State: Live (L)"
  end
  if value == "D" then
    return "Order State: Dead (D)"
  end

  return "Order State: Unknown("..value..")"
end

-- Dissect: Order State
jnx_equities_pts_ouch_v1_11_dissect.order_state = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.order_state
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.order_state(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.order_state, range, value, display)

  return offset + length, value
end

-- Size: Minimum Quantity
jnx_equities_pts_ouch_v1_11_size_of.minimum_quantity = 4

-- Display: Minimum Quantity
jnx_equities_pts_ouch_v1_11_display.minimum_quantity = function(value)
  return "Minimum Quantity: "..value
end

-- Dissect: Minimum Quantity
jnx_equities_pts_ouch_v1_11_dissect.minimum_quantity = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.minimum_quantity
  local range = buffer(offset, length)
  local value = range:uint()
  local display = jnx_equities_pts_ouch_v1_11_display.minimum_quantity(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.minimum_quantity, range, value, display)

  return offset + length, value
end

-- Size: Order Number
jnx_equities_pts_ouch_v1_11_size_of.order_number = 8

-- Display: Order Number
jnx_equities_pts_ouch_v1_11_display.order_number = function(value)
  return "Order Number: "..value
end

-- Dissect: Order Number
jnx_equities_pts_ouch_v1_11_dissect.order_number = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.order_number
  local range = buffer(offset, length)
  local value = range:uint64()
  local display = jnx_equities_pts_ouch_v1_11_display.order_number(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.order_number, range, value, display)

  return offset + length, value
end

-- Size: Display
jnx_equities_pts_ouch_v1_11_size_of.display = 1

-- Display: Display
jnx_equities_pts_ouch_v1_11_display.display = function(value)
  if value == "P" then
    return "Display: Postonly (P)"
  end

  return "Display: Unknown("..value..")"
end

-- Dissect: Display
jnx_equities_pts_ouch_v1_11_dissect.display = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.display
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.display(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.display, range, value, display)

  return offset + length, value
end

-- Size: Time In Force
jnx_equities_pts_ouch_v1_11_size_of.time_in_force = 4

-- Display: Time In Force
jnx_equities_pts_ouch_v1_11_display.time_in_force = function(value)
  if value == 0 then
    return "Time In Force: Immediate (0)"
  end
  if value == 99999 then
    return "Time In Force: Day (99999)"
  end

  return "Time In Force: Unknown("..value..")"
end

-- Dissect: Time In Force
jnx_equities_pts_ouch_v1_11_dissect.time_in_force = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.time_in_force
  local range = buffer(offset, length)
  local value = range:uint()
  local display = jnx_equities_pts_ouch_v1_11_display.time_in_force(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.time_in_force, range, value, display)

  return offset + length, value
end

-- Size: Price
jnx_equities_pts_ouch_v1_11_size_of.price = 4

-- Display: Price
jnx_equities_pts_ouch_v1_11_display.price = function(value)
  return "Price: "..value
end

-- Dissect: Price
jnx_equities_pts_ouch_v1_11_dissect.price = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.price
  local range = buffer(offset, length)
  local value = range:uint()
  local display = jnx_equities_pts_ouch_v1_11_display.price(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.price, range, value, display)

  return offset + length, value
end

-- Size: Group
jnx_equities_pts_ouch_v1_11_size_of.group = 4

-- Display: Group
jnx_equities_pts_ouch_v1_11_display.group = function(value)
  if value == "DAY" then
    return "Group: Daytime J Market (DAY)"
  end
  if value == "NGHT" then
    return "Group: Nighttime J Market (NGHT)"
  end
  if value == "DAYX" then
    return "Group: X Market (DAYX)"
  end
  if value == "DAYU" then
    return "Group: U Market (DAYU)"
  end

  return "Group: Unknown("..value..")"
end

-- Dissect: Group
jnx_equities_pts_ouch_v1_11_dissect.group = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.group
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.group(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.group, range, value, display)

  return offset + length, value
end

-- Size: Orderbook Id
jnx_equities_pts_ouch_v1_11_size_of.orderbook_id = 4

-- Display: Orderbook Id
jnx_equities_pts_ouch_v1_11_display.orderbook_id = function(value)
  return "Orderbook Id: "..value
end

-- Dissect: Orderbook Id
jnx_equities_pts_ouch_v1_11_dissect.orderbook_id = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.orderbook_id
  local range = buffer(offset, length)
  local value = range:uint()
  local display = jnx_equities_pts_ouch_v1_11_display.orderbook_id(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.orderbook_id, range, value, display)

  return offset + length, value
end

-- Size: Quantity
jnx_equities_pts_ouch_v1_11_size_of.quantity = 4

-- Display: Quantity
jnx_equities_pts_ouch_v1_11_display.quantity = function(value)
  return "Quantity: "..value
end

-- Dissect: Quantity
jnx_equities_pts_ouch_v1_11_dissect.quantity = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.quantity
  local range = buffer(offset, length)
  local value = range:uint()
  local display = jnx_equities_pts_ouch_v1_11_display.quantity(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.quantity, range, value, display)

  return offset + length, value
end

-- Size: Buy Sell Indicator
jnx_equities_pts_ouch_v1_11_size_of.buy_sell_indicator = 1

-- Display: Buy Sell Indicator
jnx_equities_pts_ouch_v1_11_display.buy_sell_indicator = function(value)
  if value == "B" then
    return "Buy Sell Indicator: Buy (B)"
  end
  if value == "S" then
    return "Buy Sell Indicator: Sell (S)"
  end
  if value == "T" then
    return "Buy Sell Indicator: Sell Short (T)"
  end
  if value == "E" then
    return "Buy Sell Indicator: Sell Short Exempt (E)"
  end

  return "Buy Sell Indicator: Unknown("..value..")"
end

-- Dissect: Buy Sell Indicator
jnx_equities_pts_ouch_v1_11_dissect.buy_sell_indicator = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.buy_sell_indicator
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.buy_sell_indicator(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.buy_sell_indicator, range, value, display)

  return offset + length, value
end

-- Size: Replacement Order Token
jnx_equities_pts_ouch_v1_11_size_of.replacement_order_token = 4

-- Display: Replacement Order Token
jnx_equities_pts_ouch_v1_11_display.replacement_order_token = function(value)
  return "Replacement Order Token: "..value
end

-- Dissect: Replacement Order Token
jnx_equities_pts_ouch_v1_11_dissect.replacement_order_token = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.replacement_order_token
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.replacement_order_token(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.replacement_order_token, range, value, display)

  return offset + length, value
end

-- Calculate size of: Order Replaced Message
jnx_equities_pts_ouch_v1_11_size_of.order_replaced_message = function(buffer, offset)
  local index = 0

  index = index + jnx_equities_pts_ouch_v1_11_size_of.timestamp

  index = index + jnx_equities_pts_ouch_v1_11_size_of.replacement_order_token

  index = index + jnx_equities_pts_ouch_v1_11_size_of.buy_sell_indicator

  index = index + jnx_equities_pts_ouch_v1_11_size_of.quantity

  index = index + jnx_equities_pts_ouch_v1_11_size_of.orderbook_id

  index = index + jnx_equities_pts_ouch_v1_11_size_of.group

  index = index + jnx_equities_pts_ouch_v1_11_size_of.price

  index = index + jnx_equities_pts_ouch_v1_11_size_of.time_in_force

  index = index + jnx_equities_pts_ouch_v1_11_size_of.display

  index = index + jnx_equities_pts_ouch_v1_11_size_of.order_number

  index = index + jnx_equities_pts_ouch_v1_11_size_of.minimum_quantity

  index = index + jnx_equities_pts_ouch_v1_11_size_of.order_state

  index = index + jnx_equities_pts_ouch_v1_11_size_of.previous_order_token

  return index
end

-- Display: Order Replaced Message
jnx_equities_pts_ouch_v1_11_display.order_replaced_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Replaced Message
jnx_equities_pts_ouch_v1_11_dissect.order_replaced_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 8 Byte Unsigned Fixed Width Integer
  index, timestamp = jnx_equities_pts_ouch_v1_11_dissect.timestamp(buffer, index, packet, parent)

  -- Replacement Order Token: 4 Byte Ascii String
  index, replacement_order_token = jnx_equities_pts_ouch_v1_11_dissect.replacement_order_token(buffer, index, packet, parent)

  -- Buy Sell Indicator: 1 Byte Ascii String Enum with 4 values
  index, buy_sell_indicator = jnx_equities_pts_ouch_v1_11_dissect.buy_sell_indicator(buffer, index, packet, parent)

  -- Quantity: 4 Byte Unsigned Fixed Width Integer
  index, quantity = jnx_equities_pts_ouch_v1_11_dissect.quantity(buffer, index, packet, parent)

  -- Orderbook Id: 4 Byte Unsigned Fixed Width Integer
  index, orderbook_id = jnx_equities_pts_ouch_v1_11_dissect.orderbook_id(buffer, index, packet, parent)

  -- Group: 4 Byte Ascii String Enum with 4 values
  index, group = jnx_equities_pts_ouch_v1_11_dissect.group(buffer, index, packet, parent)

  -- Price: 4 Byte Unsigned Fixed Width Integer
  index, price = jnx_equities_pts_ouch_v1_11_dissect.price(buffer, index, packet, parent)

  -- Time In Force: 4 Byte Unsigned Fixed Width Integer Enum with 2 values
  index, time_in_force = jnx_equities_pts_ouch_v1_11_dissect.time_in_force(buffer, index, packet, parent)

  -- Display: 1 Byte Ascii String Enum with 1 values
  index, display = jnx_equities_pts_ouch_v1_11_dissect.display(buffer, index, packet, parent)

  -- Order Number: 8 Byte Unsigned Fixed Width Integer
  index, order_number = jnx_equities_pts_ouch_v1_11_dissect.order_number(buffer, index, packet, parent)

  -- Minimum Quantity: 4 Byte Unsigned Fixed Width Integer
  index, minimum_quantity = jnx_equities_pts_ouch_v1_11_dissect.minimum_quantity(buffer, index, packet, parent)

  -- Order State: 1 Byte Ascii String Enum with 2 values
  index, order_state = jnx_equities_pts_ouch_v1_11_dissect.order_state(buffer, index, packet, parent)

  -- Previous Order Token: 4 Byte Ascii String
  index, previous_order_token = jnx_equities_pts_ouch_v1_11_dissect.previous_order_token(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Replaced Message
jnx_equities_pts_ouch_v1_11_dissect.order_replaced_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_replaced_message then
    local length = jnx_equities_pts_ouch_v1_11_size_of.order_replaced_message(buffer, offset)
    local range = buffer(offset, length)
    local display = jnx_equities_pts_ouch_v1_11_display.order_replaced_message(buffer, packet, parent)
    parent = parent:add(jnx_equities_pts_ouch_v1_11.fields.order_replaced_message, range, display)
  end

  return jnx_equities_pts_ouch_v1_11_dissect.order_replaced_message_fields(buffer, offset, packet, parent)
end

-- Size: Cash Margin Type
jnx_equities_pts_ouch_v1_11_size_of.cash_margin_type = 1

-- Display: Cash Margin Type
jnx_equities_pts_ouch_v1_11_display.cash_margin_type = function(value)
  if value == "1" then
    return "Cash Margin Type: Cash (1)"
  end
  if value == "2" then
    return "Cash Margin Type: Margin Open Negotiable (2)"
  end
  if value == "3" then
    return "Cash Margin Type: Margin Close Negotiable (3)"
  end
  if value == "4" then
    return "Cash Margin Type: Margin Open Standardized (4)"
  end
  if value == "5" then
    return "Cash Margin Type: Margin Close Standardized (5)"
  end

  return "Cash Margin Type: Unknown("..value..")"
end

-- Dissect: Cash Margin Type
jnx_equities_pts_ouch_v1_11_dissect.cash_margin_type = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.cash_margin_type
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.cash_margin_type(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.cash_margin_type, range, value, display)

  return offset + length, value
end

-- Size: Order Classification
jnx_equities_pts_ouch_v1_11_size_of.order_classification = 1

-- Display: Order Classification
jnx_equities_pts_ouch_v1_11_display.order_classification = function(value)
  if value == "1" then
    return "Order Classification: Non Hft (1)"
  end
  if value == "3" then
    return "Order Classification: Hft Market Making Strategy (3)"
  end
  if value == "4" then
    return "Order Classification: Hft Arbitrage Strategy (4)"
  end
  if value == "5" then
    return "Order Classification: Hft Directional Strategy (5)"
  end
  if value == "6" then
    return "Order Classification: Hft Other Strategy (6)"
  end

  return "Order Classification: Unknown("..value..")"
end

-- Dissect: Order Classification
jnx_equities_pts_ouch_v1_11_dissect.order_classification = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.order_classification
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.order_classification(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.order_classification, range, value, display)

  return offset + length, value
end

-- Size: Capacity
jnx_equities_pts_ouch_v1_11_size_of.capacity = 1

-- Display: Capacity
jnx_equities_pts_ouch_v1_11_display.capacity = function(value)
  if value == "A" then
    return "Capacity: Agency (A)"
  end
  if value == "P" then
    return "Capacity: Principal (P)"
  end

  return "Capacity: Unknown("..value..")"
end

-- Dissect: Capacity
jnx_equities_pts_ouch_v1_11_dissect.capacity = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.capacity
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.capacity(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.capacity, range, value, display)

  return offset + length, value
end

-- Size: Firm Id
jnx_equities_pts_ouch_v1_11_size_of.firm_id = 4

-- Display: Firm Id
jnx_equities_pts_ouch_v1_11_display.firm_id = function(value)
  return "Firm Id: "..value
end

-- Dissect: Firm Id
jnx_equities_pts_ouch_v1_11_dissect.firm_id = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.firm_id
  local range = buffer(offset, length)
  local value = range:uint()
  local display = jnx_equities_pts_ouch_v1_11_display.firm_id(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.firm_id, range, value, display)

  return offset + length, value
end

-- Size: Client Reference
jnx_equities_pts_ouch_v1_11_size_of.client_reference = 10

-- Display: Client Reference
jnx_equities_pts_ouch_v1_11_display.client_reference = function(value)
  return "Client Reference: "..value
end

-- Dissect: Client Reference
jnx_equities_pts_ouch_v1_11_dissect.client_reference = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.client_reference
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.client_reference(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.client_reference, range, value, display)

  return offset + length, value
end

-- Calculate size of: Order Accepted Message
jnx_equities_pts_ouch_v1_11_size_of.order_accepted_message = function(buffer, offset)
  local index = 0

  index = index + jnx_equities_pts_ouch_v1_11_size_of.timestamp

  index = index + jnx_equities_pts_ouch_v1_11_size_of.order_token

  index = index + jnx_equities_pts_ouch_v1_11_size_of.client_reference

  index = index + jnx_equities_pts_ouch_v1_11_size_of.buy_sell_indicator

  index = index + jnx_equities_pts_ouch_v1_11_size_of.quantity

  index = index + jnx_equities_pts_ouch_v1_11_size_of.orderbook_id

  index = index + jnx_equities_pts_ouch_v1_11_size_of.group

  index = index + jnx_equities_pts_ouch_v1_11_size_of.price

  index = index + jnx_equities_pts_ouch_v1_11_size_of.time_in_force

  index = index + jnx_equities_pts_ouch_v1_11_size_of.firm_id

  index = index + jnx_equities_pts_ouch_v1_11_size_of.display

  index = index + jnx_equities_pts_ouch_v1_11_size_of.capacity

  index = index + jnx_equities_pts_ouch_v1_11_size_of.order_number

  index = index + jnx_equities_pts_ouch_v1_11_size_of.minimum_quantity

  index = index + jnx_equities_pts_ouch_v1_11_size_of.order_state

  index = index + jnx_equities_pts_ouch_v1_11_size_of.order_classification

  index = index + jnx_equities_pts_ouch_v1_11_size_of.cash_margin_type

  return index
end

-- Display: Order Accepted Message
jnx_equities_pts_ouch_v1_11_display.order_accepted_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Order Accepted Message
jnx_equities_pts_ouch_v1_11_dissect.order_accepted_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 8 Byte Unsigned Fixed Width Integer
  index, timestamp = jnx_equities_pts_ouch_v1_11_dissect.timestamp(buffer, index, packet, parent)

  -- Order Token: 4 Byte Ascii String
  index, order_token = jnx_equities_pts_ouch_v1_11_dissect.order_token(buffer, index, packet, parent)

  -- Client Reference: 10 Byte Ascii String
  index, client_reference = jnx_equities_pts_ouch_v1_11_dissect.client_reference(buffer, index, packet, parent)

  -- Buy Sell Indicator: 1 Byte Ascii String Enum with 4 values
  index, buy_sell_indicator = jnx_equities_pts_ouch_v1_11_dissect.buy_sell_indicator(buffer, index, packet, parent)

  -- Quantity: 4 Byte Unsigned Fixed Width Integer
  index, quantity = jnx_equities_pts_ouch_v1_11_dissect.quantity(buffer, index, packet, parent)

  -- Orderbook Id: 4 Byte Unsigned Fixed Width Integer
  index, orderbook_id = jnx_equities_pts_ouch_v1_11_dissect.orderbook_id(buffer, index, packet, parent)

  -- Group: 4 Byte Ascii String Enum with 4 values
  index, group = jnx_equities_pts_ouch_v1_11_dissect.group(buffer, index, packet, parent)

  -- Price: 4 Byte Unsigned Fixed Width Integer
  index, price = jnx_equities_pts_ouch_v1_11_dissect.price(buffer, index, packet, parent)

  -- Time In Force: 4 Byte Unsigned Fixed Width Integer Enum with 2 values
  index, time_in_force = jnx_equities_pts_ouch_v1_11_dissect.time_in_force(buffer, index, packet, parent)

  -- Firm Id: 4 Byte Unsigned Fixed Width Integer
  index, firm_id = jnx_equities_pts_ouch_v1_11_dissect.firm_id(buffer, index, packet, parent)

  -- Display: 1 Byte Ascii String Enum with 1 values
  index, display = jnx_equities_pts_ouch_v1_11_dissect.display(buffer, index, packet, parent)

  -- Capacity: 1 Byte Ascii String Enum with 2 values
  index, capacity = jnx_equities_pts_ouch_v1_11_dissect.capacity(buffer, index, packet, parent)

  -- Order Number: 8 Byte Unsigned Fixed Width Integer
  index, order_number = jnx_equities_pts_ouch_v1_11_dissect.order_number(buffer, index, packet, parent)

  -- Minimum Quantity: 4 Byte Unsigned Fixed Width Integer
  index, minimum_quantity = jnx_equities_pts_ouch_v1_11_dissect.minimum_quantity(buffer, index, packet, parent)

  -- Order State: 1 Byte Ascii String Enum with 2 values
  index, order_state = jnx_equities_pts_ouch_v1_11_dissect.order_state(buffer, index, packet, parent)

  -- Order Classification: 1 Byte Ascii String Enum with 5 values
  index, order_classification = jnx_equities_pts_ouch_v1_11_dissect.order_classification(buffer, index, packet, parent)

  -- Cash Margin Type: 1 Byte Ascii String Enum with 5 values
  index, cash_margin_type = jnx_equities_pts_ouch_v1_11_dissect.cash_margin_type(buffer, index, packet, parent)

  return index
end

-- Dissect: Order Accepted Message
jnx_equities_pts_ouch_v1_11_dissect.order_accepted_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.order_accepted_message then
    local length = jnx_equities_pts_ouch_v1_11_size_of.order_accepted_message(buffer, offset)
    local range = buffer(offset, length)
    local display = jnx_equities_pts_ouch_v1_11_display.order_accepted_message(buffer, packet, parent)
    parent = parent:add(jnx_equities_pts_ouch_v1_11.fields.order_accepted_message, range, display)
  end

  return jnx_equities_pts_ouch_v1_11_dissect.order_accepted_message_fields(buffer, offset, packet, parent)
end

-- Size: System Event
jnx_equities_pts_ouch_v1_11_size_of.system_event = 1

-- Display: System Event
jnx_equities_pts_ouch_v1_11_display.system_event = function(value)
  if value == "S" then
    return "System Event: Start Of Day (S)"
  end
  if value == "E" then
    return "System Event: End Of Day (E)"
  end

  return "System Event: Unknown("..value..")"
end

-- Dissect: System Event
jnx_equities_pts_ouch_v1_11_dissect.system_event = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.system_event
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.system_event(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.system_event, range, value, display)

  return offset + length, value
end

-- Calculate size of: System Event Message
jnx_equities_pts_ouch_v1_11_size_of.system_event_message = function(buffer, offset)
  local index = 0

  index = index + jnx_equities_pts_ouch_v1_11_size_of.timestamp

  index = index + jnx_equities_pts_ouch_v1_11_size_of.system_event

  return index
end

-- Display: System Event Message
jnx_equities_pts_ouch_v1_11_display.system_event_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: System Event Message
jnx_equities_pts_ouch_v1_11_dissect.system_event_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Timestamp: 8 Byte Unsigned Fixed Width Integer
  index, timestamp = jnx_equities_pts_ouch_v1_11_dissect.timestamp(buffer, index, packet, parent)

  -- System Event: 1 Byte Ascii String Enum with 2 values
  index, system_event = jnx_equities_pts_ouch_v1_11_dissect.system_event(buffer, index, packet, parent)

  return index
end

-- Dissect: System Event Message
jnx_equities_pts_ouch_v1_11_dissect.system_event_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.system_event_message then
    local length = jnx_equities_pts_ouch_v1_11_size_of.system_event_message(buffer, offset)
    local range = buffer(offset, length)
    local display = jnx_equities_pts_ouch_v1_11_display.system_event_message(buffer, packet, parent)
    parent = parent:add(jnx_equities_pts_ouch_v1_11.fields.system_event_message, range, display)
  end

  return jnx_equities_pts_ouch_v1_11_dissect.system_event_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Cancel Order Message
jnx_equities_pts_ouch_v1_11_size_of.cancel_order_message = function(buffer, offset)
  local index = 0

  index = index + jnx_equities_pts_ouch_v1_11_size_of.order_token

  index = index + jnx_equities_pts_ouch_v1_11_size_of.quantity

  return index
end

-- Display: Cancel Order Message
jnx_equities_pts_ouch_v1_11_display.cancel_order_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Cancel Order Message
jnx_equities_pts_ouch_v1_11_dissect.cancel_order_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Order Token: 4 Byte Ascii String
  index, order_token = jnx_equities_pts_ouch_v1_11_dissect.order_token(buffer, index, packet, parent)

  -- Quantity: 4 Byte Unsigned Fixed Width Integer
  index, quantity = jnx_equities_pts_ouch_v1_11_dissect.quantity(buffer, index, packet, parent)

  return index
end

-- Dissect: Cancel Order Message
jnx_equities_pts_ouch_v1_11_dissect.cancel_order_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.cancel_order_message then
    local length = jnx_equities_pts_ouch_v1_11_size_of.cancel_order_message(buffer, offset)
    local range = buffer(offset, length)
    local display = jnx_equities_pts_ouch_v1_11_display.cancel_order_message(buffer, packet, parent)
    parent = parent:add(jnx_equities_pts_ouch_v1_11.fields.cancel_order_message, range, display)
  end

  return jnx_equities_pts_ouch_v1_11_dissect.cancel_order_message_fields(buffer, offset, packet, parent)
end

-- Size: Existing Order Token
jnx_equities_pts_ouch_v1_11_size_of.existing_order_token = 4

-- Display: Existing Order Token
jnx_equities_pts_ouch_v1_11_display.existing_order_token = function(value)
  return "Existing Order Token: "..value
end

-- Dissect: Existing Order Token
jnx_equities_pts_ouch_v1_11_dissect.existing_order_token = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.existing_order_token
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.existing_order_token(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.existing_order_token, range, value, display)

  return offset + length, value
end

-- Calculate size of: Replace Order Message
jnx_equities_pts_ouch_v1_11_size_of.replace_order_message = function(buffer, offset)
  local index = 0

  index = index + jnx_equities_pts_ouch_v1_11_size_of.existing_order_token

  index = index + jnx_equities_pts_ouch_v1_11_size_of.replacement_order_token

  index = index + jnx_equities_pts_ouch_v1_11_size_of.quantity

  index = index + jnx_equities_pts_ouch_v1_11_size_of.price

  index = index + jnx_equities_pts_ouch_v1_11_size_of.time_in_force

  index = index + jnx_equities_pts_ouch_v1_11_size_of.display

  index = index + jnx_equities_pts_ouch_v1_11_size_of.minimum_quantity

  return index
end

-- Display: Replace Order Message
jnx_equities_pts_ouch_v1_11_display.replace_order_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Replace Order Message
jnx_equities_pts_ouch_v1_11_dissect.replace_order_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Existing Order Token: 4 Byte Ascii String
  index, existing_order_token = jnx_equities_pts_ouch_v1_11_dissect.existing_order_token(buffer, index, packet, parent)

  -- Replacement Order Token: 4 Byte Ascii String
  index, replacement_order_token = jnx_equities_pts_ouch_v1_11_dissect.replacement_order_token(buffer, index, packet, parent)

  -- Quantity: 4 Byte Unsigned Fixed Width Integer
  index, quantity = jnx_equities_pts_ouch_v1_11_dissect.quantity(buffer, index, packet, parent)

  -- Price: 4 Byte Unsigned Fixed Width Integer
  index, price = jnx_equities_pts_ouch_v1_11_dissect.price(buffer, index, packet, parent)

  -- Time In Force: 4 Byte Unsigned Fixed Width Integer Enum with 2 values
  index, time_in_force = jnx_equities_pts_ouch_v1_11_dissect.time_in_force(buffer, index, packet, parent)

  -- Display: 1 Byte Ascii String Enum with 1 values
  index, display = jnx_equities_pts_ouch_v1_11_dissect.display(buffer, index, packet, parent)

  -- Minimum Quantity: 4 Byte Unsigned Fixed Width Integer
  index, minimum_quantity = jnx_equities_pts_ouch_v1_11_dissect.minimum_quantity(buffer, index, packet, parent)

  return index
end

-- Dissect: Replace Order Message
jnx_equities_pts_ouch_v1_11_dissect.replace_order_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.replace_order_message then
    local length = jnx_equities_pts_ouch_v1_11_size_of.replace_order_message(buffer, offset)
    local range = buffer(offset, length)
    local display = jnx_equities_pts_ouch_v1_11_display.replace_order_message(buffer, packet, parent)
    parent = parent:add(jnx_equities_pts_ouch_v1_11.fields.replace_order_message, range, display)
  end

  return jnx_equities_pts_ouch_v1_11_dissect.replace_order_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Enter Order Message
jnx_equities_pts_ouch_v1_11_size_of.enter_order_message = function(buffer, offset)
  local index = 0

  index = index + jnx_equities_pts_ouch_v1_11_size_of.order_token

  index = index + jnx_equities_pts_ouch_v1_11_size_of.client_reference

  index = index + jnx_equities_pts_ouch_v1_11_size_of.buy_sell_indicator

  index = index + jnx_equities_pts_ouch_v1_11_size_of.quantity

  index = index + jnx_equities_pts_ouch_v1_11_size_of.orderbook_id

  index = index + jnx_equities_pts_ouch_v1_11_size_of.group

  index = index + jnx_equities_pts_ouch_v1_11_size_of.price

  index = index + jnx_equities_pts_ouch_v1_11_size_of.time_in_force

  index = index + jnx_equities_pts_ouch_v1_11_size_of.firm_id

  index = index + jnx_equities_pts_ouch_v1_11_size_of.display

  index = index + jnx_equities_pts_ouch_v1_11_size_of.capacity

  index = index + jnx_equities_pts_ouch_v1_11_size_of.minimum_quantity

  index = index + jnx_equities_pts_ouch_v1_11_size_of.order_classification

  index = index + jnx_equities_pts_ouch_v1_11_size_of.cash_margin_type

  return index
end

-- Display: Enter Order Message
jnx_equities_pts_ouch_v1_11_display.enter_order_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Enter Order Message
jnx_equities_pts_ouch_v1_11_dissect.enter_order_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Order Token: 4 Byte Ascii String
  index, order_token = jnx_equities_pts_ouch_v1_11_dissect.order_token(buffer, index, packet, parent)

  -- Client Reference: 10 Byte Ascii String
  index, client_reference = jnx_equities_pts_ouch_v1_11_dissect.client_reference(buffer, index, packet, parent)

  -- Buy Sell Indicator: 1 Byte Ascii String Enum with 4 values
  index, buy_sell_indicator = jnx_equities_pts_ouch_v1_11_dissect.buy_sell_indicator(buffer, index, packet, parent)

  -- Quantity: 4 Byte Unsigned Fixed Width Integer
  index, quantity = jnx_equities_pts_ouch_v1_11_dissect.quantity(buffer, index, packet, parent)

  -- Orderbook Id: 4 Byte Unsigned Fixed Width Integer
  index, orderbook_id = jnx_equities_pts_ouch_v1_11_dissect.orderbook_id(buffer, index, packet, parent)

  -- Group: 4 Byte Ascii String Enum with 4 values
  index, group = jnx_equities_pts_ouch_v1_11_dissect.group(buffer, index, packet, parent)

  -- Price: 4 Byte Unsigned Fixed Width Integer
  index, price = jnx_equities_pts_ouch_v1_11_dissect.price(buffer, index, packet, parent)

  -- Time In Force: 4 Byte Unsigned Fixed Width Integer Enum with 2 values
  index, time_in_force = jnx_equities_pts_ouch_v1_11_dissect.time_in_force(buffer, index, packet, parent)

  -- Firm Id: 4 Byte Unsigned Fixed Width Integer
  index, firm_id = jnx_equities_pts_ouch_v1_11_dissect.firm_id(buffer, index, packet, parent)

  -- Display: 1 Byte Ascii String Enum with 1 values
  index, display = jnx_equities_pts_ouch_v1_11_dissect.display(buffer, index, packet, parent)

  -- Capacity: 1 Byte Ascii String Enum with 2 values
  index, capacity = jnx_equities_pts_ouch_v1_11_dissect.capacity(buffer, index, packet, parent)

  -- Minimum Quantity: 4 Byte Unsigned Fixed Width Integer
  index, minimum_quantity = jnx_equities_pts_ouch_v1_11_dissect.minimum_quantity(buffer, index, packet, parent)

  -- Order Classification: 1 Byte Ascii String Enum with 5 values
  index, order_classification = jnx_equities_pts_ouch_v1_11_dissect.order_classification(buffer, index, packet, parent)

  -- Cash Margin Type: 1 Byte Ascii String Enum with 5 values
  index, cash_margin_type = jnx_equities_pts_ouch_v1_11_dissect.cash_margin_type(buffer, index, packet, parent)

  return index
end

-- Dissect: Enter Order Message
jnx_equities_pts_ouch_v1_11_dissect.enter_order_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.enter_order_message then
    local length = jnx_equities_pts_ouch_v1_11_size_of.enter_order_message(buffer, offset)
    local range = buffer(offset, length)
    local display = jnx_equities_pts_ouch_v1_11_display.enter_order_message(buffer, packet, parent)
    parent = parent:add(jnx_equities_pts_ouch_v1_11.fields.enter_order_message, range, display)
  end

  return jnx_equities_pts_ouch_v1_11_dissect.enter_order_message_fields(buffer, offset, packet, parent)
end

-- Calculate runtime size of: Data
jnx_equities_pts_ouch_v1_11_size_of.data = function(buffer, offset, message_type)
  -- Size of Enter Order Message
  if message_type == "O" then
    return jnx_equities_pts_ouch_v1_11_size_of.enter_order_message(buffer, offset)
  end
  -- Size of Replace Order Message
  if message_type == "U" then
    return jnx_equities_pts_ouch_v1_11_size_of.replace_order_message(buffer, offset)
  end
  -- Size of Cancel Order Message
  if message_type == "X" then
    return jnx_equities_pts_ouch_v1_11_size_of.cancel_order_message(buffer, offset)
  end
  -- Size of System Event Message
  if message_type == "S" then
    return jnx_equities_pts_ouch_v1_11_size_of.system_event_message(buffer, offset)
  end
  -- Size of Order Accepted Message
  if message_type == "A" then
    return jnx_equities_pts_ouch_v1_11_size_of.order_accepted_message(buffer, offset)
  end
  -- Size of Order Replaced Message
  if message_type == "U" then
    return jnx_equities_pts_ouch_v1_11_size_of.order_replaced_message(buffer, offset)
  end
  -- Size of Order Canceled Message
  if message_type == "C" then
    return jnx_equities_pts_ouch_v1_11_size_of.order_canceled_message(buffer, offset)
  end
  -- Size of Order Aiq Canceled Message
  if message_type == "D" then
    return jnx_equities_pts_ouch_v1_11_size_of.order_aiq_canceled_message(buffer, offset)
  end
  -- Size of Order Executed Message
  if message_type == "E" then
    return jnx_equities_pts_ouch_v1_11_size_of.order_executed_message(buffer, offset)
  end
  -- Size of Order Rejected Message
  if message_type == "J" then
    return jnx_equities_pts_ouch_v1_11_size_of.order_rejected_message(buffer, offset)
  end

  return 0
end

-- Display: Data
jnx_equities_pts_ouch_v1_11_display.data = function(buffer, offset, packet, parent)
  return ""
end

-- Dissect Branches: Data
jnx_equities_pts_ouch_v1_11_dissect.data_branches = function(buffer, offset, packet, parent, message_type)
  -- Dissect Enter Order Message
  if message_type == "O" then
    return jnx_equities_pts_ouch_v1_11_dissect.enter_order_message(buffer, offset, packet, parent)
  end
  -- Dissect Replace Order Message
  if message_type == "U" then
    return jnx_equities_pts_ouch_v1_11_dissect.replace_order_message(buffer, offset, packet, parent)
  end
  -- Dissect Cancel Order Message
  if message_type == "X" then
    return jnx_equities_pts_ouch_v1_11_dissect.cancel_order_message(buffer, offset, packet, parent)
  end
  -- Dissect System Event Message
  if message_type == "S" then
    return jnx_equities_pts_ouch_v1_11_dissect.system_event_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Accepted Message
  if message_type == "A" then
    return jnx_equities_pts_ouch_v1_11_dissect.order_accepted_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Replaced Message
  if message_type == "U" then
    return jnx_equities_pts_ouch_v1_11_dissect.order_replaced_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Canceled Message
  if message_type == "C" then
    return jnx_equities_pts_ouch_v1_11_dissect.order_canceled_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Aiq Canceled Message
  if message_type == "D" then
    return jnx_equities_pts_ouch_v1_11_dissect.order_aiq_canceled_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Executed Message
  if message_type == "E" then
    return jnx_equities_pts_ouch_v1_11_dissect.order_executed_message(buffer, offset, packet, parent)
  end
  -- Dissect Order Rejected Message
  if message_type == "J" then
    return jnx_equities_pts_ouch_v1_11_dissect.order_rejected_message(buffer, offset, packet, parent)
  end

  return offset
end

-- Dissect: Data
jnx_equities_pts_ouch_v1_11_dissect.data = function(buffer, offset, packet, parent, message_type)
  if not show.data then
    return jnx_equities_pts_ouch_v1_11_dissect.data_branches(buffer, offset, packet, parent, message_type)
  end

  -- Calculate size and check that branch is not empty
  local size = jnx_equities_pts_ouch_v1_11_size_of.data(buffer, offset, message_type)
  if size == 0 then
    return offset
  end

  -- Dissect Element
  local range = buffer(offset, size)
  local display = jnx_equities_pts_ouch_v1_11_display.data(buffer, packet, parent)
  local element = parent:add(jnx_equities_pts_ouch_v1_11.fields.data, range, display)

  return jnx_equities_pts_ouch_v1_11_dissect.data_branches(buffer, offset, packet, parent, message_type)
end

-- Size: Message Type
jnx_equities_pts_ouch_v1_11_size_of.message_type = 1

-- Display: Message Type
jnx_equities_pts_ouch_v1_11_display.message_type = function(value)
  if value == "O" then
    return "Message Type: Enter Order Message (O)"
  end
  if value == "U" then
    return "Message Type: Replace Order Message (U)"
  end
  if value == "X" then
    return "Message Type: Cancel Order Message (X)"
  end
  if value == "S" then
    return "Message Type: System Event Message (S)"
  end
  if value == "A" then
    return "Message Type: Order Accepted Message (A)"
  end
  if value == "U" then
    return "Message Type: Order Replaced Message (U)"
  end
  if value == "C" then
    return "Message Type: Order Canceled Message (C)"
  end
  if value == "D" then
    return "Message Type: Order Aiq Canceled Message (D)"
  end
  if value == "E" then
    return "Message Type: Order Executed Message (E)"
  end
  if value == "J" then
    return "Message Type: Order Rejected Message (J)"
  end

  return "Message Type: Unknown("..value..")"
end

-- Dissect: Message Type
jnx_equities_pts_ouch_v1_11_dissect.message_type = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.message_type
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.message_type(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.message_type, range, value, display)

  return offset + length, value
end

-- Display: Message
jnx_equities_pts_ouch_v1_11_display.message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Message
jnx_equities_pts_ouch_v1_11_dissect.message_fields = function(buffer, offset, packet, parent, size_of_message)
  local index = offset

  -- Message Type: 1 Byte Ascii String Enum with 10 values
  index, message_type = jnx_equities_pts_ouch_v1_11_dissect.message_type(buffer, index, packet, parent)

  -- Data: Runtime Type with 10 branches
  index = jnx_equities_pts_ouch_v1_11_dissect.data(buffer, index, packet, parent, message_type)

  return index
end

-- Dissect: Message
jnx_equities_pts_ouch_v1_11_dissect.message = function(buffer, offset, packet, parent, size_of_message)
  -- Optionally add struct element to protocol tree
  if show.message then
    local range = buffer(offset, size_of_message)
    local display = jnx_equities_pts_ouch_v1_11_display.message(buffer, packet, parent)
    parent = parent:add(jnx_equities_pts_ouch_v1_11.fields.message, range, display)
  end

  jnx_equities_pts_ouch_v1_11_dissect.message_fields(buffer, offset, packet, parent, size_of_message)

  return offset + size_of_message
end

-- Display: Unsequenced Data Packet
jnx_equities_pts_ouch_v1_11_display.unsequenced_data_packet = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Unsequenced Data Packet
jnx_equities_pts_ouch_v1_11_dissect.unsequenced_data_packet_fields = function(buffer, offset, packet, parent, size_of_unsequenced_data_packet)
  local index = offset

  -- Dependency element: Packet Length
  local packet_length = buffer(offset - 3, 2):uint()

  -- Runtime Size Of: Message
  local size_of_message = packet_length - 1

  -- Message: Struct of 2 fields
  index = jnx_equities_pts_ouch_v1_11_dissect.message(buffer, index, packet, parent, size_of_message)

  return index
end

-- Dissect: Unsequenced Data Packet
jnx_equities_pts_ouch_v1_11_dissect.unsequenced_data_packet = function(buffer, offset, packet, parent)
  local index = offset

  -- Dependency element: Packet Length
  local packet_length = buffer(offset - 3, 2):uint()

  -- Parse runtime struct size
  local size_of_unsequenced_data_packet = packet_length - 1

  -- Optionally add struct element to protocol tree
  if show.unsequenced_data_packet then
    local range = buffer(offset, size_of_unsequenced_data_packet)
    local display = jnx_equities_pts_ouch_v1_11_display.unsequenced_data_packet(buffer, packet, parent)
    parent = parent:add(jnx_equities_pts_ouch_v1_11.fields.unsequenced_data_packet, range, display)
  end

  jnx_equities_pts_ouch_v1_11_dissect.unsequenced_data_packet_fields(buffer, offset, packet, parent, size_of_unsequenced_data_packet)

  return offset + size_of_unsequenced_data_packet
end

-- Size: Requested Sequence Number
jnx_equities_pts_ouch_v1_11_size_of.requested_sequence_number = 20

-- Display: Requested Sequence Number
jnx_equities_pts_ouch_v1_11_display.requested_sequence_number = function(value)
  return "Requested Sequence Number: "..value
end

-- Dissect: Requested Sequence Number
jnx_equities_pts_ouch_v1_11_dissect.requested_sequence_number = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.requested_sequence_number
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.requested_sequence_number(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.requested_sequence_number, range, value, display)

  return offset + length, value
end

-- Size: Requested Session
jnx_equities_pts_ouch_v1_11_size_of.requested_session = 10

-- Display: Requested Session
jnx_equities_pts_ouch_v1_11_display.requested_session = function(value)
  return "Requested Session: "..value
end

-- Dissect: Requested Session
jnx_equities_pts_ouch_v1_11_dissect.requested_session = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.requested_session
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.requested_session(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.requested_session, range, value, display)

  return offset + length, value
end

-- Size: Password
jnx_equities_pts_ouch_v1_11_size_of.password = 10

-- Display: Password
jnx_equities_pts_ouch_v1_11_display.password = function(value)
  return "Password: "..value
end

-- Dissect: Password
jnx_equities_pts_ouch_v1_11_dissect.password = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.password
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.password(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.password, range, value, display)

  return offset + length, value
end

-- Size: Username
jnx_equities_pts_ouch_v1_11_size_of.username = 6

-- Display: Username
jnx_equities_pts_ouch_v1_11_display.username = function(value)
  return "Username: "..value
end

-- Dissect: Username
jnx_equities_pts_ouch_v1_11_dissect.username = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.username
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.username(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.username, range, value, display)

  return offset + length, value
end

-- Calculate size of: Login Request Packet
jnx_equities_pts_ouch_v1_11_size_of.login_request_packet = function(buffer, offset)
  local index = 0

  index = index + jnx_equities_pts_ouch_v1_11_size_of.username

  index = index + jnx_equities_pts_ouch_v1_11_size_of.password

  index = index + jnx_equities_pts_ouch_v1_11_size_of.requested_session

  index = index + jnx_equities_pts_ouch_v1_11_size_of.requested_sequence_number

  return index
end

-- Display: Login Request Packet
jnx_equities_pts_ouch_v1_11_display.login_request_packet = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Login Request Packet
jnx_equities_pts_ouch_v1_11_dissect.login_request_packet_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Username: 6 Byte Ascii String
  index, username = jnx_equities_pts_ouch_v1_11_dissect.username(buffer, index, packet, parent)

  -- Password: 10 Byte Ascii String
  index, password = jnx_equities_pts_ouch_v1_11_dissect.password(buffer, index, packet, parent)

  -- Requested Session: 10 Byte Ascii String
  index, requested_session = jnx_equities_pts_ouch_v1_11_dissect.requested_session(buffer, index, packet, parent)

  -- Requested Sequence Number: 20 Byte Ascii String
  index, requested_sequence_number = jnx_equities_pts_ouch_v1_11_dissect.requested_sequence_number(buffer, index, packet, parent)

  return index
end

-- Dissect: Login Request Packet
jnx_equities_pts_ouch_v1_11_dissect.login_request_packet = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.login_request_packet then
    local length = jnx_equities_pts_ouch_v1_11_size_of.login_request_packet(buffer, offset)
    local range = buffer(offset, length)
    local display = jnx_equities_pts_ouch_v1_11_display.login_request_packet(buffer, packet, parent)
    parent = parent:add(jnx_equities_pts_ouch_v1_11.fields.login_request_packet, range, display)
  end

  return jnx_equities_pts_ouch_v1_11_dissect.login_request_packet_fields(buffer, offset, packet, parent)
end

-- Display: Sequenced Data Packet
jnx_equities_pts_ouch_v1_11_display.sequenced_data_packet = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Sequenced Data Packet
jnx_equities_pts_ouch_v1_11_dissect.sequenced_data_packet_fields = function(buffer, offset, packet, parent, size_of_sequenced_data_packet)
  local index = offset

  -- Dependency element: Packet Length
  local packet_length = buffer(offset - 3, 2):uint()

  -- Runtime Size Of: Message
  local size_of_message = packet_length - 1

  -- Message: Struct of 2 fields
  index = jnx_equities_pts_ouch_v1_11_dissect.message(buffer, index, packet, parent, size_of_message)

  return index
end

-- Dissect: Sequenced Data Packet
jnx_equities_pts_ouch_v1_11_dissect.sequenced_data_packet = function(buffer, offset, packet, parent)
  local index = offset

  -- Dependency element: Packet Length
  local packet_length = buffer(offset - 3, 2):uint()

  -- Parse runtime struct size
  local size_of_sequenced_data_packet = packet_length - 1

  -- Optionally add struct element to protocol tree
  if show.sequenced_data_packet then
    local range = buffer(offset, size_of_sequenced_data_packet)
    local display = jnx_equities_pts_ouch_v1_11_display.sequenced_data_packet(buffer, packet, parent)
    parent = parent:add(jnx_equities_pts_ouch_v1_11.fields.sequenced_data_packet, range, display)
  end

  jnx_equities_pts_ouch_v1_11_dissect.sequenced_data_packet_fields(buffer, offset, packet, parent, size_of_sequenced_data_packet)

  return offset + size_of_sequenced_data_packet
end

-- Size: Reject Reason Code
jnx_equities_pts_ouch_v1_11_size_of.reject_reason_code = 1

-- Display: Reject Reason Code
jnx_equities_pts_ouch_v1_11_display.reject_reason_code = function(value)
  return "Reject Reason Code: "..value
end

-- Dissect: Reject Reason Code
jnx_equities_pts_ouch_v1_11_dissect.reject_reason_code = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.reject_reason_code
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.reject_reason_code(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.reject_reason_code, range, value, display)

  return offset + length, value
end

-- Calculate size of: Login Rejected Packet
jnx_equities_pts_ouch_v1_11_size_of.login_rejected_packet = function(buffer, offset)
  local index = 0

  index = index + jnx_equities_pts_ouch_v1_11_size_of.reject_reason_code

  return index
end

-- Display: Login Rejected Packet
jnx_equities_pts_ouch_v1_11_display.login_rejected_packet = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Login Rejected Packet
jnx_equities_pts_ouch_v1_11_dissect.login_rejected_packet_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Reject Reason Code: 1 Byte Ascii String
  index, reject_reason_code = jnx_equities_pts_ouch_v1_11_dissect.reject_reason_code(buffer, index, packet, parent)

  return index
end

-- Dissect: Login Rejected Packet
jnx_equities_pts_ouch_v1_11_dissect.login_rejected_packet = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.login_rejected_packet then
    local length = jnx_equities_pts_ouch_v1_11_size_of.login_rejected_packet(buffer, offset)
    local range = buffer(offset, length)
    local display = jnx_equities_pts_ouch_v1_11_display.login_rejected_packet(buffer, packet, parent)
    parent = parent:add(jnx_equities_pts_ouch_v1_11.fields.login_rejected_packet, range, display)
  end

  return jnx_equities_pts_ouch_v1_11_dissect.login_rejected_packet_fields(buffer, offset, packet, parent)
end

-- Size: Sequence Number
jnx_equities_pts_ouch_v1_11_size_of.sequence_number = 20

-- Display: Sequence Number
jnx_equities_pts_ouch_v1_11_display.sequence_number = function(value)
  return "Sequence Number: "..value
end

-- Dissect: Sequence Number
jnx_equities_pts_ouch_v1_11_dissect.sequence_number = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.sequence_number
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.sequence_number(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.sequence_number, range, value, display)

  return offset + length, value
end

-- Size: Session
jnx_equities_pts_ouch_v1_11_size_of.session = 10

-- Display: Session
jnx_equities_pts_ouch_v1_11_display.session = function(value)
  return "Session: "..value
end

-- Dissect: Session
jnx_equities_pts_ouch_v1_11_dissect.session = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.session
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.session(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.session, range, value, display)

  return offset + length, value
end

-- Calculate size of: Login Accepted Packet
jnx_equities_pts_ouch_v1_11_size_of.login_accepted_packet = function(buffer, offset)
  local index = 0

  index = index + jnx_equities_pts_ouch_v1_11_size_of.session

  index = index + jnx_equities_pts_ouch_v1_11_size_of.sequence_number

  return index
end

-- Display: Login Accepted Packet
jnx_equities_pts_ouch_v1_11_display.login_accepted_packet = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Login Accepted Packet
jnx_equities_pts_ouch_v1_11_dissect.login_accepted_packet_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Session: 10 Byte Ascii String
  index, session = jnx_equities_pts_ouch_v1_11_dissect.session(buffer, index, packet, parent)

  -- Sequence Number: 20 Byte Ascii String
  index, sequence_number = jnx_equities_pts_ouch_v1_11_dissect.sequence_number(buffer, index, packet, parent)

  return index
end

-- Dissect: Login Accepted Packet
jnx_equities_pts_ouch_v1_11_dissect.login_accepted_packet = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.login_accepted_packet then
    local length = jnx_equities_pts_ouch_v1_11_size_of.login_accepted_packet(buffer, offset)
    local range = buffer(offset, length)
    local display = jnx_equities_pts_ouch_v1_11_display.login_accepted_packet(buffer, packet, parent)
    parent = parent:add(jnx_equities_pts_ouch_v1_11.fields.login_accepted_packet, range, display)
  end

  return jnx_equities_pts_ouch_v1_11_dissect.login_accepted_packet_fields(buffer, offset, packet, parent)
end

-- Size: Text
jnx_equities_pts_ouch_v1_11_size_of.text = 1

-- Display: Text
jnx_equities_pts_ouch_v1_11_display.text = function(value)
  return "Text: "..value
end

-- Dissect: Text
jnx_equities_pts_ouch_v1_11_dissect.text = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.text
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.text(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.text, range, value, display)

  return offset + length, value
end

-- Calculate size of: Debug Packet
jnx_equities_pts_ouch_v1_11_size_of.debug_packet = function(buffer, offset)
  local index = 0

  index = index + jnx_equities_pts_ouch_v1_11_size_of.text

  return index
end

-- Display: Debug Packet
jnx_equities_pts_ouch_v1_11_display.debug_packet = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Debug Packet
jnx_equities_pts_ouch_v1_11_dissect.debug_packet_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Text: 1 Byte Ascii String
  index, text = jnx_equities_pts_ouch_v1_11_dissect.text(buffer, index, packet, parent)

  return index
end

-- Dissect: Debug Packet
jnx_equities_pts_ouch_v1_11_dissect.debug_packet = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.debug_packet then
    local length = jnx_equities_pts_ouch_v1_11_size_of.debug_packet(buffer, offset)
    local range = buffer(offset, length)
    local display = jnx_equities_pts_ouch_v1_11_display.debug_packet(buffer, packet, parent)
    parent = parent:add(jnx_equities_pts_ouch_v1_11.fields.debug_packet, range, display)
  end

  return jnx_equities_pts_ouch_v1_11_dissect.debug_packet_fields(buffer, offset, packet, parent)
end

-- Calculate runtime size of: Payload
jnx_equities_pts_ouch_v1_11_size_of.payload = function(buffer, offset, packet_type)
  -- Size of Debug Packet
  if packet_type == "+" then
    return jnx_equities_pts_ouch_v1_11_size_of.debug_packet(buffer, offset)
  end
  -- Size of Login Accepted Packet
  if packet_type == "A" then
    return jnx_equities_pts_ouch_v1_11_size_of.login_accepted_packet(buffer, offset)
  end
  -- Size of Login Rejected Packet
  if packet_type == "J" then
    return jnx_equities_pts_ouch_v1_11_size_of.login_rejected_packet(buffer, offset)
  end
  -- Size of Sequenced Data Packet
  if packet_type == "S" then
    return jnx_equities_pts_ouch_v1_11_size_of.sequenced_data_packet(buffer, offset)
  end
  -- Size of Login Request Packet
  if packet_type == "L" then
    return jnx_equities_pts_ouch_v1_11_size_of.login_request_packet(buffer, offset)
  end
  -- Size of Unsequenced Data Packet
  if packet_type == "U" then
    return jnx_equities_pts_ouch_v1_11_size_of.unsequenced_data_packet(buffer, offset)
  end

  return 0
end

-- Display: Payload
jnx_equities_pts_ouch_v1_11_display.payload = function(buffer, offset, packet, parent)
  return ""
end

-- Dissect Branches: Payload
jnx_equities_pts_ouch_v1_11_dissect.payload_branches = function(buffer, offset, packet, parent, packet_type)
  -- Dissect Debug Packet
  if packet_type == "+" then
    return jnx_equities_pts_ouch_v1_11_dissect.debug_packet(buffer, offset, packet, parent)
  end
  -- Dissect Login Accepted Packet
  if packet_type == "A" then
    return jnx_equities_pts_ouch_v1_11_dissect.login_accepted_packet(buffer, offset, packet, parent)
  end
  -- Dissect Login Rejected Packet
  if packet_type == "J" then
    return jnx_equities_pts_ouch_v1_11_dissect.login_rejected_packet(buffer, offset, packet, parent)
  end
  -- Dissect Sequenced Data Packet
  if packet_type == "S" then
    return jnx_equities_pts_ouch_v1_11_dissect.sequenced_data_packet(buffer, offset, packet, parent)
  end
  -- Dissect Login Request Packet
  if packet_type == "L" then
    return jnx_equities_pts_ouch_v1_11_dissect.login_request_packet(buffer, offset, packet, parent)
  end
  -- Dissect Unsequenced Data Packet
  if packet_type == "U" then
    return jnx_equities_pts_ouch_v1_11_dissect.unsequenced_data_packet(buffer, offset, packet, parent)
  end

  return offset
end

-- Dissect: Payload
jnx_equities_pts_ouch_v1_11_dissect.payload = function(buffer, offset, packet, parent, packet_type)
  if not show.payload then
    return jnx_equities_pts_ouch_v1_11_dissect.payload_branches(buffer, offset, packet, parent, packet_type)
  end

  -- Calculate size and check that branch is not empty
  local size = jnx_equities_pts_ouch_v1_11_size_of.payload(buffer, offset, packet_type)
  if size == 0 then
    return offset
  end

  -- Dissect Element
  local range = buffer(offset, size)
  local display = jnx_equities_pts_ouch_v1_11_display.payload(buffer, packet, parent)
  local element = parent:add(jnx_equities_pts_ouch_v1_11.fields.payload, range, display)

  return jnx_equities_pts_ouch_v1_11_dissect.payload_branches(buffer, offset, packet, parent, packet_type)
end

-- Size: Packet Type
jnx_equities_pts_ouch_v1_11_size_of.packet_type = 1

-- Display: Packet Type
jnx_equities_pts_ouch_v1_11_display.packet_type = function(value)
  if value == "+" then
    return "Packet Type: Debug Packet (+)"
  end
  if value == "A" then
    return "Packet Type: Login Accepted Packet (A)"
  end
  if value == "J" then
    return "Packet Type: Login Rejected Packet (J)"
  end
  if value == "S" then
    return "Packet Type: Sequenced Data Packet (S)"
  end
  if value == "H" then
    return "Packet Type: Server Heartbeat Packet (H)"
  end
  if value == "Z" then
    return "Packet Type: End Of Session Packet (Z)"
  end
  if value == "L" then
    return "Packet Type: Login Request Packet (L)"
  end
  if value == "U" then
    return "Packet Type: Unsequenced Data Packet (U)"
  end
  if value == "R" then
    return "Packet Type: Client Heartbeat Packet (R)"
  end
  if value == "O" then
    return "Packet Type: Logout Request Packet (O)"
  end

  return "Packet Type: Unknown("..value..")"
end

-- Dissect: Packet Type
jnx_equities_pts_ouch_v1_11_dissect.packet_type = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.packet_type
  local range = buffer(offset, length)
  local value = range:string()
  local display = jnx_equities_pts_ouch_v1_11_display.packet_type(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.packet_type, range, value, display)

  return offset + length, value
end

-- Size: Packet Length
jnx_equities_pts_ouch_v1_11_size_of.packet_length = 2

-- Display: Packet Length
jnx_equities_pts_ouch_v1_11_display.packet_length = function(value)
  return "Packet Length: "..value
end

-- Dissect: Packet Length
jnx_equities_pts_ouch_v1_11_dissect.packet_length = function(buffer, offset, packet, parent)
  local length = jnx_equities_pts_ouch_v1_11_size_of.packet_length
  local range = buffer(offset, length)
  local value = range:uint()
  local display = jnx_equities_pts_ouch_v1_11_display.packet_length(value, buffer, offset, packet, parent)

  parent:add(jnx_equities_pts_ouch_v1_11.fields.packet_length, range, value, display)

  return offset + length, value
end

-- Calculate size of: Packet Header
jnx_equities_pts_ouch_v1_11_size_of.packet_header = function(buffer, offset)
  local index = 0

  index = index + jnx_equities_pts_ouch_v1_11_size_of.packet_length

  index = index + jnx_equities_pts_ouch_v1_11_size_of.packet_type

  return index
end

-- Display: Packet Header
jnx_equities_pts_ouch_v1_11_display.packet_header = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Packet Header
jnx_equities_pts_ouch_v1_11_dissect.packet_header_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Packet Length: 2 Byte Unsigned Fixed Width Integer
  index, packet_length = jnx_equities_pts_ouch_v1_11_dissect.packet_length(buffer, index, packet, parent)

  -- Packet Type: 1 Byte Ascii String Enum with 10 values
  index, packet_type = jnx_equities_pts_ouch_v1_11_dissect.packet_type(buffer, index, packet, parent)

  return index
end

-- Dissect: Packet Header
jnx_equities_pts_ouch_v1_11_dissect.packet_header = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.packet_header then
    local length = jnx_equities_pts_ouch_v1_11_size_of.packet_header(buffer, offset)
    local range = buffer(offset, length)
    local display = jnx_equities_pts_ouch_v1_11_display.packet_header(buffer, packet, parent)
    parent = parent:add(jnx_equities_pts_ouch_v1_11.fields.packet_header, range, display)
  end

  return jnx_equities_pts_ouch_v1_11_dissect.packet_header_fields(buffer, offset, packet, parent)
end

-- Display: Soup Bin Tcp Packet
jnx_equities_pts_ouch_v1_11_display.soup_bin_tcp_packet = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Soup Bin Tcp Packet
jnx_equities_pts_ouch_v1_11_dissect.soup_bin_tcp_packet_fields = function(buffer, offset, packet, parent, size_of_soup_bin_tcp_packet)
  local index = offset

  -- Packet Header: Struct of 2 fields
  index, packet_header = jnx_equities_pts_ouch_v1_11_dissect.packet_header(buffer, index, packet, parent)

  -- Dependency element: Packet Type
  local packet_type = buffer(index - 1, 1):string()

  -- Payload: Runtime Type with 6 branches
  index = jnx_equities_pts_ouch_v1_11_dissect.payload(buffer, index, packet, parent, packet_type)

  return index
end

-- Dissect: Soup Bin Tcp Packet
jnx_equities_pts_ouch_v1_11_dissect.soup_bin_tcp_packet = function(buffer, offset, packet, parent, size_of_soup_bin_tcp_packet)
  -- Optionally add struct element to protocol tree
  if show.soup_bin_tcp_packet then
    local range = buffer(offset, size_of_soup_bin_tcp_packet)
    local display = jnx_equities_pts_ouch_v1_11_display.soup_bin_tcp_packet(buffer, packet, parent)
    parent = parent:add(jnx_equities_pts_ouch_v1_11.fields.soup_bin_tcp_packet, range, display)
  end

  jnx_equities_pts_ouch_v1_11_dissect.soup_bin_tcp_packet_fields(buffer, offset, packet, parent, size_of_soup_bin_tcp_packet)

  return offset + size_of_soup_bin_tcp_packet
end

-- Remaining Bytes For: Soup Bin Tcp Packet
local soup_bin_tcp_packet_bytes_remaining = function(buffer, index, available)
  -- Calculate the number of bytes remaining
  local remaining = available - index

  -- Check if packet size can be read
  if remaining < jnx_equities_pts_ouch_v1_11_size_of.packet_header(buffer, index) then
    return -DESEGMENT_ONE_MORE_SEGMENT
  end

  -- Parse runtime size
  local current = buffer(index, 2):uint() + 2

  -- Check if enough bytes remain
  if remaining < current then
    return -(current - remaining)
  end

  return remaining, current
end

-- Dissect Packet
jnx_equities_pts_ouch_v1_11_dissect.packet = function(buffer, packet, parent)
  local index = 0

  -- Dependency for Soup Bin Tcp Packet
  local end_of_payload = buffer:len()

  -- Soup Bin Tcp Packet: Struct of 2 fields
  while index < end_of_payload do

    -- Are minimum number of bytes are available?
    local available, size_of_soup_bin_tcp_packet = soup_bin_tcp_packet_bytes_remaining(buffer, index, end_of_payload)

    if available > 0 then
      index = jnx_equities_pts_ouch_v1_11_dissect.soup_bin_tcp_packet(buffer, index, packet, parent, size_of_soup_bin_tcp_packet)
    else
      -- More bytes needed, so set packet information
      packet.desegment_offset = index
      packet.desegment_len = -(available)

      break
    end
  end

  return index
end


-----------------------------------------------------------------------
-- Protocol Dissector and Components
-----------------------------------------------------------------------

-- Initialize Dissector
function jnx_equities_pts_ouch_v1_11.init()
end

-- Dissector for Jnx Equities Pts Ouch 1.11
function jnx_equities_pts_ouch_v1_11.dissector(buffer, packet, parent)

  -- Set protocol name
  packet.cols.protocol = jnx_equities_pts_ouch_v1_11.name

  -- Dissect protocol
  local protocol = parent:add(jnx_equities_pts_ouch_v1_11, buffer(), jnx_equities_pts_ouch_v1_11.description, "("..buffer:len().." Bytes)")
  return jnx_equities_pts_ouch_v1_11_dissect.packet(buffer, packet, protocol)
end

-- Register With Tcp Table
local tcp_table = DissectorTable.get("tcp.port")
tcp_table:add(65333, jnx_equities_pts_ouch_v1_11)


-----------------------------------------------------------------------
-- Protocol Heuristics
-----------------------------------------------------------------------

-- Verify size of packet
verify.jnx_equities_pts_ouch_v1_11_packet_size = function(buffer)

  return true
end

-- Dissector Heuristic for Jnx Equities Pts Ouch 1.11
local function jnx_equities_pts_ouch_v1_11_heuristic(buffer, packet, parent)
  -- Verify packet length
  if not verify.jnx_equities_pts_ouch_v1_11_packet_size(buffer) then return false end

  -- Protocol is valid, set conversation and dissect this packet
  packet.conversation = jnx_equities_pts_ouch_v1_11
  jnx_equities_pts_ouch_v1_11.dissector(buffer, packet, parent)

  return true
end

-- Register Heuristic for Jnx Equities Pts Ouch 1.11
jnx_equities_pts_ouch_v1_11:register_heuristic("tcp", jnx_equities_pts_ouch_v1_11_heuristic)

-----------------------------------------------------------------------
-- Lua dissectors are an easily edited and modified cross platform dissection solution.
-- Feel free to modify. Enjoy.
-----------------------------------------------------------------------
-- 
-- Protocol:
--   Organization: Japannext
--   Version: 1.11
--   Date: Thursday, March 9, 2023
--   Specification: Japannext_PTS_OUCH_Equities_v1.11.pdf
-- 
-- Script:
--   Generator: 1.5.0.0
--   Compiler: 2.0
--   License: Public/GPLv3
--   Authors: Omi Developers
-- 
-- This script was generated by the Open Markets Initiative (Omi).
-- 
-- For full Omi information:
-- https://github.com/Open-Markets-Initiative/Directory
-----------------------------------------------------------------------
