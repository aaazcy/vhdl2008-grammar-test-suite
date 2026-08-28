-- =============================================================
-- Case ID: TC_GROUP_DECLARATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_declaration ::= group identifier : group_template_name ( group_constituent_list ) ;
-- Case Type: Positive
-- Test Focus: Exercises group_declaration syntax variant 5 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity group_declaration_syn5 is
  port (
    a, b : in  bit;
    y    : out bit
  );
end entity group_declaration_syn5;

architecture rtl of group_declaration_syn5 is
  group sig_pair is (signal, signal);
  signal s_a, s_b : bit;
  group g_inputs : sig_pair (s_a, s_b);
begin
  s_a <= a; s_b <= b;
  y <= s_a xor s_b;
end architecture rtl;
