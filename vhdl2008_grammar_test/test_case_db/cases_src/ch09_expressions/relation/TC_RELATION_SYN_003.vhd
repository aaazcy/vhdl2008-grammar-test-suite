-- =============================================================
-- Case ID: TC_RELATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relation ::= shift_expression [ relational_operator shift_expression ]
-- Case Type: Positive
-- Test Focus: /= inequality operator: compares the combined per-bit results of two vectors to determine complete inequality
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rel_ne_ent is
  port(x, y : in bit_vector(7 downto 0); diff : out boolean);
end entity;
architecture rtl of rel_ne_ent is
begin
  diff <= x /= y;
end architecture rtl;
