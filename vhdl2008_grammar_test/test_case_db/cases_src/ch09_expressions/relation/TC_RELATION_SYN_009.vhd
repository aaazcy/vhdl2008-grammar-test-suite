-- =============================================================
-- Case ID: TC_RELATION_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relation ::= shift_expression [ relational_operator shift_expression ]
-- Case Type: Positive
-- Test Focus: complex LHS/RHS: the shift_expression operands are expressions containing sll/srl shifts, and both sides are complex compared operands
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rel_complex_ent is
  port(data_a, data_b : in bit_vector(7 downto 0); sh : in integer; r : out boolean);
end entity;
architecture rtl of rel_complex_ent is
begin
  r <= (data_a sll sh) = (data_b srl 1);
end architecture rtl;
