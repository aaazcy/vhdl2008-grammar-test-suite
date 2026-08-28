-- =============================================================
-- Case ID: TC_CONDITION_OPERATOR_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: condition_operator ::= ??
-- Case Type: Negative
-- Test Focus: SNN: ?? applied to the integer type — attempting to apply ?? to a plain integer signal, verifying that the implicit conversion of condition_operator applies only to logic types (bit/std_logic and their arrays); integer cannot be an operand of ??
-- Expected Result: Triggers semantic error: ?? condition_operator not defined for integer type
-- Dependencies: None
-- =============================================================
entity ent_snn_co_int is
  port (
    val_i : in  integer;
    y_o   : out integer
  );
end entity ent_snn_co_int;

architecture rtl of ent_snn_co_int is
begin
  -- ERROR: ?? condition_operator requires bit/std_logic/boolean type
  y_o <= 1 when ?? val_i else 0;
end architecture rtl;
