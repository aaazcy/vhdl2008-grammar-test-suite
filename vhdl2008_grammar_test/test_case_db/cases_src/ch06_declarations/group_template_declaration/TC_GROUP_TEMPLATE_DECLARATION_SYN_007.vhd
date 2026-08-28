-- =============================================================
-- Case ID: TC_GROUP_TEMPLATE_DECLARATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_TEMPLATE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_template_declaration ::= group identifier is ( entity_class_entry_list ) ;
-- Case Type: Positive
-- Test Focus: Exercises group_template_declaration syntax variant 7 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity group_template_declaratio_syn7 is
  port (
    a, b : in  bit;
    y    : out bit
  );
end entity group_template_declaratio_syn7;

architecture rtl of group_template_declaratio_syn7 is
  group sig_pair is (signal, signal);
  signal s_a, s_b : bit;
  group g_inputs : sig_pair (s_a, s_b);
begin
  s_a <= a; s_b <= b;
  y <= s_a xor s_b;
end architecture rtl;
