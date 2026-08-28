-- =============================================================
-- Case ID: TC_GROUP_CONSTITUENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_CONSTITUENT
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_constituent ::= name | character_literal
-- Case Type: Positive
-- Test Focus: Exercises group_constituent syntax variant 4 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity group_constituent_syn4 is
  port (
    a, b : in  bit;
    y    : out bit
  );
end entity group_constituent_syn4;

architecture rtl of group_constituent_syn4 is
  group sig_pair is (signal, signal);
  signal s_a, s_b : bit;
  group g_inputs : sig_pair (s_a, s_b);
begin
  s_a <= a; s_b <= b;
  y <= s_a xor s_b;
end architecture rtl;
