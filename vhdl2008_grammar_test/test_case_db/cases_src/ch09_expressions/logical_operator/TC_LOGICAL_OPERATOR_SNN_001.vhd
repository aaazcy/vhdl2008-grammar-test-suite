-- =============================================================
-- Case ID: TC_LOGICAL_OPERATOR_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_LOGICAL_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: logical_operator ::= and | or | nand | nor | xor | xnor
-- Case Type: Negative
-- Test Focus: SNN: missing logical_operator — the expression "a b" has no logical operator between the two signal names, verifying that in the BNF logical expression relation { and relation } the logical_operator between two relations cannot be omitted, juxtaposing two operands directly is illegal
-- Expected Result: Triggers syntax error: missing logical_operator between operands
-- Dependencies: None
-- =============================================================
entity ent_missing_op is
  port (
    a_i : in  bit;
    b_i : in  bit;
    y_o : out bit
  );
end entity ent_missing_op;

architecture rtl of ent_missing_op is
begin
  -- ERROR: missing logical_operator between operands a_i and b_i
  y_o <= a_i b_i;
end architecture rtl;
