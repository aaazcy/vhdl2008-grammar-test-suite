-- =============================================================
-- Case ID: TC_GROUP_CONSTITUENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_CONSTITUENT
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_constituent ::= name | character_literal
-- Case Type: Positive
-- Test Focus: group_constituent: name form — signal names as constituents in a group declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gc_name_constituent_syn is
  port (
    strobe_out : out bit;
    ack_out    : out bit
  );
end entity gc_name_constituent_syn;

architecture focused of gc_name_constituent_syn is
  group signal_pair is (signal, signal <>);
  signal s_strobe : bit := '0';
  signal s_ack    : bit := '0';
  group handshake : signal_pair (s_strobe, s_ack);
begin
  s_strobe <= not s_strobe after 10 ns;
  s_ack    <= s_strobe after 2 ns;
  strobe_out <= s_strobe;
  ack_out    <= s_ack;
end architecture focused;
