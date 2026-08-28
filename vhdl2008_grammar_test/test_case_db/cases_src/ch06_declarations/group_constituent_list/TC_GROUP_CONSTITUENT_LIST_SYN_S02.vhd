-- =============================================================
-- Case ID: TC_GROUP_CONSTITUENT_LIST_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_CONSTITUENT_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_constituent_list ::= group_constituent { , group_constituent }
-- Case Type: Positive
-- Test Focus: Production-specific: exercises group_constituent_list with multiple signal names in a group declaration.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity group_constituent_list_syn_s2 is
  port (
    a, b, c : in  bit;
    y       : out bit
  );
end entity group_constituent_list_syn_s2;

architecture rtl of group_constituent_list_syn_s2 is
  group sig_group is (signal, signal, signal);
  signal s1, s2, s3 : bit;
  group g_sigs : sig_group (s1, s2, s3);
begin
  s1 <= a; s2 <= b; s3 <= c;
  y <= s1 xor s2 xor s3;
end architecture rtl;
