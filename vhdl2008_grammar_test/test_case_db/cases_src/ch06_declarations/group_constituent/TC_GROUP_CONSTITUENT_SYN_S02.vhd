-- =============================================================
-- Case ID: TC_GROUP_CONSTITUENT_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_CONSTITUENT
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_constituent ::= name | character_literal
-- Case Type: Positive
-- Test Focus: Production-specific: exercises group_constituent with signal names as constituents in a group declaration.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity group_constituent_syn_s2 is
  port (
    clk : in bit;
    a, b : in bit;
    y : out bit
  );
end entity group_constituent_syn_s2;

architecture rtl of group_constituent_syn_s2 is
  group op_signals is (signal, signal);
  signal s_a, s_b : bit;
  group g_ops : op_signals (s_a, s_b);
begin
  s_a <= a; s_b <= b;
  y <= s_a xor s_b;
end architecture rtl;
